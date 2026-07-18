#import "../vorlage.typ": *

= Kapitel 10: IT-Standards in der Medizin: DICOM, HL7 und IHE

Damit medizinische IT-Systeme unterschiedlicher Hersteller und Abteilungen miteinander kommunizieren können, braucht es verbindliche Standards. Dieses Kapitel behandelt die drei für die Klausur zentralen Standards -- DICOM für Bilddaten, HL7 für den allgemeinen Nachrichtenaustausch sowie IHE als Rahmenwerk zur koordinierten Nutzung beider Standards -- und ergänzt sie um die wichtigsten terminologischen und ontologischen Standards.

== Technische Standards (Überblick)

Bevor auf die eigentlichen medizinischen Standards eingegangen wird, ein kurzer Blick auf die technische Basis, auf der Krankenhausinformationssysteme (KIS) typischerweise aufgebaut sind:

- *Netz:* Kommunikation erfolgt über TCP/IP, das Standardprotokoll für Rechnernetze.
- *Server:* Als Betriebssysteme kommen meist UNIX oder Windows zum Einsatz.
- *DBMS (Datenbankmanagementsystem):* Die Datenhaltung erfolgt relational bzw. objektrelational.
- *Clients:* Auf Anwenderseite dominiert Windows.

Diese technische Basis ist die Voraussetzung dafür, dass darüber die fachspezifischen Standards wie DICOM und HL7 überhaupt Daten austauschen können.

== DICOM (Digital Imaging and Communications in Medicine)

=== Allgemeine Informationen

DICOM steht für *D*igital *I*maging and *Co*mmunications in *M*edicine. Der Standard wurde 1982 von einer Arbeitsgruppe des American College of Radiology (ACR) gemeinsam mit der National Electrical Manufacturers Association (NEMA) gegründet.

#definition(title: "DICOM:")[
DICOM ist ein internationaler und offener Standard zum Übertragen, Speichern, Abrufen, Drucken, Verarbeiten und Anzeigen medizinischer Bilddaten und der dazugehörigen Informationen. Für jedes DICOM-kompatible Gerät muss eine exakte Beschreibung der Systemfähigkeit (Conformance Statement) vorhanden und veröffentlicht sein.
]

Eingesetzt wird DICOM vor allem zur Anbindung bildgebender Modalitäten -- also Geräten wie Magnetresonanztomograph (MRT), Computertomograph (CT), Ultraschallgerät etc. -- an das Krankenhausinformationssystem (KIS). Ein praktisches Problem in der Anwendung: Hersteller weichen das Format hin und wieder bewusst vom Standard ab, was die Interoperabilität in der Praxis erschweren kann.

DICOM organisiert Daten in einem sogenannten *Real World Information Model*, das hierarchisch in vier Stufen unterteilt ist: Patient, Studie, Serie und Instanz. Jede Instanz (z.B. ein einzelnes Bild) trägt somit alle Informationen, um sie eindeutig einer Serie, einer Studie (Aufenthalt bzw. Untersuchung) und einem Patienten zuzuordnen.

=== Beispiel: DICOM-Tags

Attribute innerhalb eines DICOM-Objekts werden über *Tags* identifiziert. Ein Tag hat das Format (XXXX,XXXX) und besteht aus zwei hexadezimalen Zahlen (Group und Element). Zusätzlich beschreibt eine *DICOM-Wertrepräsentation* (VR, Value Representation) den Datentyp und das Format des jeweiligen Attributwertes -- also beispielsweise, ob es sich um Text, eine Zahl oder ein Datum handelt.

=== Base Standard

Der DICOM Base Standard ist in zahlreiche Teile (Parts, "PS3.x") gegliedert, die jeweils einen Teilaspekt regeln. Für das grundlegende Verständnis wichtig sind unter anderem:

- *PS3.1* Introduction and Overview
- *PS3.3* Information Object Definitions
- *PS3.4* Service Class Specifications
- *PS3.5* Data Structures and Encoding
- *PS3.6* Data Dictionary
- *PS3.7* Message Exchange
- *PS3.8* Network Communication Support for Message Exchange
- *PS3.10* Media Storage and File Format for Data Interchange
- *PS3.15* Security and System Management Profiles
- *PS3.18* Web Services

Die Service Classes, auf die im Folgenden näher eingegangen wird, sind in Teil PS3.4 spezifiziert.

