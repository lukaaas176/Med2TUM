#import "../vorlage.typ": *

= Kapitel 9: Architektur und Informationsintegration im Krankenhaus

In diesem Kapitel geht es um die informationstechnische Struktur eines Krankenhauses: Warum die klassische Papierakte trotz ihrer Nachteile lange Zeit konkurrenzfähig war, warum ein Krankenhaus in der Praxis nie nur ein einziges großes System betreibt, sondern viele unterschiedliche Teilsysteme, und wie diese Teilsysteme sinnvoll miteinander verbunden werden können.

== Papierakte vs. elektronische Akte

Die Patientenakte ist die zentrale Dokumentationsgrundlage der Behandlung. Historisch wurde sie als Papierakte geführt; erst mit der Digitalisierung setzt sich die elektronische Akte durch. Beide Formen haben spezifische Stärken und Schwächen.

*Vorteile der Papierakte:* Sie passt sich sehr gut an bestehende Arbeitsabläufe an, ist ohne zusätzlichen Aufwand portabel (man nimmt sie einfach mit), funktioniert unabhängig von Technik und ist damit robust gegenüber Systemausfällen. Sie bietet hohe Flexibilität bei der Erfassung: Unstrukturierte oder subjektive Angaben lassen sich leicht ergänzen, und die Akte kann bei Bedarf leicht umorganisiert werden. Zudem hat sie durch handschriftliche Notizen, Skizzen und angeheftete Materialien oft einen hohen Informationsgehalt und erlaubt einen raschen Überblick, da man einfach darin blättern kann.

*Nachteile der Papierakte:* Sie benötigt viel Archivplatz und ist wenig verfügbar (ausgeliehen, Archiv geschlossen, falsch einsortiert oder verloren). Nachlieferungen loser Blätter gehen häufig verloren, wodurch Akten oft unvollständig sind. Die Zugriffszeiten sind hoch, da die Akte erst physisch beschafft werden muss, und durch die geringe Strukturierung ist das Auffinden bestimmter Informationen schwierig. Handschriftliche Vermerke sind oft unleserlich. Zur Beschleunigung des Zugriffs werden medizinische Daten häufig redundant in Teilakten und Spezialarchiven vorgehalten, was die logistischen Probleme noch verschärft. Die Papierakte ist zudem passiv, da sie keine automatisierten Hinweise oder Alarme geben kann, und sie bietet eine reduzierte Auswertemöglichkeit: Der Verlauf lässt sich nur eingeschränkt beurteilen, es kommt zu Übertragungsfehlern beim Abschreiben, und sie eignet sich schlecht für die Forschung.

Die elektronische Akte kehrt viele dieser Nachteile um: Sie bietet bessere Zugriffszeiten, höhere Strukturierung und größere Verfügbarkeit, ermöglicht Konsistenzprüfungen sowie automatische Hinweise und Alarme und unterstützt die Einhaltung von Leitlinien und Behandlungspfaden. Allerdings bringt sie eigene Probleme mit: hohen Einführungsaufwand, laufenden Betriebsaufwand sowie Abhängigkeit von Technik und Hersteller, Aufwand für Konsistenzsicherung und Archivierung, neue Sicherheitsrisiken (Softwarefehler, Stromausfälle, unerlaubter Zugriff, Ransomware-Angriffe), rechtliche Fragen (etwa bei der richterlichen Beweiswürdigung elektronischer Dokumente) sowie eine Abhängigkeit von Hardware wie WLAN oder mobilen Endgeräten.

#table(
  columns: (1fr, 1fr),
  stroke: 0.5pt + gray,
  inset: 6pt,
  table.header([*Papierakte*], [*Elektronische Akte*]),
  [Anpassungsfähig an Abläufe, portabel, technikunabhängig, hoher Informationsgehalt, rascher Überblick], [Bessere Zugriffszeit, Strukturierung, Verfügbarkeit; Konsistenzprüfungen; automatische Hinweise; Unterstützung von Leitlinien/Pfaden],
  [Platzbedarf, geringe Verfügbarkeit, Unvollständigkeit, hohe Zugriffszeiten, geringe Strukturierung, Unleserlichkeit, Redundanz, Passivität, eingeschränkte Auswertung], [Einführungs- und Betriebsaufwand, Hersteller-/Technikabhängigkeit, neue Sicherheitsrisiken, rechtliche Fragen, Hardwareabhängigkeit],
)

