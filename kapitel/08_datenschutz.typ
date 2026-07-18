#import "../vorlage.typ": *

= Kapitel 8: Datenschutz und die Telematikinfrastruktur

== Warum Datenschutz? Eine kurze Motivation

Gesundheitsdaten gehören zu den sensibelsten personenbezogenen Daten überhaupt. Werden sie unsachgemäß verwendet oder mit anderen Datenquellen verknüpft, können daraus reale Nachteile für Einzelpersonen und ganze Bevölkerungsgruppen entstehen – ein historisches Beispiel ist das sogenannte "Redlining", bei dem die Kreditwürdigkeit von Personen anhand ihres Wohnorts abgeschätzt wurde und benachteiligte Stadtviertel in der Folge auch gesundheitlich schlechter versorgt waren. Der Schutz medizinischer Daten ist damit kein bürokratisches Beiwerk, sondern eine Frage gesundheitlicher Gerechtigkeit. Hinzu kommt, dass das Gesundheitswesen ein besonders lohnendes Ziel für Cyberangriffe ist: Medizinische Daten werden im Darknet höher gehandelt als Passwörter oder Kreditkartendaten, und die Branche zählt zu den am häufigsten angegriffenen Sektoren.

== Gesetzliche Grundlagen des Datenschutzes

In Deutschland regeln mehrere Ebenen von Gesetzen den Umgang mit personenbezogenen Daten: die europäische *Datenschutzgrundverordnung (DSGVO)*, das *Bundesdatenschutzgesetz (BDSG)* sowie Landesdatenschutzgesetze wie das Bayerische Datenschutzgesetz (BayDSG). Die DSGVO gilt für die ganz oder teilweise automatisierte Verarbeitung personenbezogener Daten sowie für die nichtautomatisierte Verarbeitung, sofern die Daten in einem Dateisystem gespeichert sind oder werden sollen.

Zentral ist dabei der Begriff der *Verarbeitung*: Er umfasst jeden Vorgang im Zusammenhang mit personenbezogenen Daten, etwa das Erheben, Speichern, Verändern, Auslesen, Übermitteln oder Löschen. Zwei Rollen sind hier wichtig: Der *Verantwortliche* entscheidet über Zwecke und Mittel der Verarbeitung, während der *Auftragsverarbeiter* personenbezogene Daten lediglich im Auftrag des Verantwortlichen verarbeitet. Der Verantwortliche muss zudem ein Verzeichnis aller Verarbeitungstätigkeiten führen und ist verpflichtet, bei voraussichtlich hohem Risiko für die Rechte und Freiheiten betroffener Personen vorab eine Datenschutz-Folgenabschätzung durchzuführen.

Besonders geschützt sind nach der DSGVO "besondere Arten personenbezogener Daten" – dazu zählen unter anderem Gesundheitsdaten, genetische und biometrische Daten sowie Daten zur ethnischen Herkunft oder sexuellen Orientierung. Ihre Verarbeitung ist grundsätzlich untersagt, es sei denn, es liegt eine ausdrückliche Einwilligung vor oder die Verarbeitung ist etwa für die medizinische Diagnostik, Versorgung oder Behandlung im Gesundheits- oder Sozialbereich notwendig.

== Grundsätze der Datenverarbeitung

Die DSGVO benennt mehrere Prinzipien, denen personenbezogene Daten bei ihrer Verarbeitung genügen müssen. Dazu gehören Rechtmäßigkeit, Verarbeitung nach Treu und Glauben sowie Transparenz gegenüber der betroffenen Person; die Zweckbindung, wonach Daten nur für festgelegte, eindeutige und legitime Zwecke erhoben werden dürfen; die Datenminimierung, also die Beschränkung auf das für den Zweck notwendige Maß; die Richtigkeit der Daten; die Speicherbegrenzung, die eine Identifizierbarkeit nur so lange erlaubt, wie es der Zweck erfordert; sowie Integrität und Vertraulichkeit, also der Schutz vor unbefugter Verarbeitung, Verlust oder Zerstörung. Für die Einhaltung dieser Grundsätze ist der Verantwortliche rechenschaftspflichtig, muss die Einhaltung also nachweisen können.