=== Service Classes

#definition(title: "Service Class:")[
Service Classes kapseln die verschiedenen Funktionalitäten, die der DICOM-Standard bereitstellt, z.B. Store (Speichern), Print (Drucken) oder Worklist (Arbeitslisten). Die meisten Geräte bzw. Applikationen unterstützen dabei nur diejenigen Service Classes, die zu ihrer jeweiligen Aufgabe und ihrem Verwendungszweck passen.
]

Innerhalb einer Service Class kommunizieren zwei Rollen miteinander:

- *SCU (Service Class User):* das Gerät bzw. die Applikation, die Daten einer Service Class verwendet bzw. empfängt.
- *SCP (Service Class Provider):* das Gerät bzw. die Applikation, die Daten einer Service Class bereitstellt bzw. versendet.

Zwei besonders wichtige Beispiele für Service Classes:

- *DICOM Storage Service Class:* umfasst das Versenden, Empfangen und Speichern medizinischer Bilder; sie ist zentral relevant für das PACS (Picture Archiving and Communication System), also das Bildarchivierungs- und Kommunikationssystem eines Krankenhauses.
- *DICOM Worklist Management Service Class:* regelt die Übertragung von Patientendaten (z.B. aus dem Radiologiesystem) hin zur bildgebenden Modalität, also z.B. zum Ultraschallgerät oder CT, damit dort die richtigen Patientendaten am Gerät bereitstehen.

#merke[
Für die Klausur relevant ist eine breitere Liste von DICOM Service Classes. Wichtige Beispiele sind:

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + gray,
  inset: 6pt,
  [*Service Class*], [*Service Class*],
  [Verify], [Structured Reporting Storage],
  [Store], [Application Event Logging],
  [Query/Retrieve], [Relevant Patient Information Query],
  [Procedure Step (Notification)], [Instance Availability Notification],
  [Print Management], [Media Creation Management],
  [Media Storage Management], [Hanging Protocols Storage/Query-Retrieve],
  [Storage Commitment], [Substance Administration Query],
  [Worklist Management], [Presentation State Storage],
)
]

Als ausführlicheres Beispiel dient die *Query/Retrieve (Q/R) Service Class*, die als Erweiterung der Storage Service Class zu verstehen ist. Eine typische Q/R-Sitzung läuft in folgenden Schritten ab:

+ Der Anwender initiiert am Q/R SC User über eine grafische Oberfläche (GUI) eine Anfrage (Query).
+ Der Q/R SC Provider sendet eine Liste von Bildern bzw. deren Metadaten zurück, die zur Anfrage passen.
+ Der Anwender wählt am Q/R SC User die tatsächlich benötigten Bilder aus.
+ Der Q/R SC Provider überträgt die ausgewählten Bilder zum Q/R SC User (Retrieve Operation).

== HL7 (Health Level 7)

=== Allgemeine Informationen

HL7 (Health Level 7) ist eine Not-for-Profit-Organisation aus den USA, die 1987 gegründet wurde. Der Name bezieht sich auf die Ebene 7 (Anwendungsschicht) des ISO/OSI-Referenzmodells, auf der HL7 als anwendungsspezifisches Protokoll operiert.

#definition(title: "HL7:")[
HL7 ist ein anwendungsspezifisches Protokoll (Ebene 7 des ISO/OSI-Referenzmodells), das ursprünglich für den Nachrichtenaustausch zwischen verschiedenen, autonomen Systemen im Gesundheitswesen entwickelt wurde.
]

HL7 kennt dabei zwei grundlegende Datenfluss-Typen:

- *unaufgefordertes Update / Bestätigung* (ein System sendet proaktiv eine Nachricht, das Gegenüber bestätigt den Empfang),
- *Anfrage (Query) / Ergebnis (Result)* (ein System fragt gezielt Informationen ab und erhält eine Antwort).

Version 2.x (HL7 v2) ist die heute weit verbreitete Version. Mit Version 3 (HL7 v3) erfolgten wesentliche Weiterentwicklungen, insbesondere:

- das *Reference Information Model (RIM)* (ausführliche Definition weiter unten),
- *CDA (Clinical Document Architecture)*: ein Modell zur Strukturierung klinischer Dokumente.

=== Message Type und Trigger Event

