#import "../vorlage.typ": *

= Kapitel 6: Informationssysteme und die elektronische Patientenakte

Dieses Kapitel führt in die Grundbegriffe der medizinischen Informationsverarbeitung ein: Was ist ein Informationssystem, was eine Krankenakte, und was ändert sich, wenn diese Akte elektronisch geführt wird? Außerdem wird gezeigt, in welchen Bereichen des Gesundheitswesens Informationssysteme eingesetzt werden und welche Inhalte eine elektronische Patientenakte typischerweise umfasst. Tiefergehende Themen werden hier nur benannt und in späteren Kapiteln vertieft: die Dokumentations- und Ordnungssysteme (ICD, OPS, DRG) in Kapitel 7, Datenschutz, elektronische Gesundheitskarte (eGK) und Telematikinfrastruktur in Kapitel 8, die Architektur von Krankenhausinformationssystemen (KIS) in Kapitel 9 sowie die Austauschstandards (SNOMED, DICOM, HL7, IHE) in Kapitel 10.

== Begriff: Informationssystem

Ein Informationssystem sammelt, verarbeitet, überträgt und verteilt Daten, um daraus nutzbare Information zu erzeugen – gleich ob automatisiert (Computer) oder manuell (Mensch mit Papier). In der medizinischen Informatik ist meist ein computergestütztes System gemeint, das dazu fünf Komponenten kombiniert (siehe Definition unten).

#definition(title: "Begriff: Informationssystem (nach Stair & Reynolds)")[
Ein computergestütztes Informationssystem (Computer-Based Information System, CBIS) ist eine Kombination aus fünf Komponenten, die gemeinsam konfiguriert sind, um Daten zu sammeln, zu manipulieren, zu speichern und in Information zu verarbeiten:
- Hardware
- Software
- Datenbanken
- Telekommunikation
- Menschen und Prozeduren (Verfahrensregeln)
]

Eine etwas andere, aber inhaltlich verwandte Sicht liefert Krcmar (2005): Er stellt das Informationssystem als Zusammenspiel von *Mensch* und *Maschine* dar. Auf der menschlichen Seite stehen Daten und Prozesse (also die Anwendung im organisatorischen Sinn), auf der maschinellen Seite Hardware sowie deren Funktionen und Verbindungen. Ein Informationssystem ist damit nie nur "Software", sondern immer auch die Menschen und Abläufe, die diese Software nutzen.

#merke[
Ein Informationssystem besteht klassischerweise aus fünf Komponenten: Hardware, Software, Datenbanken, Telekommunikation sowie Menschen und Prozeduren. Diese Aufzählung ist eine beliebte Klausurfrage ("Nennen Sie das Prinzip eines Informationssystems in 5 Stichpunkten").
]

Ein Krankenhausinformationssystem (KIS) ist die Anwendung dieses allgemeinen Konzepts auf die Institution Krankenhaus. Nach Winter und Haux ist ein KIS "das gesamte informationsverarbeitende und informationsspeichernde Teilsystem eines Krankenhauses". Van Bemmel und Musen formulieren das Ziel eines KIS so, dass es patientenbezogene und administrative Information für alle Aktivitäten eines Krankenhauses sammelt, speichert, verarbeitet, wiederauffindbar macht und kommuniziert, und dabei die funktionalen Anforderungen aller berechtigten Nutzer erfüllt. Vereinfacht gesagt lautet das Ziel eines KIS: die richtige Information am richtigen Ort zur richtigen Zeit bereitzustellen.

== Begriff: Krankenakte und Patientenakte

#definition(title: "Begriff: Patientenakte / Krankenakte")[
Die Patientenakte (auch Krankenakte) umfasst alle Dokumente, die im Zusammenhang mit der medizinischen Versorgung eines Patienten erstellt werden. Sie ist meist einrichtungsbezogen, das heißt auf eine einzelne Klinik oder Praxis beschränkt. Als Medium kommen verschiedene Varianten vor: primär Papier, primär elektronisch erzeugte Dokumente, elektronisch erzeugte Dokumente, die zusätzlich ausgedruckt (mit oder ohne Unterschrift) werden, sowie eingescannte und indexierte Papierdokumente.
]