#merke[Die elektronische Akte löst nahezu alle strukturellen Nachteile der Papierakte (Verfügbarkeit, Struktur, Auswertbarkeit), erkauft dies aber mit neuen Abhängigkeiten von Technik, Herstellern und IT-Sicherheit.]

== Komponenten eines Krankenhausinformationssystems

Ein Krankenhaus benötigt zur Digitalisierung seiner Prozesse ein Krankenhausinformationssystem (KIS) – die Gesamtheit aller informationsverarbeitenden Systeme eines Krankenhauses. In der Praxis besteht ein KIS jedoch fast nie aus einer einzigen, monolithischen Software, sondern aus vielen fachlich spezialisierten Teilsystemen, die jeweils einen bestimmten "Schnitt" durch die Klinik abdecken, etwa:

- ein Verwaltungssystem bzw. ERP-System (Enterprise-Resource-Planning) für kaufmännische Prozesse,
- ein Patientendatenmanagementsystem (PDM) für die Stationsdokumentation,
- ein klinisches Arbeitsplatzsystem (KAS) für die klinische Dokumentation am Behandlungsplatz,
- ein Radiologiesystem, das sich meist wiederum aus einem RIS (Radiologie-Informationssystem, für Terminierung und Befundung) und einem PACS (Picture Archiving and Communication System, für die Bildarchivierung und -verteilung) zusammensetzt,
- ein Laborinformationssystem (LIS) für die Steuerung und Befundung von Laboranalysen.

Diese Aufteilung in Fachabteilungen wie OP, Labor, Radiologie, Intensivstation, Normalstation und Verwaltung entspricht den organisatorischen "Schnitten" durch das Krankenhaus, entlang derer typischerweise auch die IT-Systeme geschnitten sind.

== Schichtenarchitektur von Informationssystemen

Unabhängig davon, aus wie vielen Teilsystemen ein KIS besteht, lässt sich jedes einzelne Informationssystem in drei logische Schichten (Layer) gliedern. Diese Schichtung ist zwischen die medizinisch-organisatorischen Abläufe (Prozeduren) und die technische Infrastruktur eingebettet.

#definition(title: "Begriff: Presentation Layer")[
Die Präsentationsschicht (Presentation Layer) stellt die Benutzeroberfläche bereit, über die der Anwender mit dem System interagiert.
]

#definition(title: "Begriff: Application-Logic Layer")[
Die Anwendungslogik-Schicht (Application-Logic Layer) enthält die eigentliche Verarbeitungs- bzw. Anwendungslogik des Systems.
]

#definition(title: "Begriff: Resource-Management Layer")[
Die Ressourcenverwaltungs-Schicht (Resource-Management Layer) ist für die Datenhaltung und den Zugriff auf Ressourcen zuständig, z.B. auf ein Datenbankmanagementsystem (DBMS) oder auf andere Informationssysteme.
]

=== Verteilung der Schichten: 1-, 2- und 3-Tier

Diese drei logischen Schichten können unterschiedlich auf physische Systeme (Tiers) verteilt werden. Mit zunehmender Verteilung steigt die Anzahl der Schichten (Tiers).

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + gray,
  inset: 6pt,
  table.header([*Architektur*], [*Verteilung der Schichten*]),
  [*1-Tier* (monolithisch)], [Keine Trennung: Presentation, Application-Logic und Resource-Management liegen gemeinsam auf einem System; der Client greift darauf zu.],
  [*2-Tier* (Client-Server)], [Meist Präsentationsschicht auf dem Client und Backend auf dem Server: Der Presentation Layer liegt beim Client, Application-Logic und Resource-Management laufen gemeinsam auf dem Server.],
  [*3-Tier*], [Präsentation, Applikationslogik und Ressourcenverwaltung sind getrennt: Presentation Layer beim Client, Application-Logic Layer als Middleware und Resource-Management Layer als eigene Schicht.],
)

