// Gemeinsame Vorlage: Farben, Boxen und Quiz-Funktionen
// Wird sowohl von Medizin_II_Skript.typ als auch von allen Kapitel-Dateien importiert.

#let accent = rgb("#1d4e89")   // Blau: Definitionen
#let accent2 = rgb("#0f7a3d")  // Grün: Lösungen
#let accent3 = rgb("#b5560a")  // Orange: Merke

// Jede Funktion unten verzweigt per `target()` zwischen dem PDF-Pfad (unverändert,
// farbige Boxen via block()) und einem HTML-Pfad, der klassenversehene <div>/<p>-
// Elemente über html.elem() ausgibt. Typst verwirft Stil-Properties (fill, size, ...)
// beim HTML-Export ohnehin lautlos; das gesamte visuelle System der Web-Version kommt
// stattdessen aus dem separaten CSS (siehe docs/superpowers/specs/...-design.md).

#let definition(title: none, body) = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "callout callout-definition"))[
      #if title != none [#html.elem("strong", attrs: (class: "callout-title"))[#title]]
      #body
    ]
  } else {
    block(
      fill: rgb("#eef4fb"),
      stroke: (left: 3pt + accent),
      inset: 10pt,
      radius: 4pt,
      width: 100%,
      breakable: true,
    )[#if title != none [*#title* #linebreak()] #body]
  }
}

#let merke(body) = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "callout callout-merke"))[
      #html.elem("strong", attrs: (class: "callout-title"))[Merke:]
      #body
    ]
  } else {
    block(
      fill: rgb("#fff6e5"),
      stroke: (left: 3pt + accent3),
      inset: 10pt,
      radius: 4pt,
      width: 100%,
      breakable: true,
    )[*Merke:* #body]
  }
}

#let qcounter = counter("quiz")
#let quizstart() = qcounter.update(0)

// Zählt #quizblock()-Aufrufe global durch (nie zurückgesetzt). Nötig, weil einzelne
// Kapitel (z. B. Kapitel 12) mehrere #quizblock()-Aufrufe enthalten können, die je für
// sich bei "Frage 1" neu zu zählen beginnen (qcounter) — ohne diesen zweiten Zähler
// würden zwei Quizblöcke im selben Kapitel identische quizid()-Werte erzeugen.
#let blockcounter = counter("quizblockindex")

// Stabile Frage-ID "ch<Kapitelnummer>-b<Blockindex>-q<Fragenindex>", z. B. "ch2-b3-q1".
// Basiert auf Typsts eigenem Heading-Counter und blockcounter (nicht auf einem globalen
// Fragenzähler), damit das Einfügen oder Löschen von Fragen in einem Kapitel die IDs
// anderer Kapitel nicht verschiebt.
#let quizid() = {
  let chnum = counter(heading).at(here()).first()
  let blockidx = blockcounter.at(here()).first()
  "ch" + str(chnum) + "-b" + str(blockidx) + "-q" + str(qcounter.display())
}

#let frage(q) = {
  qcounter.step()
  context {
    if target() == "html" {
      html.elem("p", attrs: (class: "quiz-question", "data-qid": quizid()))[*Frage #qcounter.display():* #q]
    } else {
      block(above: 0.9em, below: 0.35em, breakable: true)[*Frage #qcounter.display():* #q]
    }
  }
}

#let antwort(body) = context {
  if target() == "html" {
    html.elem("div", attrs: (class: "quiz-answer", "data-qid": quizid()))[*Lösung:* #body]
  } else {
    block(
      fill: rgb("#eafbee"),
      stroke: (left: 3pt + accent2),
      inset: 8pt,
      radius: 4pt,
      width: 100%,
      breakable: true,
    )[*Lösung:* #body]
  }
}

#let quizblock(title: "Quiz", body) = {
  quizstart()
  blockcounter.step()
  context {
    let chnum = counter(heading).at(here()).first()
    if target() == "html" {
      html.elem("section", attrs: (class: "quiz-section", "data-chapter": str(chnum)))[
        == #title
        #body
      ]
    } else {
      block(breakable: true)[
        #v(0.4em)
        #line(length: 100%, stroke: 0.6pt + gray)
        == #title
        #body
      ]
    }
  }
}

#let teil(nr, title, desc) = {
  pagebreak(weak: true)
  heading(numbering: none, outlined: true)[#text(fill: rgb("#1d4e89"))[Teil #nr — #title]]
  context {
    if target() == "html" {
      html.elem("p", attrs: (class: "teil-desc"))[#desc]
    } else {
      text(style: "italic", size: 10.5pt)[#desc]
    }
  }
  v(0.5em)
}