Jede HL7-Nachricht besitzt einen *Message Type* (Nachrichtentyp), der ihren Zweck beschreibt. Dieser wird durch einen dreistelligen Code gekennzeichnet, der in jeder Nachricht enthalten ist (z.B. ADT für Admission/Discharge/Transfer-Nachrichten, ACK für Acknowledgment/Bestätigung, ORM für einen Auftrag, ORU für ein Untersuchungsergebnis).

Das Ereignis, das den eigentlichen Nachrichtenaustausch anstößt, wird *Trigger Event* genannt. HL7 geht dabei von der Grundannahme aus, dass jedes reale Ereignis im klinischen Alltag einen Grund für einen Datenfluss zwischen Systemen darstellt. Ein Nachrichtentyp kann dabei von mehreren unterschiedlichen Trigger Events genutzt werden, jedes Trigger Event ist aber genau einem Nachrichtentyp zugeordnet.

Der typische Ablauf: Ein reales Ereignis (z.B. "Patient wurde aufgenommen") tritt in System A auf und löst dort den Versand einer HL7-Nachricht an System B aus; System B verarbeitet die Nachricht (Receive Message) und sendet im Gegenzug eine Bestätigung (ACK, Acknowledgment) zurück an System A.

*Beispiel 1 -- Admissions- und Acknowledge-Nachrichten (ADT):* Das Trigger Event A01 steht für eine stationäre Aufnahme, A02 für eine Verlegung, A03 für eine Entlassung, A04 für eine Besuchsmeldung. Alle diese Ereignisse verwenden den Nachrichtentyp ADT (Admission/Discharge/Transfer) mit zugehörigem ACK.

*Beispiel 2 -- Anfragen (Query):* Das Trigger Event A08 beschreibt eine Änderung von Patienteninformationen (Nachrichtentyp ADT/ACK), A19 eine Anfrage nach Patientendaten (Nachrichtentyp QRY/ADR), A40 die Zusammenführung von Patienteninformationen über die interne ID (ADT/ACK).

*Beispiel 3 -- laborspezifische Nachrichten:* Der Nachrichtentyp ORU benachrichtigt das KIS über einen Pathologiebefund, ORM (Trigger Event O01) steht für einen Auftrag bzw. eine Verordnung, BAR/ACK (P06) für den Abschluss eines Patientenfalls und QRY/DSR (Q01) für eine Anfrage mit sofortiger Antwort.

Syntaktisch ist eine HL7-Nachricht auf mehreren Ebenen beschrieben:

- *Syntax-Ebene:* Eine HL7-Nachricht ist eine Zeichenkette, die aus mehreren Segmenten besteht, welche durch ein Carriage-Return-Zeichen (\<cr\>) getrennt sind. Innerhalb eines Segments sind die einzelnen Felder durch das Zeichen "\|" getrennt.
- *Konzept-Ebene:* Beschreibt die Bedeutung der einzelnen Nachrichten-Elemente. So beschreibt beispielsweise das EVN-Segment (Event Type) das auslösende Ereignis: Das erste Feld enthält die Bezeichnung des Ereignisses, das zweite Feld den Zeitpunkt seines Auftretens.
- *Terminologie-Ebene:* Beschreibt den möglichen Inhalt der Elemente. Im ersten Feld des EVN-Segments steht z.B. ein Code aus der Menge aller möglichen Ereignisse, wobei "A01" für "Aufnahme" steht, "A02" für "Verlegung" usw.

Eine typische ADT-Nachricht (Message Identifier ADT) ist aus mehreren Segmenten aufgebaut: MSH (Message Header), EVN (Event Type), PID (Patient Identification), optional PD1 (zusätzliche Demografiedaten), PV1 (Patient Visit), optional PV2, optional wiederholbare DB1- und OBX-Segmente (Observation/Result). Die zugehörige Bestätigungsnachricht ACK besteht aus MSH, MSA (Message Acknowledgment) und optional ERR (Error Information).

Ein konkretes Beispiel für eine Patientenaufnahme (Trigger Event A01) zeigt den praktischen Aufbau: Die Nachricht beginnt mit dem MSH-Segment (u.a. Absender- und Empfängersystem, Nachrichtentyp "ADT^A01", Sendezeitpunkt), gefolgt von EVN (Ereigniszeitpunkt), PID (u.a. Patientenname, Geburtsdatum, Adresse), NK1 (Angehörige, "Next of Kin") sowie PV1 (Aufnahmeinformationen wie Station, Zimmer- und Bettnummer, aufnehmender Arzt, Aufnahmegrund).