Ein Sonderfall ist die wissenschaftliche Forschung: Weiterverarbeitung zu Archiv-, Forschungs- oder statistischen Zwecken gilt nicht automatisch als unvereinbar mit dem ursprünglichen Erhebungszweck, und personenbezogene Daten dürfen für solche Zwecke auch länger gespeichert werden, sofern geeignete technische und organisatorische Maßnahmen getroffen werden.

#definition(title: "Einwilligung (DSGVO):")[
Die Einwilligung ist jede freiwillig, für den bestimmten Fall, informiert und unmissverständlich abgegebene Willensbekundung, mit der die betroffene Person zu verstehen gibt, dass sie mit der Verarbeitung ihrer personenbezogenen Daten einverstanden ist. Der Verantwortliche muss die Einwilligung nachweisen können; die betroffene Person kann sie jederzeit widerrufen, ohne dass dies die Rechtmäßigkeit der bis dahin erfolgten Verarbeitung berührt. Für die wissenschaftliche Forschung darf eine Einwilligung auch für bestimmte Forschungsbereiche erteilt werden, da der genaue Verarbeitungszweck zum Zeitpunkt der Datenerhebung oft noch nicht vollständig feststeht.
]

== Technische und organisatorische Maßnahmen (TOM)

#definition(title: "TOM – Technische und organisatorische Maßnahmen:")[
TOM (technische und organisatorische Maßnahmen) sind die konkreten Schutzmaßnahmen, die Verantwortliche und Auftragsverarbeiter nach einer Risikobewertung bei automatisierter Datenverarbeitung ergreifen müssen, um personenbezogene Daten wirksam zu schützen. Rechtsgrundlage ist §64 BDSG.
]

Die wichtigsten Kontrollarten lassen sich wie folgt zusammenfassen:

- *Zugangskontrolle*: Verwehrung des physischen oder technischen Zugangs zu Verarbeitungsanlagen für Unbefugte.
- *Datenträgerkontrolle*: Verhinderung des unbefugten Lesens, Kopierens, Veränderns oder Löschens von Datenträgern.
- *Speicherkontrolle*: Verhinderung der unbefugten Eingabe sowie der unbefugten Kenntnisnahme, Veränderung oder Löschung gespeicherter Daten.
- *Benutzerkontrolle*: Verhinderung der Nutzung automatisierter Verarbeitungssysteme durch Unbefugte mittels Einrichtungen zur Datenübertragung.
- *Zugriffskontrolle*: Sicherstellung, dass Berechtigte nur auf die Daten zugreifen können, für die ihre Zugangsberechtigung gilt.
- *Übertragungskontrolle*: Nachvollziehbarkeit, an welche Stellen Daten übermittelt wurden oder werden können.
- *Eingabekontrolle*: Nachträgliche Überprüfbarkeit, wer wann welche Daten eingegeben oder verändert hat.
- *Transportkontrolle*: Schutz von Vertraulichkeit und Integrität bei Übermittlung und Transport von Datenträgern.
- *Wiederherstellbarkeit* und *Zuverlässigkeit*: Systeme müssen im Störungsfall wiederhergestellt werden können und zuverlässig funktionieren, Fehlfunktionen müssen gemeldet werden.
- *Datenintegrität* und *Verfügbarkeitskontrolle*: Schutz gespeicherter Daten vor Beschädigung, Zerstörung oder Verlust.
- *Auftragskontrolle*: Im Auftrag verarbeitete Daten dürfen nur weisungsgemäß verarbeitet werden.
- *Trennbarkeit*: Zu unterschiedlichen Zwecken erhobene Daten müssen getrennt verarbeitet werden können.

