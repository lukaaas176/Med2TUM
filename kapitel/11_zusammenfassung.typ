#import "../vorlage.typ": *

= Kapitel 11: Das große Ganze — Zusammenhänge zwischen den Kapiteln

Die Vorlesung *Medizin II* wirkt auf den ersten Blick wie zwei getrennte Fächer: Im ersten Teil geht
es um Krankheitslehre, Immunologie, Tumore und Herz-Kreislauf-Medizin, im zweiten Teil um
Informationssysteme, Standards und Datenschutz. Tatsächlich hängen beide Teile eng zusammen — die
klinische Medizin liefert den *Inhalt*, den die medizinische Informatik strukturiert, speichert,
austauschbar macht und schützt. Dieses Kapitel fasst noch einmal die Schwerpunkte zusammen und zeigt
die Verbindungslinien auf, bevor es im Trainingskapitel an die Altklausuren geht.

== Von der Diagnose zur strukturierten Information

Jede Untersuchung aus Teil A — eine Entzündung (Kapitel 1), ein Tumorbefund (Kapitel 3), ein
Herzinfarkt (Kapitel 4) — erzeugt Befunde, Diagnosen und Therapiemaßnahmen. Genau diese Inhalte sind
es, die laut Kapitel 6 die Patientenakte bzw. elektronische Patientenakte (EPA) füllen. Damit diese
Inhalte nicht nur lesbar, sondern auch maschinell auswertbar, vergleichbar und abrechenbar sind,
werden sie mit *Ordnungssystemen* verschlüsselt (Kapitel 7): Eine Diagnose wird zu einem ICD-Code,
eine Prozedur zu einem OPS-Code, und aus beidem zusammen entsteht über die DRG-Systematik die
Grundlage für die Krankenhausabrechnung.

#merke[Der rote Faden des zweiten Vorlesungsteils lässt sich so zusammenfassen: *Begriff
  Informationssystem → Inhalte der Akte → Ordnungssysteme (Terminologie/Klassifikation/Ontologie) →
  Standards für den Austausch (HL7, DICOM, IHE) → Datenschutz für den verantwortungsvollen Umgang.*
  Wer diese Kette versteht, kann die meisten Klausurfragen des Technik-Teils einordnen.]

== Vom Begriff Informationssystem zur Architektur

Ein *Informationssystem* (Kapitel 6) besteht nach Stair/Reynolds bzw. Krcmar aus Menschen, Prozeduren,
Hardware, Software und Datenbanken. Ein Krankenhausinformationssystem (KIS) ist in der Praxis kein
einzelnes Programm, sondern ein Verbund vieler solcher Teilsysteme (Admin-System, Radiologiesystem,
Laborsystem, …) — man spricht von "Best-of-Breed" (Kapitel 9). Weil jedes Teilsystem autonom entwickelt
und betrieben wird (Design-, Kommunikations- und Ausführungsautonomie), entsteht zwangsläufig
*Heterogenität*. Diese Heterogenität wird durch Integration überwunden: entweder durch ein zentrales
Repository, ein virtuelles/föderiertes Repository oder eine Hybridform, häufig vermittelt über einen
*Kommunikationsserver*, der die Nachrichten zwischen den Teilsystemen austauscht.

== Von der Ordnung zum Austausch: Standards

Damit unterschiedliche Systeme Informationen überhaupt austauschen können, braucht es gemeinsame
Sprachen. Kapitel 7 und 10 behandeln zwei Arten von Standards:

- *Terminologische/ontologische Standards* legen fest, wie einzelne Begriffe kodiert werden — z. B.
  ICD und OPS (abrechnungsorientiert, einachsig) oder SNOMED CT (hierarchisch, mehrsprachig, für den
  klinischen Informationsaustausch).
- *Kommunikationsstandards* legen fest, wie ganze Nachrichten zwischen Systemen aufgebaut und
  übertragen werden — allen voran HL7 (v2, v3/CDA, FHIR) für allgemeine klinische Daten und DICOM für
  Bilddaten. IHE-Integrationsprofile beschreiben schließlich, wie diese Standards in konkreten
  Arbeitsabläufen (z. B. Radiologie-Workflow) kombiniert eingesetzt werden.

== Vom Austausch zum Schutz der Daten