Inhaltlich setzt sich die ärztliche Dokumentation im Verlauf typischerweise aus mehreren Bestandteilen zusammen:

- *Krankenblatt*: Vitaldaten (Puls, Temperatur, Blutdruck), Medikation, Diagnosen, Verdachtsdiagnosen, Allergien, Probleme und Anordnungen.
- *Geordnete Sammlung von Untersuchungsergebnissen*: Anamnese, körperliche Untersuchung, Befundberichte (Labor, Röntgen, Ultraschall, ...), Konsilberichte und Arztbrief.
- *Unterlagen über Vorbehandlungen* (Altakten), die beide vorgenannten Kategorien umfassen können.
- *Dokumentation der Aufklärung und der Patientenentscheidungen*, etwa unterzeichnete Formulare zu Aufklärungsgesprächen.

Ergänzend gehören auch die pflegerische Dokumentation sowie Dokumentation aus Physiotherapie und Diätberatung zur Patientenakte.

#merke[
Klassische Klausurfrage: "Nennen Sie 3 Bestandteile der Patientenakte, die in der ärztlichen Dokumentation im Verlauf auftauchen." Antwortmöglichkeiten sind zum Beispiel: Krankenblatt, geordnete Sammlung der Untersuchungsergebnisse, Unterlagen über Vorbehandlungen, Dokumentation der Aufklärung und Patientenentscheidungen.
]

== Von der Papierakte zur elektronischen Akte

Wird die Patientenakte nicht mehr (nur) auf Papier, sondern digital geführt, spricht man von einer elektronischen Akte. International sind dafür verschiedene, gestaffelte Begriffe gebräuchlich, die sich vor allem im Grad der Einrichtungsübergreifung unterscheiden: Der *Electronic Medical Record (EMR)* ist einrichtungsbezogen (z. B. krankenhausintern) und entspricht damit der klassischen elektronischen Krankenakte. Der *Electronic Patient Record (EPR)* ist meist einrichtungsübergreifend. Der *Electronic Health Record (EHR)* ist einrichtungs-, fach- und sektorenübergreifend angelegt und wird häufig gleichbedeutend mit der heutigen deutschen elektronischen Patientenakte (ePA nach SGB V § 341) verwendet – nicht mit dem EMR. (Die Patientenhoheit kennzeichnet dabei die ePA bzw. die EGA, nicht den EHR-Begriff selbst.) Ältere, heute selten genutzte Begriffe sind Automated Medical Record und Computerized Medical Record.

#merke[Beliebte Fangfrage: Das *EMR* ist einrichtungsbezogen (entspricht der klassischen Krankenakte/EKA), während die moderne deutsche *ePA* einrichtungs- und sektorenübergreifend sowie versichertengeführt ist und damit begrifflich dem *EHR* entspricht.]

#definition(title: "Begriff: Elektronische Patientenakte (EPA)")[
Die elektronische Patientenakte ist die digitale Form der Patientenakte. In der deutschen Praxis wurde ursprünglich unterschieden zwischen der *EPA*, die von den behandelnden Institutionen geführt wird und einrichtungsbezogen oder -übergreifend sein kann, und der *elektronischen Gesundheitsakte (EGA)*, die unter der Hoheit des Patienten steht: Der Patient beauftragt hierbei selbst einen Dienstleister mit der Führung seiner Akte (Beispiele waren u. a. CGM Life eServices, Vivy, TK-Safe; Microsoft HealthVault und Google Health wurden mittlerweile eingestellt). Seit der gesetzlichen Neuregelung (SGB V § 341) ist die EPA als versichertengeführte elektronische Akte konzipiert: Die Versicherten entscheiden selbst, welche Daten eingestellt werden. Details der gesetzlichen Grundlagen (eGK, Telematikinfrastruktur) werden in Kapitel 8 vertieft.
]