=== HL7 v2 vs. v3

#merke[
*HL7 v2 vs. HL7 v3 -- die zentralen Unterschiede:*
- HL7 v2 ist im Vergleich zu v3 sehr *flexibel*, da es kein durchgängiges formales Datenmodell erzwingt.
- HL7 v3 basiert durchgängig auf dem *RIM* (Reference Information Model) und dessen Notation auf *UML* (Unified Modeling Language) und beinhaltet dadurch sehr viel mehr Struktur.
- Dadurch ist v3 deutlich *aufwendiger zu implementieren und teurer* als v2.
- In v3 wird zwischen Trigger Event, Interaction sowie Sender und Receiver Application Role unterschieden -- die Kommunikationsbeziehungen sind also formaler definiert als in v2.
]

Das RIM ist dabei die begriffliche Grundlage von v3:

#definition(title: "RIM (Reference Information Model):")[
Das RIM ist ein statisches Referenzmodell für Arbeitsabläufe in der Medizin. Es besteht aus Klassen mit ihren Attributen und den Beziehungen zwischen den Klassen, aus Zustands- und Transitionsdiagrammen für einzelne Klassen sowie aus Datentypen und deren Einschränkungen. Die Notation des Modells basiert weitgehend auf UML. Alle HL7-Nachrichten und deren Inhalte sollen auf diesem kohärenten, offenen Modell aufbauen.
]

Übergeordnetes Ziel von HL7 ist es, Standards für Interoperabilität bereitzustellen, um Arbeitsabläufe zu optimieren, die Versorgung zu verbessern, Mehrdeutigkeiten zu reduzieren und den Informationsfluss zwischen allen beteiligten Parteien zu verbessern -- dazu zählen nicht nur Kliniken, sondern auch Behörden, Patienten sowie Systementwickler und -anbieter.

=== CDA (Clinical Document Architecture)

#definition(title: "CDA (Clinical Document Architecture):")[
Die HL7 Clinical Document Architecture ist ein Standard, der Struktur und Semantik klinischer Dokumente spezifiziert, mit dem Ziel, diese Dokumente zwischen Systemen austauschen zu können.
]

In *Release 2* basieren die aktuellen Spezifikationen auf einem einzelnen CDA-XML-Schema. Darauf aufbauend lassen sich verschiedene HL7-Vorlagen (Templates) erstellen, wobei zwei für klinische Dokumente besonders relevant sind: Vorlagen zum Einschränken (Constraining) des Body-Abschnitts basierend auf dem Dokumenttyp, sowie Vorlagen zum Einschränken einzelner Einträge innerhalb des Body-Abschnitts. Daraus ergeben sich drei CDA-Levels:

- *CDA Level One:* die uneingeschränkte ("unconstrained") CDA-Spezifikation.
- *CDA Level Two:* die CDA-Spezifikation mit angewendeten Templates auf Abschnittsebene (Section-Level).
- *CDA Level Three:* die CDA-Spezifikation mit zusätzlich angewendeten Templates auf Eintragsebene (Entry-Level).

Inhaltlich werden Teile des Bodys (z.B. Eigen- und Familienanamnese) durch v3-Konzepte geregelt, während andere Teile (z.B. Anrede, Fragestellung) bereits mit v2 umsetzbar waren. Praktisch relevant ist CDA auch außerhalb der reinen Theorie: Der elektronische Arztbrief ist in Deutschland z.B. an den "Implementierungsleitfaden Arztbrief auf Basis der HL7 Clinical Document Architecture, Release 2" gebunden -- CDA findet also auch in offiziellen Richtlinien des deutschen Gesundheitswesens Verwendung.

Ergänzend zu CDA existiert mit *CCOW (Clinical Context Object Workgroup)* ein herstellerunabhängiger HL7-Standard, der es klinischen Anwendungen ermöglicht, bereits am Point of Care (Pflegeort) Informationen gemeinsam zu nutzen. Über die Technik des "Context Management" erhält das Klinikpersonal eine vereinheitlichte Sicht auf Informationen aus verschiedenen klinischen Anwendungen, koordiniert durch einen zentralen Context Manager.

=== FHIR (Fast Healthcare Interoperability Resources)