#merke[
Für die Klausur genügt es meist, einige zentrale TOM mit einem Stichwort erklären zu können: Zugangskontrolle (Zugang zu Anlagen), Zugriffskontrolle (Zugriff auf konkrete Daten), Übertragungskontrolle (wohin wurden Daten übermittelt) und Speicherkontrolle (Schutz gespeicherter Daten vor unbefugter Kenntnisnahme oder Veränderung) sind die am häufigsten genannten Beispiele.
]

== Pseudonymisierung und Anonymisierung

Ein zentrales Werkzeugpaar des Datenschutzes ist die Unterscheidung zwischen Pseudonymisierung und Anonymisierung.

#definition(title: "Pseudonymisierung:")[
Pseudonymisierung bezeichnet die Verarbeitung personenbezogener Daten so, dass diese ohne Hinzuziehung zusätzlicher Informationen nicht mehr einer spezifischen Person zugeordnet werden können. Voraussetzung ist, dass diese zusätzlichen Informationen (z. B. eine Zuordnungstabelle) gesondert aufbewahrt und durch eigene TOM geschützt werden. Wichtig: Pseudonymisierte Daten gelten weiterhin als personenbezogen, da eine Re-Identifizierung mit den zusätzlichen Informationen möglich bleibt – die DSGVO findet also weiterhin Anwendung.
]

#definition(title: "Anonymisierung:")[
Anonyme Informationen beziehen sich nicht auf eine identifizierte oder identifizierbare natürliche Person, oder personenbezogene Daten wurden so anonymisiert, dass die betroffene Person nicht oder nicht mehr identifiziert werden kann. Für echte Anonymisierung im Sinne der DSGVO gelten die Datenschutzgrundsätze nicht mehr. Ob eine Person identifizierbar ist, wird anhand aller Mittel beurteilt, die nach allgemeinem Ermessen wahrscheinlich zur Identifizierung genutzt würden – unter Berücksichtigung von Kosten, Zeitaufwand und dem zum Zeitpunkt der Verarbeitung verfügbaren Stand der Technik.
]

Kurz: Bei der Pseudonymisierung bleibt eine Re-Identifizierung über zusätzliche, getrennt aufbewahrte Informationen möglich, bei der Anonymisierung nicht.

=== Die drei Stufen der Anonymität

In der Praxis wird Anonymität nicht als binärer Zustand betrachtet, sondern in drei Stufen unterteilt, die sich vor allem im Restrisiko einer Re-Identifizierung unterscheiden:

#table(
  columns: (auto, 1fr),
  stroke: 0.5pt + gray,
  inset: 8pt,
  [*Stufe*], [*Beschreibung*],
  [Formale Anonymität], [Direkte Identifikatoren (z. B. Name) und Hilfsmerkmale werden entfernt, der übrige Merkmalsumfang sowie fachliche und regionale Gliederungen bleiben jedoch erhalten. Re-Identifizierung ist dadurch grundsätzlich noch möglich.],
  [Faktische Anonymität], [Eine Deanonymisierung ist zwar nicht vollständig ausgeschlossen, wäre aber nur mit einem unverhältnismäßig großen Aufwand an Zeit, Kosten und Arbeitskraft möglich.],
  [Absolute Anonymität], [Merkmale werden durch Vergröberung und Entfernung so weit verändert, dass eine Identifizierung der Auskunftgebenden unmöglich gemacht wird.],
)

#merke[
Klausur-Klassiker: die drei Stufen formale, faktische und absolute Anonymität unterscheiden sich im Wesentlichen darin, wie schwer beziehungsweise ob überhaupt eine Re-Identifizierung noch möglich ist – von grundsätzlich möglich (formal) über nur mit unverhältnismäßigem Aufwand möglich (faktisch) bis hin zu unmöglich (absolut).
]

== HIPAA und HIPAA Safe Harbor

