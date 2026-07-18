// Medizin II – Einführung in die Medizinische Informatik
// Kompaktes Lernskript mit Kapitel-Quizzes
// Erstellt als Lernhilfe auf Basis der Vorlesungsfolien (Sommersemester)

#set page(paper: "a4", margin: (x: 2.2cm, y: 2.5cm), numbering: "1", number-align: center)
#set text(lang: "de", size: 10.5pt)
#set par(justify: true, leading: 0.62em)
#set heading(numbering: "1.1")
#show heading.where(level: 1): it => {
  pagebreak(weak: true)
  v(0.4em)
  text(size: 19pt, weight: "bold", fill: rgb("#1d4e89"))[#it]
  v(0.6em)
}
#show heading.where(level: 2): it => {
  v(0.6em)
  text(size: 13.5pt, weight: "bold", fill: rgb("#1d4e89"))[#it]
  v(0.2em)
}
#show heading.where(level: 3): it => {
  text(size: 11.5pt, weight: "bold", style: "italic")[#it]
}
#show link: it => text(fill: rgb("#1d4e89"), it)

#import "vorlage.typ": *

// ==================== Titelseite ====================
// Typsts HTML-Export verwirft den gesamten Inhalt von #align()-Blöcken (nicht nur die
// Ausrichtung), daher hier ein eigener HTML-Zweig ohne align(); die Zentrierung
// übernimmt im Web-Build stattdessen das CSS.
#context {
  if target() == "html" {
    html.elem("header", attrs: (class: "titlepage"))[
      #html.elem("h1", attrs: (class: "title"))[Medizin II]
      #html.elem("p", attrs: (class: "subtitle"))[Einführung in die Medizinische Informatik]
      #html.elem("p", attrs: (class: "tagline"))[Kompaktes Lernskript zum Durcharbeiten mit Kapitel-Quizzes im Klausurstil]
      #html.elem("p", attrs: (class: "disclaimer"))[
        Basierend auf den Vorlesungsfolien (TUM, Lehrstuhl für Medizinische Informatik)
        und Altklausur-Gedächtnisprotokollen. Kein offizielles Vorlesungsmaterial —
        dient als ergänzende Lernhilfe und ersetzt nicht den Besuch der Vorlesung.
      ]
    ]
  } else {
    align(center)[
      #v(2.8cm)
      #text(size: 24pt, weight: "bold")[Medizin II]
      #v(0.3cm)
      #text(size: 15pt)[Einführung in die Medizinische Informatik]
      #v(1.2cm)
      #line(length: 40%, stroke: 1pt + accent)
      #v(1.2cm)
      #text(size: 13pt, style: "italic")[Kompaktes Lernskript zum Durcharbeiten \ mit Kapitel-Quizzes im Klausurstil]
      #v(3.5cm)
      #text(size: 10pt, fill: gray)[
        Basierend auf den Vorlesungsfolien (TUM, Lehrstuhl für Medizinische Informatik) \
        und Altklausur-Gedächtnisprotokollen. Kein offizielles Vorlesungsmaterial — \
        dient als ergänzende Lernhilfe und ersetzt nicht den Besuch der Vorlesung.
      ]
    ]
  }
}

#pagebreak()

#heading(level: 2, numbering: none)[Wie benutzt man dieses Skript?]

Dieses Skript fasst den Stoff der Vorlesung *Medizin II* in zehn Kapiteln zusammen und ist in zwei
inhaltliche Teile gegliedert: *Teil A* behandelt medizinische Grundlagen (Krankheitslehre, Immunologie,
Onkologie, Kardiologie), *Teil B* die medizinische Informatik (Informationssysteme, Dokumentation,
Datenschutz, Architektur, Standards). Kapitel 11 verknüpft beide Teile und Kapitel 12 enthält ein
kombiniertes Altklausur-Training.

Empfohlenes Vorgehen pro Kapitel:
+ Text einmal am Stück lesen, um den roten Faden zu verstehen.
+ Blaue Kästen (*Definitionen*) und orangene Kästen (*Merke*) besonders beachten — das sind die
  Kernaussagen, die in Klausuren typischerweise abgefragt werden.
+ Am Kapitelende das *Quiz* bearbeiten, *bevor* man die grünen Lösungskästen liest. Die Fragen sind
  im Stil echter Klausurfragen formuliert (kurze, konkrete Aufzählungs- und Erklärfragen).
+ Bei Unsicherheit den entsprechenden Abschnitt erneut lesen und die Frage nach ein paar Tagen
  wiederholen (Spaced Repetition).

#pagebreak()
// Im Web-Build übernimmt eine JS-generierte Sidebar die Navigation (siehe web/); Typsts
// eigenes outline() wird dort nicht gebraucht.
#context if target() != "html" {
  outline(indent: auto, title: "Inhaltsverzeichnis")
}

// ==================== Teil A: Medizinische Grundlagen ====================
#teil("A", "Medizinische Grundlagen", "Krankheitslehre, Immunologie, Onkologie und Kardiologie")

#include "kapitel/01_einfuehrung.typ"
#include "kapitel/02_immunologie.typ"
#include "kapitel/03_tumore.typ"
#include "kapitel/04_herzkreislauf.typ"
#include "kapitel/05_herzinsuffizienz.typ"

// ==================== Teil B: Medizinische Informatik ====================
#teil("B", "Medizinische Informatik", "Informationssysteme, Dokumentation, Datenschutz, Architektur und Standards")

#include "kapitel/06_akte.typ"
#include "kapitel/07_dokumentation.typ"
#include "kapitel/08_datenschutz.typ"
#include "kapitel/09_architektur.typ"
#include "kapitel/10_standards.typ"

// ==================== Teil C: Abschluss ====================
#teil("C", "Abschluss", "Das große Ganze und Altklausur-Training")

#include "kapitel/11_zusammenfassung.typ"
#include "kapitel/12_altklausuren.typ"