#merke[Jedes Informationssystem besteht logisch aus drei Schichten (Presentation, Application-Logic, Resource-Management). Die physische Verteilung dieser Schichten unterscheidet monolithische 1-Tier-, Client-Server-2-Tier- und 3-Tier-Architekturen – je mehr Tiers, desto stärker sind die Schichten voneinander getrennt.]


== Warum kein einziges, zusammenhängendes KIS?

Man könnte sich fragen, warum ein Krankenhaus nicht einfach ein einziges, ganzheitliches KIS für alle Bereiche einsetzt. Dafür gibt es mehrere Gründe: Die Einführung eines Gesamtsystems ist sehr aufwendig, und Abteilungen haben oft spezifische Anforderungen, die hoch angepasste Spezialsysteme besser erfüllen; Generalisten-Systeme weisen gegenüber Spezialsystemen häufig funktionale Defizite auf. Hinzu kommt, dass viele Medizingeräte bereits mit eigener, "integrierter" Software ausgeliefert werden und ältere Systeme (Altsysteme) im laufenden Betrieb schwer zu ersetzen oder zu integrieren sind. Schließlich ist die Neuentwicklung eines vollständig einheitlichen KIS extrem aufwendig (Größenordnung ca. 50 Mio. Euro und 10 Jahre Entwicklungszeit). In der Praxis entstehen Krankenhaus-IT-Landschaften daher fast immer aus einer Mischung mehrerer Systeme.

== Autonomie und Heterogenität

Wenn mehrere unabhängig entwickelte Systeme zusammenarbeiten sollen, spielt der Begriff der Autonomie eine zentrale Rolle.

#definition(title: "Begriff: Autonomie")[
Autonomie bezeichnet die Eigenständigkeit eines Teilsystems (Komponentensystems) bei Entwurf, Anbindung und Betrieb. Je autonomer ein System entwickelt und betrieben wurde, desto weniger war es von vornherein auf eine Integration mit anderen Systemen ausgelegt.
]

Man unterscheidet mehrere Typen der Autonomie. Für die Klausur besonders relevant sind drei:

- *Entwurfsautonomie (Designautonomie):* Ein System wählt unabhängig sein lokales Datenmodell (z.B. relational, XML, objektorientiert), definiert und modifiziert seine lokalen Schemata selbst, legt eigene Integritätsbedingungen und Synchronisationsalgorithmen fest und wählt eigenständig Datenstrukturen und Zugriffspfade. Beispiel: Ein Labor-System und ein Radiologiesystem können völlig unterschiedliche Datenbankschemata für "Patient" verwenden.
- *Kommunikationsautonomie:* Ein System entscheidet selbst, mit welchen anderen Systemen es kommuniziert sowie wann und in welcher Form. Beispiel: Ein System stellt seine Daten nur zu bestimmten Zeiten oder nur über ein bestimmtes Protokoll bereit.
- *Ausführungsautonomie:* Ein System bestimmt lokal selbst die Reihenfolge, in der es Operationen ausführt; lokale Operationen laufen unabhängig von entfernten Operationen ab. Beispiel: Ein System verarbeitet eingehende Aufträge in eigener Priorisierung, ohne Rücksicht auf den Zustand anderer Systeme.

Daneben führen die Folien weitere, gleichrangige Ausprägungen auf, etwa die *Schnittstellenautonomie* (freie Wahl der Art und Weise, wie externe Funktionalität bereitgestellt wird, z.B. über eine REST-API), die *Assoziationsautonomie* (freier Beitritt bzw. Austritt aus einem verteilten System) und die *Zugriffsautonomie* (lokale Selbstbestimmung der extern bereitgestellten Funktionalität) – diese sind aber Spielarten derselben Grundidee: Jedes Teilsystem trifft seine Entscheidungen unabhängig von den anderen.

#definition(title: "Begriff: Heterogenität")[
Heterogenität bezeichnet die Verschiedenartigkeit von Systemen hinsichtlich Datenrepräsentation, Datenhaltung und Verhalten. Sie ist die direkte Folge von Autonomie.
]