Je mehr Gesundheitsdaten elektronisch gespeichert und ausgetauscht werden, desto wichtiger wird der
*Datenschutz* (Kapitel 8). Die Prinzipien des Datenschutzes, die Unterscheidung zwischen
Pseudonymisierung und Anonymisierung sowie die technischen und organisatorischen Maßnahmen (TOM)
sorgen dafür, dass der Nutzen der elektronischen Akte (schneller Zugriff, bessere Auswertbarkeit) nicht
zulasten der Patientinnen und Patienten geht. Die deutsche Telematikinfrastruktur mit eGK, ePA und
E-Rezept ist die konkrete technische Umsetzung dieses Spannungsfelds zwischen Verfügbarkeit und
Schutz.

== Prüfungsschema zum Wiederholen

Die folgende Tabelle fasst zusammen, welches Kapitel welche Rolle in der Gesamtkette spielt — nützlich
als letzte Wiederholung vor der Klausur.

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + gray,
  inset: 6pt,
  table.header([*Kapitel*], [*Rolle im großen Ganzen*]),
  [1 – Krankheitslehre], [Grundbegriffe, die jede Dokumentation nutzt (Diagnose, Verlauf, Vitalparameter)],
  [2 – Immunologie], [Grundlage für Entzündung und Infektionsabwehr als Krankheitsursache],
  [3 – Tumore], [Beispiel für komplexe, klassifikationspflichtige Diagnosen (TNM, ICD-O)],
  [4/5 – Kardiologie], [Typische Inhalte, die in Akte und Abrechnung (ICD/OPS/DRG) landen],
  [6 – Akte], [Wo klinische Inhalte gesammelt werden: die (elektronische) Patientenakte],
  [7 – Dokumentation], [Wie Inhalte kodiert werden: Terminologien, Klassifikationen, Ontologien],
  [8 – Datenschutz], [Wie die gespeicherten Daten geschützt werden],
  [9 – Architektur], [Wie viele Teilsysteme trotz Heterogenität zusammenarbeiten],
  [10 – Standards], [Womit Systeme konkret Nachrichten und Bilder austauschen (HL7, DICOM, IHE)],
)

#quizblock(title: "Quiz: Das große Ganze")[
  #frage[Nennen Sie die fünf Schritte der Kette von der klinischen Diagnose bis zum geschützten Datenaustausch, wie sie in diesem Kapitel beschrieben wurde.]
  #antwort[Begriff Informationssystem → Inhalte der Akte (Patientenakte/EPA) → Ordnungssysteme (Terminologie/Klassifikation/Ontologie, z. B. ICD/OPS) → Standards für den Austausch (HL7, DICOM, IHE) → Datenschutz (Pseudonymisierung/Anonymisierung, TOM, Telematikinfrastruktur).]

  #frage[Warum führt der Aufbau eines KIS aus vielen autonomen Teilsystemen zwangsläufig zu Integrationsaufwand?]
  #antwort[Weil jedes Teilsystem unabhängig entwickelt wird (Design-, Kommunikations- und Ausführungsautonomie) und dadurch Heterogenität entsteht, die erst durch Integrationsansätze (zentrales/virtuelles Repository, Kommunikationsserver) überwunden werden muss.]

  #frage[Nennen Sie je ein Beispiel für einen terminologischen und einen Kommunikationsstandard und erklären Sie den Unterschied.]
  #antwort[Terminologisch: ICD (kodiert einzelne Diagnosebegriffe). Kommunikation: HL7 (definiert den Aufbau ganzer Nachrichten zwischen Systemen, z. B. bei einer Patientenaufnahme).]

  #frage[Wie hängen die Inhalte der elektronischen Patientenakte (Kapitel 6) mit der DRG-Abrechnung (Kapitel 7) zusammen?]
  #antwort[Diagnosen und Prozeduren aus der Akte werden über ICD- bzw. OPS-Codes kodiert; die Kombination aus Diagnosen und Prozeduren ergibt über die DRG-Systematik die Grundlage für die Krankenhausabrechnung.]

  #frage[Warum ist Datenschutz gerade im Kontext der elektronischen Akte (im Vergleich zur Papierakte) ein größeres Thema?]
  #antwort[Weil elektronische Akten leichter kopierbar, durchsuchbar und über Netzwerke (z. B. die Telematikinfrastruktur) austauschbar sind als Papierakten, wodurch das Risiko unbefugten Zugriffs und großflächigen Datenmissbrauchs steigt — technische und organisatorische Maßnahmen sowie Pseudonymisierung/Anonymisierung sollen dem entgegenwirken.]
]