Ein kompakter Überblick über Vor- und Nachteile der elektronischen Akte gegenüber der klassischen Papierakte (eine ausführliche Gegenüberstellung inklusive KIS-Architektur folgt in Kapitel 9):

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + gray,
  inset: 7pt,
  [*Papierakte*], [*Elektronische Akte*],
  [Nur an einem Ort gleichzeitig verfügbar], [Gleichzeitiger Zugriff von mehreren Orten möglich],
  [Handschrift oft schwer lesbar, keine strukturierte Auswertung], [Strukturierte, maschinell auswertbare und durchsuchbare Daten],
  [Physischer Transport bei Verlegung/Überweisung nötig], [Elektronische Übermittlung, z. B. elektronischer Arztbrief],
  [Vollständigkeit schwer prüfbar, Verlustrisiko], [Automatisierte Vollständigkeitsprüfung, Backups möglich],
  [Keine automatisierten Erinnerungen/Warnhinweise], [Grundsätzlich Basis für Erinnerungen, Entscheidungsunterstützung (in der Praxis bislang oft nur rudimentär umgesetzt)],
)

In der Praxis zeigt sich, dass die Umsetzung dieser Vorteile noch nicht vollständig ist: Zwar sind sowohl Krankenhausinformationssysteme als auch Arztpraxissysteme heute nahezu flächendeckend im Einsatz, doch ist die medizinische Dokumentation überwiegend abrechnungsorientiert (Diagnosen, Prozeduren, Diagnosis Related Groups/DRGs im stationären Bereich, Einheitlicher Bewertungsmaßstab/EBM im ambulanten Bereich). Elektronische Formulare für Order Entry und Befundübermittlung (Result Reporting) sind weitgehend vorhanden, klinische Pfade, Leitlinien und automatisierte Warnhinweise sind dagegen bislang nur rudimentär umgesetzt, und Medienbrüche zwischen Papier und elektronischer Dokumentation kommen weiterhin vor.

== Inhalte der elektronischen Patientenakte

Nach der gesetzlichen Regelung in SGB V § 341 können in die elektronische Patientenakte insbesondere folgende Datenarten eingestellt werden:

+ Daten zu *Befunden* und *Diagnosen*
+ Daten zu durchgeführten und geplanten *Therapiemaßnahmen*
+ Daten zu *Früherkennungsuntersuchungen* und Behandlungsberichten
+ *Elektronische Arztbriefe* (elektronische Briefe zwischen behandelnden Ärzten und Einrichtungen)
+ Daten der *elektronischen Impfdokumentation*
+ *Gesundheitsdaten*, die der Versicherte selbst zur Verfügung stellt
+ Daten zu früheren Untersuchungen sowie *Verordnungsdaten* elektronischer Verordnungen

#merke[
Klassische Klausurfrage: "Nennen Sie 7 Inhalte der elektronischen Patientenakte (EPA/EKA)." – Die Antwort ergibt sich unmittelbar aus der Aufzählung oben.
]

Zur begrifflichen Abgrenzung „alte" ePA (§ 291a, institutionsgeführt) vs. heutige ePA (§ 341, patientengeführt) siehe oben. In der Praxis ist die Akte bislang meist noch nicht durchgängig einrichtungsübergreifend nutzbar, unter anderem, weil ein flächendeckender einrichtungsübergreifender Patientenidentifikator (Master Patient Index) fehlt. Einrichtungsübergreifende Nutzung findet sich bereits bei Krankenhausketten oder in Modellprojekten (z. B. elektronische Fallakte, eFA).

