# Interactive HTML Lernskript — Design

## Purpose

The Typst source (`Medizin_II_Skript.typ` + `kapitel/*.typ`) already builds a PDF via GitLab CI. This spec adds a second build output: a single, self-contained HTML file that renders the same chapter content in a browser with an interactive, click-to-reveal quiz and localStorage-backed self-rated progress tracking. No slides are added — the existing Definition/Merke callout boxes already serve as the dense, exam-relevant takeaways a slide deck would otherwise duplicate with less information density.

## Non-goals

- Spaced-repetition scheduling (SM-2 or similar). Out of scope — this is a chapter reader with an inline quiz, not a flashcard/drill app.
- A hosted/server version. The output is a local file opened via `file://`; no server, no sync backend.
- Slide generation.
- Search across chapters (nice-to-have, not required for v1).

## Architecture

One Typst source, two build outputs:

- **PDF** (existing, unchanged): `typst compile Medizin_II_Skript.typ Medizin_II_Skript.pdf`, built in the current GitLab CI job.
- **HTML** (new): `typst compile --features html -f html Medizin_II_Skript.typ web/_body.html`, followed by a wrapper script that inlines that body into a static HTML template (CSS + JS embedded, no external assets) to produce `Medizin_II_Lernskript.html`.

This was validated directly: `typst compile --features html -f html Medizin_II_Skript.typ` against the real document produces clean semantic markup (`h2/h3/h4` headings, `p`, `ul/ol/li`, `table/thead/tbody/tr/td/th`, `strong`, `a`) with exit code 0. No custom Typst-markup parser is needed — Typst's own HTML backend does the parsing.

### `vorlage.typ` changes

The four custom content functions become target-aware using Typst's `context { if target() == "html" { ... } else { ... } }` pattern (validated working in a standalone smoke test):

- `definition()`, `merke()` — PDF branch: unchanged colored `block(...)` styling. HTML branch: `html.elem("div", attrs: (class: "definition"))` / `class: "merke"`.
- `frage()`, `antwort()` — same target split, plus each question gets a **stable ID**: `"<chapter-slug>-q<index-within-chapter>"` (e.g. `02-immunologie-q3`), not a global sequential counter. This means inserting or deleting a question in one chapter does not shift the IDs — and therefore the saved progress — of questions in other chapters or later in the same chapter beyond the insertion point is the one acceptable exception (see Risks).
- `quizblock()` — HTML branch wraps the whole block in a `<section class="quiz" data-chapter="...">` so the reveal/rating JS can scope its queries per chapter.

The PDF output must remain pixel-identical after these changes — verified by rebuilding the PDF and comparing against the current tracked output.

## Content structure in the browser

- **Reader**: full chapter text rendered as Typst's HTML export produces it (headings, paragraphs, tables, lists), styled to match the PDF's visual language (colors from `vorlage.typ`'s `accent`/`accent2`/`accent3`).
- **Definition boxes**: blue-bordered callout, `class="definition"`.
- **Merke boxes**: orange-bordered callout, `class="merke"`.
- **Quiz questions**: each `frage`/`antwort` pair renders as:
  1. Question text.
  2. "Antwort anzeigen" button. Click toggles a hidden `class="antwort"` div into view (pure CSS class toggle, no re-render).
  3. Once revealed, three self-rating buttons appear: ✖ nochmal / ✓ weiß ich / ★ sicher.
  4. Clicking a rating button writes to progress state (see below) and visually marks the question with its rating color, persisting across reloads.

## Navigation

- Fixed left sidebar generated from the existing chapter/Teil structure (Teil A/B/C headings from `vorlage.typ`'s `teil()`), listing all 12 chapters.
- Scroll-spy highlights the currently visible chapter in the sidebar as the user scrolls the single long page.
- Each sidebar chapter entry shows a small mastery indicator, e.g. "24/37 sicher", computed from progress state at render/update time.
- A top-level summary bar shows the overall count across all chapters (e.g. "62/136 sicher").

## Progress storage

- All progress lives in **one** `localStorage` key (e.g. `medizin2-progress`) holding a single JSON blob: `{ [questionId]: { rating: "again" | "know" | "sure", ts: <ISO string> } }`. One key (not one per question) keeps export/import trivial and avoids polluting `localStorage` with hundreds of entries.
- **Export/Import controls** in the page header: "Fortschritt exportieren" downloads the current blob as `medizin2-fortschritt.json`; "Fortschritt importieren" opens a file picker, parses the JSON, and merges/replaces the stored blob. This exists specifically because `localStorage` on `file://` pages behaves inconsistently across browsers and can be cleared by routine browser maintenance — the export file is the durable backup.
- No other client-side storage (no cookies, no IndexedDB) — the single JSON blob is sufficient for this scope.

## Build workflow

- New script (e.g. `web/build.sh`) runs the two-step compile-then-wrap process described above and writes `Medizin_II_Lernskript.html` to the repo root (or a `web/` output dir — implementation detail for the plan phase).
- `.gitignore` gets a new entry for the generated HTML file, mirroring the existing PDF exclusion, since it's a build artifact.
- Whether this build step is added to `.gitlab-ci.yml` as a second artifact (alongside the PDF) or stays local-only is an implementation detail to confirm during planning; recommendation is to add it for consistency with the existing pipeline, at negligible extra CI cost.

## Risks / open edge cases

- **Typst HTML export is explicitly experimental** (`--features html` prints a warning that behavior may change). Pinning the Typst version already used for the PDF build avoids surprise breakage; upgrading Typst later should include a re-check of the HTML output.
- **Stable IDs still shift within a chapter** if a question is inserted or deleted in the middle of that chapter's quiz block (later questions in the same chapter renumber). This is accepted as a known, low-impact edge case — cross-chapter stability is what matters most, and within-chapter reordering is rare relative to appending new questions at the end.
- **`file://` localStorage variance across browsers** is mitigated, not eliminated, by the export/import feature — a user who never exports and clears browser data will still lose in-browser progress.

## Testing / verification

- Rebuild the PDF after `vorlage.typ` changes and confirm no visual diff (still 81 pages, boxes still colored as before).
- Build the HTML file and open via `file://` in at least one browser: verify chapter text renders, Definition/Merke boxes are styled, quiz reveal/rating flow works, ratings persist across a reload, and export/import round-trips correctly.
- Spot-check sidebar scroll-spy and per-chapter mastery counts update after rating a few questions.