#definition(title: "FHIR (Fast Healthcare Interoperability Resources):")[
FHIR ist eine neuere HL7-Spezifikation, die auf den Erfahrungen mit HL7 v2, v3, RIM und CDA aufbaut, deren Vorteile mit modernen Web-Standards (aus der Industrie) vereint und den Fokus auf einfache Implementierbarkeit legt.
]

Anders als klassisches v2/v3-Messaging ermöglicht FHIR auch synchrone Kommunikation ("synchrone Nachrichten sind in FHIR möglich"). FHIR kann sowohl als eigenständiger ("stand-alone") Standard zum Datenaustausch verwendet werden, als auch in Kombination mit anderen gängigen Standards -- typischerweise über das REST-Paradigma sowie die Datenformate XML und JSON.

Ziel von FHIR ist es, die Implementierung zu vereinfachen, ohne dabei die Integrität der Informationen zu opfern. FHIR verbindet logische und theoretische Modelle zu einem konsistenten, rigorosen Mechanismus für den Informationsaustausch zwischen klinischen Anwendungen und besitzt eingebaute Rückverfolgungsmöglichkeiten in das HL7 RIM und andere wichtige Datenmodelle.

Die grundlegenden Bausteine von FHIR sind:

- *Ressourcen:* definieren Inhalt und Struktur der Kerninformationen, die von den meisten Implementierungen genutzt werden. Es existiert ein eingebauter Mechanismus, um den Datensatz für weitere, nicht standardmäßig abgedeckte Inhalte zu erweitern. Ressourcen können in XML, JSON und Turtle angegeben werden.
- *Referenzen:* Spezifische Anwendungsfälle werden meist durch Kombination mehrerer Ressourcen realisiert, die über Referenzen miteinander verknüpft werden -- z.B. die Verknüpfung einer Medikamentenverordnung mit einem Laborbefund und der Patientenakte.
- *Profile:* passen FHIR an konkrete Anwendungsfälle und lokale Anforderungen bzw. Regelungen an. Ein Profil legt fest, welche Ressourcen genutzt bzw. nicht genutzt werden, welche zusätzlichen Ressourcen über die Basisspezifikation hinaus benötigt werden, welche API-Features verwendet werden und welche Terminologien in den jeweiligen Ressourcen zum Einsatz kommen.

#table(
  columns: (1fr, 1.6fr, 1.6fr, 1.6fr),
  stroke: 0.5pt + gray,
  inset: 6pt,
  [], [*HL7 v2*], [*HL7 v3*], [*FHIR*],
  [Grundlage], [kein einheitliches formales Modell], [RIM (UML-basiert)], [Ressourcen, Referenzen, Profile],
  [Flexibilität], [hoch], [gering, hoher Struktur-Aufwand], [hoch, Web-Standards-nah],
  [Implementierung], [vergleichsweise einfach], [aufwendig und teuer], [auf einfache Implementierbarkeit ausgelegt],
  [Kommunikation], [i.d.R. asynchrones Messaging mit ACK], [formale Interaction/Application-Roles], [auch synchron möglich],
  [Formate], [Segment-/Feld-Syntax ("\|"-getrennt)], [XML gemäß RIM], [XML, JSON, Turtle; REST-Paradigma],
)

== IHE (Integrating the Healthcare Enterprise)

=== Allgemeine Informationen

#definition(title: "IHE:")[
IHE (Integrating the Healthcare Enterprise) ist eine 1998 von Gesundheitsexperten und der Industrie gegründete Initiative, die verbessern will, wie Computersysteme im Gesundheitswesen Informationen austauschen. IHE fördert dabei die koordinierte Nutzung etablierter Standards wie DICOM und HL7, um konkrete klinische Bedürfnisse zu adressieren.
]

Die Hauptziele von IHE sind:

- *Interoperabilität:* Austausch zwischen Geräten und Gesundheitssystemen durch Regeln zur konsistenten Nutzung bestehender Standards wie DICOM und HL7.
- *Standardisierung:* Förderung und Nutzung gemeinsamer Standards.
- *Qualität der Versorgung:* Verbesserung der Patientenversorgung.
- *Effizienz:* Reduzierung von Zeit- und Kostenaufwand.

IHE erbringt vier Leistungen: (1) *technische Rahmenwerke* – Richtlinien zur Implementierung der Profile, nach Domänen wie Radiologie, Kardiologie oder IT-Infrastruktur; (2) die *IHE-Profile* selbst (siehe unten); (3) *Testen und Zertifizierung* über Testwerkzeuge und *Connectathons*, bei denen Hersteller Konformität und Interoperabilität nachweisen; (4) öffentliche Demonstration der erreichten Interoperabilität auf Fachkongressen.