#merke[
*Rechtsgrundlagen im SGB V (Überblick):* Die elektronische Gesundheitskarte (eGK) ist in § 291 geregelt, die Telematikinfrastruktur selbst in § 306 und ihre Anwendungen (u. a. ePA, E-Rezept, elektronischer Medikationsplan, Notfalldaten) in § 334; die elektronische Patientenakte (ePA) ist in § 341 verankert.
]

== Anwendungsbereiche: Krankenhaus, Praxis, Region

Informationssysteme im Gesundheitswesen lassen sich grob nach dem Versorgungssektor unterscheiden, in dem sie eingesetzt werden.

*Ambulante Versorgung (Arztpraxis):* Hier kommen Praxis-EDV-Systeme (Praxis-DV) zum Einsatz. Sie unterstützen die Praxisorganisation und das Formularwesen, die Befunddokumentation, die Medikation, die Abrechnung (Codierung nach EBM, Übermittlung an die Kassenärztliche Vereinigung/KV), die Privatliquidation, die Arztbriefschreibung, Schnittstellen zu Medizintechnik und Laboranbindung sowie Statistik- und Terminfunktionen. Die Durchdringung mit Praxis-DV liegt in Deutschland nahezu bei 100 Prozent, und die medizinische Kommunikation zwischen Praxen wurde in den letzten Jahren stark ausgebaut, unter anderem über das Sichere Netz der Kassenärztlichen Vereinigungen (SNK), das an die Telematikinfrastruktur angeschlossen ist.

*Stationäre Versorgung (Krankenhaus):* Übergeordneter Begriff ist das Krankenhausinformationssystem (KIS), das mehrere Teilsysteme umfassen kann, etwa klinische Arbeitsplatzsysteme (KAS), Laborinformationssysteme (LIS), Radiologieinformationssysteme (RIS) sowie Systeme zur digitalen Bildarchivierung und -kommunikation (PACS, Picture Archiving and Communication System). Auch hier ist die Durchdringung nahezu vollständig. Aufgaben umfassen die Fall- und Besuchsidentifikation, die Erfassung von Diagnosen und Maßnahmen zur Abrechnung (DRGs), Qualitätsmanagement mit verpflichtender interner und externer Dokumentation, Auftragskommunikation und Terminplanung sowie Arztbriefschreibung und Befundkommunikation.

*Sektorübergreifende Vernetzung (Region):* Über die einzelne Praxis oder Klinik hinaus existieren regionale Vernetzungsprojekte sowie eine im Aufbau befindliche nationale Infrastruktur nach SGB V (eGK, EPA, elektronische Fallakte eFA). Organisatorisch entstehen zudem neue, sektorenübergreifende Versorgungsformen wie die integrierte Versorgung oder Medizinische Versorgungszentren (MVZ). Die technischen Details dieser Vernetzung (eGK, Telematikinfrastruktur) werden in Kapitel 8 behandelt.

== Anwenderverfahren

Innerhalb von Praxis- und Krankenhausinformationssystemen lassen sich verschiedene Anwenderverfahren unterscheiden, die jeweils bestimmte Arbeitsabläufe unterstützen. Beispiele aus dem Krankenhausbereich sind der klinische Arbeitsplatz (z. B. Stationsübersicht mit Zugriff auf Diagnosen, Maßnahmen und Arztbriefschreibung), die fachabteilungsbezogene elektronische Teilakte, die Erstellung des Entlassbriefs (mit direktem Zugriff auf Diagnosen und Prozeduren sowie Import von codierten Diagnosen, Befunden, Histopathologie- und Radiologieberichten), die Terminplanung für Funktionsstellen wie die Radiologie sowie die Auftrags- und Befundkommunikation zwischen Abteilungen. In der Arztpraxis zählen entsprechend Formularwesen, Befunddokumentation, Medikation, Abrechnung und Arztbriefschreibung zu den zentralen Anwenderverfahren.