Die primäre Folge von Autonomie ist Heterogenität: Weil jedes Teilsystem unabhängig entwickelt wurde, entstehen unterschiedliche Datenrepräsentation und Datenhaltung (Design-Heterogenität), die sich meist nur durch Veränderung mindestens eines beteiligten Systems auflösen lassen. Auch bei der Ausführung entscheiden Komponentensysteme selbst, wann und wie sie lokale Operationen durchführen; damit wechselseitig Konsistenz garantiert werden kann, muss die Ausführungsautonomie zumindest teilweise aufgehoben werden.

#merke[Autonomie ist die Ursache, Heterogenität die Folge: Weil Teilsysteme unabhängig voneinander entworfen, angebunden und betrieben werden (Design-, Kommunikations- und Ausführungsautonomie), entstehen unterschiedliche Datenmodelle, Formate und Abläufe, die sich nur durch Integrationsmaßnahmen wieder zusammenführen lassen.]

Auf Krankenhausebene zeigt sich Heterogenität durch verschiedene Hersteller, verschiedene Architekturansätze und verschiedene Datenformate. Hinzu kommt eine organisatorische Fragmentierung, etwa zwischen stationärem und niedergelassenem Bereich, zwischen verschiedenen Krankenhäusern oder zwischen Krankenversorgung und Forschung. Beides zusammen macht Integration zur zentralen Herausforderung der Krankenhaus-IT. Fehlt diese Integration, drohen unvollständige oder verspätete Informationen bei Entlassung oder Verlegung von Patienten (mit Mehrfacherhebung von Daten, Informationsverlust und erhöhtem Risiko für Behandlungsfehler, z.B. durch fehlende Allergieinformationen), das Risiko von Datenkonflikten, unzureichende systemübergreifende Sichten auf die Daten sowie eine deutlich erschwerte Forschung.

== Architekturkonzepte im Krankenhaus

Um mit dieser Heterogenität umzugehen, haben sich im Krankenhausumfeld verschiedene grundsätzliche Architekturkonzepte etabliert.

Ein *modulares Generalisten-System für das gesamte Krankenhaus* setzt auf ein ganzheitliches System mit einer zentralen Datenbank, wobei einzelne funktionale Einheiten als eigene Module realisiert und über ein Client-Server-Konzept vom Datenbankmanagementsystem (DBMS) entkoppelt sind. Vorteile sind Datenkonsistenz ohne unnötige Redundanzen, keine Mehrfacheingaben, gute Erweiterbarkeit, die Vermeidung von Medienbrüchen sowie eine klare Zuständigkeit des Herstellers bei Fehlerbehebung. Nachteile sind eine schwierige Einführung, geringe Flexibilität und eine starke Abhängigkeit vom Hersteller.

Ein *ganzheitlicher Ansatz mit sukzessivem Ausbau* baut das KIS schrittweise über einer logisch zentralen Datenbank aus. Vorteil ist, dass verschiedene Spezialsysteme gleichzeitig eingesetzt werden können; Nachteile sind der Anpassungsaufwand der Systeme, eine aufwendige Einrichtung und die Einschränkung auf Systeme, bei denen die nötigen Anpassungen überhaupt möglich sind.

Die *Summe von Speziallösungen ("Best of Breed")* setzt für jede Abteilung das jeweils beste Spezialsystem ein. Vorteile sind hohe Flexibilität und eine von Anfang an hohe Anpassung an das terminologische und ablaufbezogene Fachwissen der jeweiligen Abteilung. Nachteile sind funktionale Inkongruenzen zwischen den Systemen, ein hohes Risiko für Inkonsistenzen, hoher Administrationsaufwand sowie eine komplexe Integration und Fehlerbehandlung. Best of Breed ist im Krankenhaus weit verbreitet; typische Teilsysteme: Verwaltung/ERP (z.B. SAP ERP), Station/PDM (z.B. IS-H), klinisches Arbeitsplatzsystem/KAS (z.B. i.s.h.med), Labor/LIS (z.B. Swisslab) sowie Radiologie aus RIS (z.B. Brainlab) und PACS (z.B. XNAT, Orthanc).

== Integrationsansätze: Repository-Konzepte

Sobald mehrere Systeme zusammenarbeiten sollen, stellt sich die Frage, wo die gemeinsam benötigten Daten tatsächlich liegen. Dafür gibt es zwei grundsätzliche Möglichkeiten.