=== Integrationsprofile

#definition(title: "IHE-Integrationsprofil:")[
Ein IHE-Integrationsprofil ist eine leicht verständliche Darstellung eines medizinischen Arbeitsablaufs aus dem klinischen Alltag sowie der zu dessen Unterstützung notwendigen Kommunikationsvorgänge zwischen den beteiligten IT-Systemen im Gesundheitswesen. Integrationsprofile erleichtern damit die Verständigung zwischen Anwendern und Herstellern über Funktionalitäten und Integrationsfähigkeiten der jeweiligen Systeme.
]

Konkrete Beispiele für Integrationsprofile aus dem Quellenmaterial:

- *Geplanter Arbeits- und Informationsfluss:* organisiert und vereinheitlicht den gesamten Datenfluss -- beginnend bei der Aufnahme des Patienten in der Einrichtung, über die Übernahme der Daten in das jeweilige Abteilungssystem (z.B. die radiologische Diagnostik) bis hin zu den einzelnen Modalitäten und Bildarchiven, inklusive Rückmeldung der erfolgten Untersuchung an die vorgeschalteten Systeme.
- *Arbeits- und Informationsfluss für die Befunderstellung:* beschreibt, wie für typische Aufgaben wie Befundung, Transkription und Freigabe Listen von Arbeitsaufträgen generiert, abgefragt, bearbeitet und abgeschlossen werden können.
- *Korrektur von Patientenressourcen:* sorgt dafür, dass bei unvollständigen oder aufgrund von Demografie-Änderungen zu korrigierenden Patientendaten alle Subsysteme automatisch informiert werden -- etwa bei einem zunächst unbekannten Traumapatienten, einem Namenswechsel nach Eheschließung oder der Pseudonymisierung von VIP-Patienten.
- *Bildmarkierungen:* ermöglicht die individuelle Markierung digitaler Bilder oder Bildserien, analog zum klassischen "roten Punkt" auf dem Röntgenfilm bzw. der Haftnotiz auf der Röntgentüte, um z.B. befundrelevante Bilder oder Bilder für die nächste Fallkonferenz zu kennzeichnen.
- *Kommunikation von Leistungsdaten:* normiert die Übermittlung von Abrechnungs- und Controllingdaten (z.B. Versicherungsstatus, Verbrauchsmaterial, Leistungsdaten) aus dem KIS und dem Radiologieinformationssystem (RIS) an ein zentrales administratives System, den sogenannten "Charge Processor".

Für die Datenhaltung integrierter Lösungen gibt es zwei Ansätze: (1) *zentrale Datenbank/Replikation* (physikalisches Repository) -- hohe Verfügbarkeit, aber ggf. geringere Aktualität; der im Gesundheitswesen dominierende Ansatz (Warehouse bzw. klinisches Repository des KAS). (2) *virtuelles Repository* -- Daten verbleiben in den Subsystemen, nur Metadaten werden vorgehalten; in jüngerer Zeit v.a. für Forschung, teils als Hybrid mit teilweiser Materialisierung.

== Terminologische und ontologische Standards

Neben den Kommunikationsstandards benötigt die Medizininformatik einheitliche *Terminologien* (korrekte, eindeutige Bezeichnungen für konkrete Dinge im jeweiligen Fachgebiet) und *Ontologien* (Beziehungsnetze, die Begriffe semantisch miteinander verknüpfen und zusätzliche Informationen an diese Beziehungen hängen). Die folgenden Standards wurden bereits in Kapitel 7 (Medizinische Dokumentation) im Detail behandelt und werden hier nur kurz eingeordnet.