#quizblock(title: "Quiz: Informationssysteme und elektronische Akte")[
#frage[Nennen Sie das Prinzip eines Informationssystems nach Stair & Reynolds in 5 Stichpunkten.]
#antwort[Ein computergestütztes Informationssystem besteht aus: Hardware, Software, Datenbanken, Telekommunikation sowie Menschen und Prozeduren, die gemeinsam konfiguriert sind, um Daten zu sammeln, zu verarbeiten und in Information umzuwandeln.]

#frage[Was ist laut Krcmar (2005) die grundlegende Struktur eines Informationssystems?]
#antwort[Ein Zusammenspiel von Mensch und Maschine: Auf Seiten des Menschen stehen Daten und Prozesse (Anwendung), auf Seiten der Maschine Hardware mit ihren Funktionen und Verbindungen.]

#frage[Nennen Sie 3 Bestandteile der Patientenakte, die in der ärztlichen Dokumentation im Verlauf auftauchen.]
#antwort[Zum Beispiel: das Krankenblatt (Vitaldaten, Medikation, Diagnosen, Allergien, Anordnungen), die geordnete Sammlung der Untersuchungsergebnisse (Anamnese, Befundberichte, Konsilberichte, Arztbrief) sowie die Dokumentation der Aufklärung und Patientenentscheidungen. Auch Unterlagen über Vorbehandlungen (Altakten) zählen dazu.]

#frage[Worin unterscheiden sich die historische elektronische Patientenakte (EPA nach altem SGB V § 291a) und die elektronische Gesundheitsakte (EGA)?]
#antwort[Die EPA wird von den behandelnden Institutionen geführt und kann einrichtungsbezogen oder -übergreifend sein. Die EGA steht dagegen unter Hoheit des Patienten, der selbst einen Dienstleister mit der Führung seiner Akte beauftragt (Beispiele: CGM Life, Vivy, TK-Safe).]

#frage[Nennen Sie 7 Inhalte der elektronischen Patientenakte (EPA) nach SGB V § 341.]
#antwort[Zum Beispiel: Befunde, Diagnosen, durchgeführte und geplante Therapiemaßnahmen, Früherkennungsuntersuchungen, elektronische Arztbriefe, elektronische Impfdokumentation, vom Versicherten bereitgestellte Gesundheitsdaten und Verordnungsdaten elektronischer Verordnungen.]

#frage[In welchen drei Versorgungssektoren werden medizinische Informationssysteme typischerweise unterschieden, und welches System ist jeweils charakteristisch?]
#antwort[Ambulante Versorgung/Arztpraxis (Praxis-EDV-Systeme), stationäre Versorgung/Krankenhaus (Krankenhausinformationssystem KIS mit Teilsystemen wie KAS, LIS, RIS, PACS) sowie sektorübergreifende, regionale bzw. nationale Vernetzung (regionale Projekte, nationale Infrastruktur nach SGB V wie eGK, EPA, eFA).]

#frage[Was bedeutet PACS, und wo wird es eingesetzt?]
#antwort[PACS steht für Picture Archiving and Communication System, ein System zur digitalen Speicherung, Archivierung und Kommunikation von Bilddaten. Es wird vor allem in bilderzeugenden Abteilungen wie der Radiologie eingesetzt, macht Bilder aber auch auf Stationen und in Ambulanzen verfügbar.]

#frage[Nennen Sie zwei Vorteile und einen Nachteil bzw. eine offene Herausforderung der elektronischen Akte gegenüber der Papierakte in der heutigen Praxis.]
#antwort[Vorteile: gleichzeitiger Zugriff von mehreren Orten sowie strukturierte, elektronisch übermittelbare Daten (z. B. elektronischer Arztbrief statt physischem Transport). Herausforderung: Die Dokumentation ist in der Praxis oft noch stark abrechnungsorientiert, klinische Pfade und automatisierte Warnhinweise sind bislang nur rudimentär umgesetzt, und Medienbrüche zwischen Papier und elektronischer Form bestehen weiterhin.]
]