#definition(title: "Begriff: Repository")[
Ein Repository ist im Integrationskontext die Instanz, über die auf die Daten mehrerer Subsysteme gemeinsam zugegriffen werden kann – entweder durch physische Zusammenführung der Daten oder durch eine virtuelle, verteilte Sicht darauf.
]

Beim *physikalischen (zentralen) Repository* werden die Daten der Subsysteme tatsächlich in eine zentrale Datenbank kopiert bzw. repliziert, etwa in Form eines klinischen Repositorys oder Data Warehouse. Dieser Ansatz bietet eine hohe Verfügbarkeit der zusammengeführten Daten, birgt aber potenziell eine niedrigere Aktualität, da die replizierten Daten dem Originalsystem zeitlich hinterherhinken können. Es ist im Gesundheitswesen der dominierende Integrationsansatz.

Beim *virtuellen Repository* (auch als Föderation bezeichnet) verbleiben die Daten physisch in den jeweiligen Subsystemen; das Repository verwaltet lediglich Metadaten, über die auf die verteilten Daten zugegriffen werden kann. Dieser Ansatz gewinnt in jüngerer Zeit zunehmend an Bedeutung, wird bislang aber eher für Forschungsfragestellungen eingesetzt als für den klinischen Regelbetrieb.

Beide Ansätze lassen sich in einer *Hybridform* kombinieren, bei der ein virtueller Zugriff mit einer teilweisen Materialisierung (also einer physischen Zwischenspeicherung ausgewählter Daten) verbunden wird, um Vorteile beider Seiten zu nutzen.

#table(
  columns: (1fr, 1fr, 1fr),
  stroke: 0.5pt + gray,
  inset: 6pt,
  table.header([*Kriterium*], [*Physikalisches Repository*], [*Virtuelles Repository*]),
  [Datenhaltung], [Zentral, repliziert/kopiert], [Verbleibt in Subsystemen, nur Metadaten zentral],
  [Verfügbarkeit], [Hoch], [Abhängig von Subsystemen],
  [Aktualität], [Potenziell niedriger], [Direkt am Quellsystem],
  [Typischer Einsatz], [Klinischer Regelbetrieb (dominierend)], [Eher Forschung],
)

Neben den Repository-Konzepten können Subsysteme auch direkt über Schnittstellen Daten austauschen. Dieser Ansatz bringt eigene Probleme mit sich: hoher Verwaltungsaufwand, überlappende oder fehlende Funktionalität der Schnittstellen, die Notwendigkeit semantischer Interoperabilität (also eines gemeinsamen Verständnisses der ausgetauschten Inhalte) sowie die Tatsache, dass Schnittstellen allein noch keine Prozesse über Systemgrenzen hinweg ermöglichen. Da jedes System aufgrund seiner Entwurfsautonomie eigene Schemata und Formate verwendet, ist entweder eine Datentransformation nötig oder die Entwurfsautonomie muss zugunsten gemeinsamer Standards eingeschränkt werden. (Konkrete Standards wie HL7 und DICOM sowie das Rahmenwerk IHE, das Integrationsprofile auf Basis dieser Standards beschreibt, werden im Kapitel zu den Standards vertieft.)

== Kommunikationsserver

Werden viele Subsysteme direkt miteinander verbunden, entsteht eine Punkt-zu-Punkt-Topologie: Jedes System braucht eine eigene Schnittstelle zu jedem anderen System, mit dem es Daten austauscht. Die Anzahl der nötigen Schnittstellen wächst dabei sehr schnell mit der Anzahl der Systeme, was Wartung und Erweiterung zunehmend aufwendig macht.

#definition(title: "Begriff: Kommunikationsserver")[
Ein Kommunikationsserver (auch Integration Engine, Interface Engine oder Connection Server genannt) ist eine zentrale Vermittlungsinstanz, über die alle Subsysteme eines Krankenhauses miteinander kommunizieren, anstatt direkt Punkt-zu-Punkt-Verbindungen zu unterhalten. Er nimmt Nachrichten von einem System entgegen, transformiert sie bei Bedarf in das vom Zielsystem erwartete Format bzw. Protokoll und leitet sie weiter.
]