- *ICD* (International Statistical Classification of Diseases and Related Health Problems) ist eine einachsige Diagnoseklassifikation, die vor allem für die Abrechnung verwendet wird. Details dazu siehe Kapitel 7.
- *MeSH* (Medical Subject Headings) ist ein Schlagwortregister für biomedizinische Fachbegriffe, das u.a. in MEDLINE/PubMed und weiteren Datenbanken der amerikanischen National Library of Medicine (NLM) verwendet wird.
- *LOINC* (Logical Observation Identifiers Names and Codes) ist ein international herausgegebenes System zur eindeutigen Identifizierung und Kodierung medizinischer Beobachtungen, insbesondere von Laboruntersuchungen.
- *UMLS* (Unified Medical Language System) ist ein Projekt der US National Library of Medicine, das Terminologien, Begriffe und Konzepte biomedizinischer Ressourcen (z.B. Online-Datenbanken, medizinische Wörterbücher) aneinander angleicht. Kernstück ist ein *Metathesaurus*, ein riesiges, mehrsprachiges Vokabular für verschiedenste Zwecke, das Informationen zu medizinischen Konzepten, deren Namen und Beziehungen speichert. UMLS umfasst rund eine Million biomedizinische Konzepte mit fünf Millionen Konzeptnamen sowie etwa 100 kontrollierte Vokabulare und Klassifikationen.

=== SNOMED CT

#definition(title: "SNOMED CT (Systematized Nomenclature of Medicine Clinical Terms):")[
SNOMED CT ist derzeit die umfassendste Gesundheitsterminologie weltweit, mit rund 300.000 Einträgen und mehr als einer Million Beziehungen zwischen diesen Einträgen. Anders als das einachsige ICD ist SNOMED CT eine *mehrachsige* Nomenklatur, die aus Konzepten besteht und eine *mehrdimensionale* Auswertung ermöglicht.
]

Damit besitzt SNOMED CT die für die Klausur relevanten Eigenschaften: Es ist *hierarchisch* aufgebaut (Konzepte stehen in über- und untergeordneten Beziehungen zueinander), es ist *umfassend/vollständig* im Sinne einer sehr breiten Abdeckung medizinischer Sachverhalte, und es ist (in verschiedenen Sprachversionen, z.B. Deutsch und Englisch) *mehrsprachig* nutzbar.

Zweck von SNOMED CT ist es, klinische Inhalte -- neben Diagnosen auch Symptome, Befunde und Prozeduren -- präzise, eindeutig und mehrachsig zu kodieren, sodass sie system- und sprachübergreifend konsistent verstanden werden. Beispielachsen sind *Symptome*, *Befunde* und *Anwendungen/Prozeduren*; derselbe Sachverhalt (z.B. Grippe, "flu") lässt sich so aus mehreren Perspektiven erschließen statt über einen einzigen Klassifikationspfad wie bei ICD.

#quizblock(title: "Quiz: IT-Standards in der Medizin")[
#frage[Was ist DICOM, und wofür wird es typischerweise eingesetzt? Nennen Sie fünf Beispiele für DICOM Service Classes.]
#antwort[DICOM (Digital Imaging and Communications in Medicine) ist ein internationaler, offener Standard zum Übertragen, Speichern, Abrufen, Drucken, Verarbeiten und Anzeigen medizinischer Bilddaten und zugehöriger Informationen. Eingesetzt wird es vor allem zur Anbindung bildgebender Modalitäten (z.B. MRT, CT, Ultraschall) an das KIS. Beispiele für Service Classes: Verify, Store, Query/Retrieve, Print Management, Worklist Management (weitere: Storage Commitment, Media Storage Management, Application Event Logging, Structured Reporting Storage).]

#frage[Was sind SCU und SCP im Kontext von DICOM Service Classes?]
#antwort[SCU (Service Class User) ist das Gerät bzw. die Applikation, die Daten einer Service Class verwendet bzw. empfängt. SCP (Service Class Provider) ist das Gerät bzw. die Applikation, die Daten einer Service Class bereitstellt bzw. versendet.]

#frage[Wie wird eine HL7-Nachricht ausgelöst? Nennen Sie zwei Beispiele mit zugehörigem Nachrichtentyp.]
#antwort[Ausgelöst wird eine HL7-Nachricht durch ein sogenanntes Trigger Event -- ein reales Ereignis im klinischen Alltag, das laut HL7-Annahme einen Datenaustausch zwischen Systemen erforderlich macht. Beispiel 1: Trigger Event A01 ("stationäre Aufnahme") löst eine Nachricht vom Typ ADT/ACK aus. Beispiel 2: Trigger Event A19 ("Anfrage nach Patientendaten") löst eine Nachricht vom Typ QRY/ADR aus.]