Im US-amerikanischen Kontext ist die wichtigste Regelung zum Schutz von Gesundheitsdaten der *HIPAA* (Health Insurance Portability and Accountability Act) mit seiner Privacy Rule. Ein darin definiertes Verfahren zur De-Identifizierung ist der sogenannte *HIPAA Safe Harbor*: Dabei müssen 18 festgelegte Kategorien von Identifikatoren aus einem Datensatz entfernt oder vergröbert werden, etwa Namen, Telefonnummern, E-Mail-Adressen, Sozialversicherungsnummern, Kfz-Kennzeichen, Geräte-Identifikatoren, IP-Adressen, biometrische Merkmale und Fotos. Geografische Angaben müssen auf eine Ebene oberhalb der Postleitzahl-Kleinregion vergröbert werden, und Datumsangaben (außer dem Jahr) sowie Altersangaben über 89 Jahre müssen entfernt beziehungsweise zu einer Kategorie "90 Jahre oder älter" zusammengefasst werden.

Der Vorteil von HIPAA Safe Harbor liegt in der einfachen, klar spezifizierten Durchführung: Da nur bestimmte Felder entfernt oder vergröbert werden, bleiben die eigentlichen medizinischen Nutzdaten meist unberührt, sofern Orts- und Datumsinformationen für die weitere Nutzung nicht zwingend benötigt werden. Der entscheidende Nachteil ist jedoch ein weiterhin hohes Restrisiko der Re-Identifizierung, wie mehrere Studien gezeigt haben. Nach europäischem Verständnis gilt HIPAA Safe Harbor daher nicht als geeignete Anonymisierung im Sinne der DSGVO – die Daten bleiben re-identifizierbar und damit personenbezogen. Nützlich ist das Verfahren aber als Orientierungsschema dafür, welche Datenfelder für eine Pseudonymisierung zumindest getrennt gespeichert werden sollten.

== Datenschutz in der medizinischen Versorgung

Für die Dokumentation der Behandlung ist die/der Behandelnde verpflichtet, in unmittelbarem zeitlichem Zusammenhang mit der Behandlung eine Patientenakte in Papierform oder elektronisch zu führen. Diese muss alle aus fachlicher Sicht wesentlichen Maßnahmen und Ergebnisse enthalten, etwa Anamnese, Diagnosen, Untersuchungen, Befunde, Therapien, Eingriffe sowie Einwilligungen und Aufklärungen; Arztbriefe sind ebenfalls aufzunehmen. Nachträgliche Berichtigungen müssen so erfolgen, dass der ursprüngliche Inhalt und der Zeitpunkt der Änderung erkennbar bleiben – auch bei elektronischen Patientenakten. Die Aufbewahrungsfrist beträgt in der Regel zehn Jahre nach Abschluss der Behandlung.

Neben dem allgemeinen Datenschutzrecht gilt in der medizinischen Versorgung zusätzlich das *Patienten- beziehungsweise Sozialgeheimnis*. Datenschutz und ärztliche Schweigepflicht sind dabei gleichrangige, voneinander unabhängige Pflichten – man spricht vom sogenannten Zwei-Schranken-Prinzip: Selbst wenn eine Datenverarbeitung datenschutzrechtlich zulässig wäre, kann sie an der Schweigepflicht scheitern, und umgekehrt.

== Datenschutz in der medizinischen Forschung

Auch für die Forschung gilt: Krankenhausärztinnen und -ärzte dürfen Patientendaten (Bestandsdaten) nutzen, soweit dies für das Behandlungsverhältnis, die Aus-, Fort- und Weiterbildung oder für Forschungszwecke im Krankenhaus erforderlich ist; die Weitergabe an andere Personen ist möglich, sofern die Daten im Gewahrsam des Krankenhauses verbleiben und die betreffenden Personen zur Verschwiegenheit verpflichtet werden. Da diese Regelungen auf Landesebene unterschiedlich ausgestaltet sind und sich Gesetze ändern können, ist hier stets Vorsicht geboten.

Für Forschungsvorhaben empfiehlt die Konferenz der Datenschutzbeauftragten des Bundes und der Länder die generischen Datenschutzkonzepte der TMF (Technologie- und Methodenplattform für die vernetzte medizinische Forschung) als Grundlage für die konkrete Ausgestaltung von Datenschutzkonzepten in Forschungsprojekten.