Statt dass etwa OP, Labor, Radiologie, Intensivstation, Normalstation und Verwaltung jeweils direkt miteinander verbunden sind, kommunizieren im Krankenhaus alle beteiligten Systeme nur noch mit dem Kommunikationsserver, der die Nachrichten passend verteilt. In der Praxis werden dabei häufig HL7-Nachrichten zwischen den Systemen und dem Kommunikationsserver ausgetauscht; die genaue Syntax dieser Nachrichten ist jedoch Thema des Standards-Kapitels.

Gegenüber der Punkt-zu-Punkt-Topologie bietet der Kommunikationsserver mehrere *Vorteile*: Schnittstellen werden zentral gewartet, es werden insgesamt weniger Schnittstellen benötigt, und die Abbildung (Transformation) zwischen unterschiedlichen Formaten und Protokollen wird vereinfacht, unter anderem durch grafische Werkzeuge und die Definition von Regeln. Da die Kommunikation nur noch über den Kommunikationsserver läuft, steigt die Herstellerunabhängigkeit – es sind keine direkten proprietären Protokolle zwischen Produkten unterschiedlicher Hersteller mehr nötig. Weil der gesamte Nachrichtenverkehr über eine zentrale Stelle läuft, wird zudem eine zentrale Monitoring- bzw. Überwachungsfunktionalität möglich. Zentral ist das *Store-and-Forward-Prinzip*: Nachrichten werden zwischengespeichert und weitergeleitet; ist ein Zielsystem kurzzeitig nicht erreichbar, wird die Nachricht später zugestellt statt verloren zu gehen. Das maskiert vorübergehende Ausfälle einzelner Systeme.

Diesen Vorteilen stehen jedoch *Nachteile bzw. Einschränkungen* gegenüber: Der Kommunikationsserver erfordert zusätzliche Hardware und Software. Zudem bleibt die grundsätzliche Problematik der reinen Schnittstellenintegration bestehen, da nur eine rudimentäre Datenintegration erreicht wird: Es findet keine globale Schemaintegration statt, keine Unterstützung systemübergreifender Integritätsbedingungen und keine Synchronisation redundanter Datenbestände. Auch eine Präsentationsintegration (einheitliche Oberfläche), eine funktionale Integration (gemeinsame Funktionen) und eine Ablaufintegration (durchgängige Prozesse über Systemgrenzen) werden durch einen Kommunikationsserver nicht erreicht.

#merke[Der Kommunikationsserver ist nur ein Werkzeug, das die Handhabbarkeit der Integration über Schnittstellen verbessert – er löst nicht die tieferliegenden Integrationsprobleme wie Schema-, Präsentations-, Funktions- oder Ablaufintegration.]

#quizblock(title: "Quiz: Architektur und Informationsintegration")[
#frage[Nennen Sie je drei Vorteile und drei Nachteile der Papierakte gegenüber der elektronischen Akte.]
#antwort[Vorteile z.B.: hohe Anpassung an Arbeitsabläufe, Portabilität ohne Zusatzaufwand, Unabhängigkeit von Technik/Systemausfällen. Nachteile z.B.: hoher Platzbedarf, geringe Verfügbarkeit (ausgeliehen, Archiv geschlossen, nicht auffindbar), hohe Zugriffszeiten bzw. geringe Strukturierung.]

#frage[Was versteht man unter der "reduzierten Auswertemöglichkeit" der Papierakte?]
#antwort[Der Verlauf lässt sich nur eingeschränkt beurteilen, es entstehen Übertragungsfehler beim Abschreiben von Daten, und die Papierakte ist schwer für die Forschung nutzbar, da Daten nicht systematisch ausgewertet werden können.]

#frage[Nennen Sie drei Typen der Autonomie mit je einem Beispiel. Was ist die primäre Folge von Autonomie?]
#antwort[Entwurfsautonomie (z.B. freie Wahl des Datenmodells relational vs. XML), Kommunikationsautonomie (z.B. freie Wahl von Kommunikationspartner, Zeitpunkt und Schnittstellenart), Ausführungsautonomie (z.B. lokale Festlegung der Reihenfolge von Operationen unabhängig von entfernten Systemen). Primäre Folge der Autonomie ist Heterogenität.]