#frage[Wie ist eine HL7-Nachricht syntaktisch aufgebaut, und was wird bei FHIR im Unterschied dazu als Grundbaustein verwendet?]
#antwort[Eine klassische HL7-Nachricht (v2) ist eine Zeichenkette aus mehreren, durch \<cr\> getrennten Segmenten; innerhalb eines Segments sind die Felder durch "\|" getrennt. FHIR verwendet stattdessen Ressourcen (in XML, JSON oder Turtle), die über Referenzen miteinander verknüpft und über Profile an konkrete Anwendungsfälle angepasst werden, typischerweise über das REST-Paradigma.]

#frage[Nennen Sie den zentralen Unterschied zwischen HL7 v2 und HL7 v3.]
#antwort[HL7 v2 ist sehr flexibel und kennt kein einheitliches formales Datenmodell, dafür aber vergleichsweise einfach zu implementieren. HL7 v3 basiert durchgängig auf dem RIM (Reference Information Model), dessen Notation auf UML beruht, wodurch v3 sehr viel mehr Struktur besitzt, aber auch deutlich aufwendiger und teurer in der Implementierung ist.]

#frage[Was ist das Reference Information Model (RIM), und in welchem HL7-Standard spielt es die zentrale Rolle?]
#antwort[Das RIM ist ein statisches Referenzmodell für medizinische Arbeitsabläufe, bestehend aus Klassen mit Attributen und Beziehungen, Zustands-/Transitionsdiagrammen sowie Datentypen; seine Notation basiert auf UML. Es bildet die durchgängige Grundlage von HL7 v3 -- alle v3-Nachrichten sollen auf dem RIM aufbauen.]

#frage[Was ist CDA, und welche drei Levels werden in Release 2 unterschieden?]
#antwort[CDA (Clinical Document Architecture) ist ein HL7-Standard, der Struktur und Semantik klinischer Dokumente spezifiziert, damit diese zwischen Systemen ausgetauscht werden können. In Release 2 gibt es CDA Level One (uneingeschränkte Basisspezifikation), CDA Level Two (mit Templates auf Abschnittsebene) und CDA Level Three (zusätzlich mit Templates auf Eintragsebene).]

#frage[Was ist SNOMED CT? Erklären Sie Eigenschaften und Zweck, und nennen Sie drei Beispiele für Achsen bzw. Hierarchien.]
#antwort[SNOMED CT (Systematized Nomenclature of Medicine Clinical Terms) ist die derzeit umfassendste Gesundheitsterminologie weltweit (rund 300.000 Einträge, über eine Million Beziehungen). Es ist hierarchisch, umfassend/vollständig und mehrsprachig nutzbar und dient dazu, klinische Inhalte mehrachsig und mehrdimensional präzise zu kodieren. Beispielhafte Achsen/Hierarchien sind Konzepte zu Symptomen, zu Befunden und zu Anwendungen/Prozeduren.]

#frage[Wozu dienen die Integrationsprofile der IHE? Nennen Sie den Zweck und drei Beispiele.]
#antwort[IHE-Integrationsprofile stellen leicht verständlich dar, wie medizinische Arbeitsabläufe im Alltag ablaufen und welche Kommunikationsvorgänge zwischen den beteiligten IT-Systemen dafür nötig sind; sie erleichtern damit die Verständigung zwischen Anwendern und Herstellern über Funktionalität und Integrationsfähigkeit. Beispiele: der geplante Arbeits- und Informationsfluss (von der Patientenaufnahme bis zur Bildarchivierung inkl. Rückmeldung), der Arbeits- und Informationsfluss für die Befunderstellung (Verwaltung von Arbeitsaufträgen für Befundung, Transkription, Freigabe) sowie die Korrektur von Patientenressourcen (automatische Weitermeldung korrigierter Patientendaten an alle Subsysteme).]

#frage[Was unterscheidet FHIR grundlegend von HL7 v2 und v3?]
#antwort[FHIR baut auf den Erfahrungen mit HL7 v2, v3, dem RIM und CDA auf, ist aber stark von modernen Web-Standards geprägt: Es nutzt Ressourcen (XML/JSON/Turtle), Referenzen und Profile statt Segment-Nachrichten oder des starren RIM-Modells, ist über das REST-Paradigma ansprechbar, ermöglicht im Gegensatz zum klassischen asynchronen Messaging auch synchrone Kommunikation und legt den Fokus auf einfache Implementierbarkeit bei gleichzeitigem Erhalt der Informationsintegrität.]
]