== Die deutsche Telematikinfrastruktur (TI)

#definition(title: "Telematikinfrastruktur (TI):")[
Die Telematikinfrastruktur ist die zentrale, sichere digitale Vernetzungsinfrastruktur des deutschen Gesundheitswesens. Sie verbindet Akteure wie Arztpraxen, Krankenhäuser, Apotheken und Krankenversicherungen und bildet die technische Grundlage für digitale Anwendungen wie die elektronische Gesundheitskarte, das E-Rezept oder die elektronische Patientenakte.
]

Grundlage vieler Anwendungen der TI ist die *elektronische Gesundheitskarte (eGK)*, die seit 2015 als Krankenversicherungskarte verpflichtend ist. Auf ihrer Basis wurden schrittweise weitere digitale Anwendungen eingeführt:

- *Elektronischer Medikationsplan (eMP)*: seit 2020 verfügbar, abhängig von der technischen Ausstattung der Praxis, Zugriff erfordert die PIN der Patientin oder des Patienten.
- *Notfalldatenmanagement*: seit Mitte 2020 im Einsatz, ermöglicht das Hinterlegen wichtiger medizinischer Notfalldaten direkt auf der eGK.
- *Elektronische Patientenakte (ePA)*: seit 1. Juli 2021 technische Voraussetzung bei allen Vertragsärztinnen und -ärzten; ab Januar 2025 startet die "ePA für alle".
- *E-Rezept*: seit dem 1. Januar 2024 im Regelbetrieb, löst das klassische Papierrezept ab.

Konkrete Abläufe innerhalb der TI sind z. B. die Aktualisierung der Versichertenstammdaten, die Übermittlung eines E-Rezepts vom Arzt zur Apotheke und der geschützte Zugriff auf die ePA durch Berechtigte. Da hier hochsensible Gesundheitsdaten zwischen verschiedenen Akteuren ausgetauscht werden, gelten durchgehend hohe Anforderungen an Datenschutz und Informationssicherheit.

#merke[
Klassische Klausurfrage: Nennen Sie vier Anwendungen der Telematikinfrastruktur beziehungsweise der eGK. Antwort: elektronischer Medikationsplan (eMP), Notfalldatenmanagement, elektronische Patientenakte (ePA) und E-Rezept – alle vier bauen auf der eGK als verpflichtender Krankenversicherungskarte auf.
]

#quizblock(title: "Quiz: Datenschutz und Telematikinfrastruktur")[
#frage[Was versteht man unter Anonymisierung im Sinne der DSGVO, und warum gelten die Datenschutzgrundsätze für anonyme Daten nicht mehr?]
#antwort[Anonymisierung liegt vor, wenn sich Informationen nicht (mehr) auf eine identifizierte oder identifizierbare natürliche Person beziehen. Da die DSGVO nur personenbezogene, also einer Person zuordenbare Daten schützt, entfällt bei echter Anonymisierung ihr Anwendungsbereich. Ob eine Person identifizierbar ist, wird anhand aller nach allgemeinem Ermessen wahrscheinlich nutzbaren Mittel beurteilt, einschließlich Kosten, Zeitaufwand und Stand der Technik.]

#frage[Was ist HIPAA Safe Harbor, und welche Vor- und Nachteile hat dieses Verfahren?]
#antwort[HIPAA (Health Insurance Portability and Accountability Act) ist ein US-Gesetz zum Schutz von Gesundheitsdaten; Safe Harbor ist ein darin definiertes De-Identifizierungsverfahren, bei dem 18 festgelegte Identifikatoren (z. B. Namen, Adressen, Geburtsdaten, IP-Adressen) entfernt oder vergröbert werden müssen. Vorteil: einfache, klar spezifizierte Durchführung, Nutzdaten bleiben weitgehend erhalten. Nachteil: hohes Restrisiko der Re-Identifizierung, weshalb es nicht als vollwertige Anonymisierung im Sinne der DSGVO gilt.]