#frage[Warum führt Autonomie zwangsläufig zu Heterogenität?]
#antwort[Weil jedes Teilsystem unabhängig entworfen, angebunden und betrieben wird, entwickeln sich Datenrepräsentation, Datenhaltung und Ablaufverhalten der Systeme unabhängig voneinander. Diese Heterogenität lässt sich in der Regel nicht auflösen, ohne mindestens eines der beteiligten Systeme zu verändern; bei der Ausführung muss die Ausführungsautonomie zumindest teilweise aufgehoben werden, um Konsistenz zu gewährleisten.]

#frage[Nennen Sie drei Beispiele für typische Teilsysteme eines Best-of-Breed-Krankenhausinformationssystems.]
#antwort[Zum Beispiel ein Verwaltungssystem/ERP (Enterprise-Resource-Planning), ein Radiologiesystem bestehend aus RIS (Radiologie-Informationssystem) und PACS (Picture Archiving and Communication System), sowie ein Laborinformationssystem (LIS).]

#frage[Erklären Sie den Unterschied zwischen virtuellem und physikalischem Repository. Wo wird welcher Ansatz bevorzugt eingesetzt, und was ist die Hybridform?]
#antwort[Beim physikalischen Repository werden die Daten der Subsysteme zentral zusammengeführt/repliziert (hohe Verfügbarkeit, potenziell geringere Aktualität); es ist der im Gesundheitswesen dominierende Ansatz. Beim virtuellen Repository verbleiben die Daten in den Subsystemen, und es werden nur Metadaten für den verteilten Zugriff vorgehalten; dies wird zunehmend, vor allem für Forschungsfragestellungen, eingesetzt. Die Hybridform kombiniert virtuellen Zugriff mit teilweiser Materialisierung, also einer zusätzlichen physischen Zwischenspeicherung ausgewählter Daten.]

#frage[Wozu dient ein Kommunikationsserver, und welche Vorteile bietet er gegenüber einer Punkt-zu-Punkt-Topologie?]
#antwort[Ein Kommunikationsserver ist eine zentrale Vermittlungsinstanz, über die alle Subsysteme eines Krankenhauses kommunizieren, anstatt direkte Punkt-zu-Punkt-Verbindungen zu unterhalten; er transformiert Nachrichten bei Bedarf zwischen Formaten/Protokollen. Vorteile: zentrale Wartung von Schnittstellen, weniger Schnittstellen insgesamt, vereinfachte Formattransformation (grafische Werkzeuge, Regeln), erhöhte Herstellerunabhängigkeit sowie zentrales Monitoring, da alle Kommunikation über ihn läuft.]

#frage[Was bedeutet das Store-and-Forward-Prinzip beim Kommunikationsserver, und wo liegen die grundsätzlichen Grenzen dieses Ansatzes?]
#antwort[Beim Store-and-Forward-Prinzip speichert der Kommunikationsserver eingehende Nachrichten zunächst zwischen und leitet sie weiter, sobald das Zielsystem erreichbar ist – dadurch werden vorübergehende Ausfälle einzelner Systeme maskiert. Grenzen: Es wird nur eine rudimentäre Datenintegration erreicht (keine globale Schemaintegration, keine systemübergreifenden Integritätsbedingungen, keine Synchronisation redundanter Daten); Präsentations-, Funktions- und Ablaufintegration werden dadurch nicht erreicht. Der Kommunikationsserver ist damit nur ein Werkzeug zur besseren Handhabbarkeit der Schnittstellenintegration.]
#frage[Nennen Sie die drei logischen Schichten eines Informationssystems und ordnen Sie sie den 1-, 2- und 3-Tier-Architekturen zu.]
#antwort[Die drei Schichten sind Presentation Layer (Präsentation/Benutzeroberfläche), Application-Logic Layer (Anwendungs-/Verarbeitungslogik) und Resource-Management Layer (Datenhaltung, z.B. DBMS). Bei 1-Tier (monolithisch) liegen alle drei Schichten ungetrennt auf einem System. Bei 2-Tier (Client-Server) liegt meist der Presentation Layer auf dem Client und Application-Logic sowie Resource-Management auf dem Server. Bei 3-Tier sind Präsentation, Applikationslogik (Middleware) und Ressourcenverwaltung getrennt.]

]