#frage[Nennen Sie die drei Stufen der Anonymität und erklären Sie kurz den Unterschied.]
#antwort[Formale Anonymität: direkte Identifikatoren und Hilfsmerkmale werden entfernt, Re-Identifizierung bleibt aber grundsätzlich möglich. Faktische Anonymität: Deanonymisierung ist nicht ausgeschlossen, aber nur mit unverhältnismäßig hohem Aufwand an Zeit, Kosten und Arbeitskraft möglich. Absolute Anonymität: Merkmale werden so vergröbert bzw. entfernt, dass eine Identifizierung unmöglich wird.]

#frage[Was bedeutet TOM, und nennen Sie vier Beispiele für technisch-organisatorische Maßnahmen.]
#antwort[TOM steht für technische und organisatorische Maßnahmen, die nach §64 BDSG bei automatisierter Datenverarbeitung nach einer Risikobewertung umzusetzen sind. Beispiele: Zugangskontrolle (Zugang zu Verarbeitungsanlagen für Unbefugte verhindern), Zugriffskontrolle (Zugriff nur auf berechtigte Datenbereiche), Übertragungskontrolle (Nachvollziehbarkeit, wohin Daten übermittelt wurden) und Speicherkontrolle (Schutz gespeicherter Daten vor unbefugter Kenntnisnahme, Veränderung oder Löschung).]

#frage[Worin unterscheiden sich Pseudonymisierung und Anonymisierung rechtlich?]
#antwort[Bei der Pseudonymisierung werden personenbezogene Daten so verarbeitet, dass sie ohne zusätzliche, gesondert aufbewahrte Informationen nicht mehr zuordenbar sind – eine Re-Identifizierung bleibt aber grundsätzlich möglich, weshalb pseudonymisierte Daten weiterhin als personenbezogen gelten und die DSGVO anwendbar bleibt. Bei der Anonymisierung ist eine Identifizierung der Person nicht oder nicht mehr möglich, wodurch die Daten aus dem Anwendungsbereich der DSGVO herausfallen.]

#frage[Nennen Sie vier Anwendungen beziehungsweise geplante oder bereits umgesetzte Funktionen der elektronischen Gesundheitskarte (eGK) beziehungsweise der Telematikinfrastruktur.]
#antwort[Elektronischer Medikationsplan (eMP, seit 2020), Notfalldatenmanagement (seit Mitte 2020), elektronische Patientenakte (ePA, seit Juli 2021 verpflichtende technische Voraussetzung, "ePA für alle" ab Januar 2025) und E-Rezept (seit 1. Januar 2024).]

#frage[Was versteht man unter dem Zwei-Schranken-Prinzip im medizinischen Datenschutz?]
#antwort[Das Zwei-Schranken-Prinzip besagt, dass Datenschutzrecht und ärztliche Schweigepflicht (Patienten- bzw. Sozialgeheimnis) zwei gleichrangige, voneinander unabhängige Pflichten sind. Eine Datenverarbeitung muss daher sowohl datenschutzrechtlich zulässig sein als auch mit der Schweigepflicht vereinbar sein – das Nichterfüllen einer der beiden Schranken macht die Verarbeitung unzulässig.]

#frage[Welche Grundsätze muss die Verarbeitung personenbezogener Daten nach der DSGVO erfüllen? Nennen Sie mindestens drei.]
#antwort[Beispiele: Rechtmäßigkeit, Verarbeitung nach Treu und Glauben und Transparenz; Zweckbindung (Erhebung nur für festgelegte, legitime Zwecke); Datenminimierung (Beschränkung auf das notwendige Maß); Richtigkeit; Speicherbegrenzung (Identifizierbarkeit nur so lange wie nötig); Integrität und Vertraulichkeit (Schutz vor unbefugter Verarbeitung, Verlust oder Zerstörung).]
]
