# TVR-Cloud

Der TV Reichenburg ist im stetigen Wachstum. Mit diesem Wachstum wird es immer schwieriger die Zusammenarbeit der einzelen Mitglieder ohne weiteres zu koordinieren. Unser aktuelles Vorgehen, das jeder seine Dateien auf dem eigenen Gerät, einem Drive, NAS oder sogar auf CDs speichert und physisch, per Mail oder per online Zugriff weitergibt, reicht meiner Meinung nicht mehr aus.

Dieses Projekt entstand aus eigener Kuriosität, sowie dem Bedürftnis unserem Verein eine optimale Basis zur Zusammenarbeit zu schaffen, um weiteren Wachstum zu vereinfachen.

Ziel dieses Repos ist es alles zu dokumentieren was benötigt wird, um ein TVR-Cloud-System zu betreiben. Die Inhalte umfassen Vergleiche verschiedener Optionen und entsprechende Empfehlungen/Entschlüsse, Beschreibungen zum Installieren, Aufsetzen, und Bedienen verschiedenster Software, Sicherheitsüberlegungen und Wartungshinweise.

## Inhalte

- [TVR-Cloud](#tvr-cloud)
  - [Inhalte](#inhalte)
  - [1. Hosting](#1-hosting)
  - [2. Hardware](#2-hardware)
  - [3. System](#3-system)
  - [4. Dienste](#4-dienste)
  - [5. Netzwerk](#5-netzwerk)
  - [6. Sicherheit](#6-sicherheit)
  - [7. Wartung](#7-wartung)

## 1. Hosting

Vergleich:  
Unter den grossen schweizer Hostinganbietern gibt es grundsätzlich [Hostpoint.ch](https://hostpoint.ch) und [Infomaniak.com](https://infomaniak.com), wobei letzterer im Vergleich der relevanten Werte als Favourit hervortritt.

| Anbieter                 | Infomaniak   | Hostpoint    |
| ------------------------ | ------------ | ------------ |
| Kosten .ch Domainname    | CHF 10/Jahr  | CHF 15/Jahr  |
| Kosten 10x E-Mail Nutzer | CHF 192/Jahr | CHF 200/Jahr |
| Speicher Postfach        | unbegrenzt   | 15Gb/Nutzer  |
| Drive-Speicher           | 15Gb/Nutzer  | 15Gb/Nutzer  |
| Standort                 | Genf         | Rapperswil   |

### Domain

Beschreibung:  
Eine Domain ist im Grunde ein Nutzerdefinierter Name für eine IP-Addresse, dabei leitet ein Hostinganbieter mit einer statischen IP die Anfragen auf eine Domain zur entsprechenden IP eines Servers weiter.

Der Anbieter unserer Wahl Infomaniak bietet .ch Domainnamen für CHF10/Jahr an. Im Preis inbegriffen sind ein DDNS-Dienst, unlimitierte Sub-Domains, 1 E-Mail Addresse, sowie eine statische Webseite mit 100Gb Speicherplatz.

Bedienung:  
Verwalten lässt die Domain im Infomaniak-Manager unter 'Menu > Web & Domains > Domains > Domainname > Dashboard'.

### Dynamic DNS

Beschreibung:  
Private Netzwerke erhalten ihre öffentlichen IP-Addressen vom jeweiligen Internet Service Provider. Diese IPs sind nicht statisch und können je nach ISP in regelmässigen Abständen ändern. Um trotzdem einen Dienst in einem privaten Netzwerk bereitstellen zu können, gibt es die Möglichkeit die IP über einen DDNS-Dienst laufend zu aktualisieren. Dabei sendet ein Gerät aus dem Netzwerk die Informationen über die öffentliche IP über eine Schnittstelle zum Hostinganbieter.

Beienung:  
Wenn man im Manager eine Domain betrachtet, findet man unter 'Menu > Dynamic DNS' die Einstellungen für den DDNS-Dienst. Um den Dienst nutzen zu können, müssen die gewünschten Sub-Domains, ein Nutzername und ein Passwort gewählt werden. Es ist möglich einzelne Sub-Domains mit verschiedenen Nutzernamen und Passwörtern zu verwalten.

::: info
Diese Nutzernamen und Passwörter sind spezifisch für den DDNS-Dienst und unterscheiden sich vom Standard Infomaniak Konto.

Für unsere Zwecke reicht es, wenn für alle Subdomains die gleiche Logindaten verwendet werden.

:::

Die benötigten Informationen für das Aktualisieren der DDNS sind:

```txt
username        = <Nutzername>
password        = <Passwort>
hostname        = <Domainname>
ip-adress       = <IP-Addresse>
ddns-server     = infomaniak.com
ddns-path       = "/nic/update?username=<username>&password=<password>&hostname=<hostname>&myip=<ip-adress>"
ssl             = true
protocol        = dyndns2
```

### E-Mail

Beschreibung:  
Infomaniak bietet einen Mail-Dienst für die jeweilige Domain an. Es wird empfohlen das Konto mithilfe des gewüschten Mail-Clients zu betrachten.

Bedienung:  
Im Manager unter 'Menu > Collaboration-Tools > Mail-Service > Domainname > Auf meinen Mail-Service zugreifen' lassen sich die einzelnen Addressen für die jeweilige Domain verwalten.

Wer sein Konto in einem externen Client betrachten möchte, benötigt folgende Informationen:

```txt
IMAP-server     = mail.infomaniak.com
IMAP-port       = 993 (mit SSL)
SMTP-server     = mail.infomaniak.com
SMTP-port       = 465 (mit SSL)
POP3-server     = mail.infomaniak.com
POP3-port       = 995 (mit SSL)
username        = <Nutzername>@<Domainname>
password        = <Passwort>
authentication  = true (für SMTP)
```

### Webseite

Zu jeder Domain erhält man bei Infomaniak gratis eine statische Webseite mit 10Mb Speicher. Infomaniak verfügt auch über Möglichkeiten zur Anbindung einer Wix oder Wordpress Seite.

### Virtual Private Server

VPS sind quasi Server die man Mieten kann. Die Vorteile dabei liegen darin, dass keine eigene Hardware und deren Wartung benötigt wird und das sie über Notstromsysteme, sowie eine starke Internetverbindung verfügen. Da unser Verein ein Ausfall des Servers verkraften kann, sind solche Systeme allerdings nicht notwendig und der Wartungsaufwand ist nach dem Zusammenbau relativ klein.

Infomaniak's VPS-Angebot startet bei einem Preis von CHF 38/Monat, dabei verfügt das System über lediglich 250Gb Speicher und 12Gb RAM. Somit ist diese Lösung im Vergleich mit einem eigenen Server nicht besonders ansprechend.

### Öffentliche Cloud

Öffentliche Cloud Produkte wie Microsoft 365 oder Atlassian Cloud haben den Vorteil, dass man sich keine Gedanken weder über die Hardware noch die Software machen muss und man generell auf einen Supportdienstleister zurückgreifen kann, wenn etwas nicht funktioniert. Der Haken dabei ist der hohe Preis, welcher für nicht kommerzielle Organisationen kaum tragbar sind. Dabei wird trotzdem ein Systemadministrator benötigt, der sich mit dem Management der Cloud auseinandersetzt.

Eine private Cloud hat den Vorteil, dass sie abgesehen von den Betriebskosten des Servers komplett kostenlos ist. Zusätzlich ist eine eigene Lösung flexibler und kann besser auf die Bedürfnisse angebasst werden.

## 2. Hardware

Beschreibung:  
Für gewöhnlich werden Network-Attached-Storage-Geräte für das hosten von privaten Cloud-Diensten verwendet. Sie verfügen üblicherweise über umfangreiche Möglichkeiten zur Speicherausstattung und Ethernet konnektivität. Hochwertigere Geräte verfügen zudem über M.2 Speicheranschlüsse, damit ein NVMe-Cache betrieben werden kann, was die Geschwindigkeit von Speicheroperationen beschleunigen kann. Sie sind deshalb ideal für das Ablagern und Anzeigen von grossen Mediendateien wie Filmen für wenige Nutzer geeignet. Der Nachteil von NAS-Geräten ist, dass sie nur über spärliche Rechenleistung und Arbeitsspeicher verfügen und bereits Einsteigermodelle einen beachtlichen Preis haben. Das macht sie ungeeignet zum Betreiben von Cloud-Diensten für viele Nutzer oder mit höherem Rechenaufwand.

Single-Board-Computer-Systeme zielen darauf ab, möglichst preiswert und kompakt zu sein. Neueste Geräte nutzen wie Smartphones die ARMx64 Prozessor-Architektur, was sie effizient und zugleich leistungsstark macht. Diese Aspekte macht sie ideal für den kontinuierlichen Betrieb von intensiven Aufgaben. SBC kommen in verschiedenen Formen, gewisse mehr und gewisse weniger geeignet für das Hosten von Cloud-Diensten. Dabei gibt es diverse Möglichkeiten sie mit Erweiterungen auf gewisse Aufgaben abzustimmen.

Unser Verein umfasst viele Mitglieder, welche alle potenziell Gebrauch von einem Cloud-Dienst machen könnten. Primär würde die Cloud als Kollaborationsplattform genutzt, mit der Fähigkeit als Ablage für unsere Fotos zu dienen, also werden eher kleine (Dokumente) bis mittlere Dateien (Fotos) vom System verarbeitet. Die Dienste, die den kollaborativen Aspekt ermöglichen, benötigen mehr Leistung als ein einfacher Datenspeicher.

Vergleich:  
Hier wird das gewünsche SBC-System mit einem ähnlichen NAS-Gerät verglichen. Der SBC könnte mit einem [2.5Gbps Ethernet Adapter](https://www.galaxus.ch/de/s1/product/delock-adapter-usb-typ-a-stecker-zu-25-gigabit-lan-usb-30-rj45-25-gigabit-ethernet-1x-netzwerkadapte-13172086) (45CHF) ergänzt werden und die Bandbreite zu erweitern. Ein Gehäuse müsste selbst gebaut werden.

| System            | Radxa Rock 5C 32Gb         | Terramaster F4-424 |
| ----------------- | -------------------------- | ------------------ |
| Schächte          | **5x SATA**                | 4x SATA            |
| Ethernet          | 1x 1Gbps                   | **2x 2.5 Gbps**    |
| Arbeitsspeicher   | **32Gb**                   | 8Gb                |
| Prozessor         | **4x 3.30GHz, 4x 2.31GHz** | 4x 3.40GHz         |
| Leistungsaufnahme | **~8W**                    | ~17W               |
| M.2 Cache         | Nein                       | **Ja**             |
| Preis             | **CHF 275**                | CHF 420            |
| Gehäuse           | selbst genbaut             | **vorgefertigt**   |

Wenn man die verschiedenen Typen von Speichermedien vergleicht, stellt man schnell fest, dass jede Option gewisse Vorteile mit sich bringt. Auf den ersten Blick mögen SSDs als offensichtliche Antwort erscheinen, was bei genauerer Analyse anders aussieht. SSDs mögen zwar schnell sein, das System ist jedoch auf die Transferrate des Ethernet Ports begrenzt und obwohl HDDs im Ruhezustand mehr Strom benötigen als SSDs, sind sie aufgrund des geringeren Preises günstiger auf die erwartete Laufzeit gesehen. Ideal wären also 2.5" Festplatten, da es jedoch nur Optionen mit SMR und nicht CMR gibt, fällt die Wahl auf 3.5" HDDs.

| Medium (5x)            | 2.5" SSD     | 2.5" HDD | 3.5" HDD    |
| ---------------------- | ------------ | -------- | ----------- |
| Preis                  | CHF 1305     | CHF 699  | **CHF 544** |
| Leistungsaufnahme Ruhe | **~0.2W**    | ~1.0W    | ~2.5W       |
| Leistungsaufnahme Last | ~25W         | **~10W** | ~25W        |
| Schreibgeschwindigkeit | **21.2Gbps** | 5.6Gbps  | 8.7Gbps     |
| Lesegeschwindigkeit    | **22.4Gbps** | 5.6Gbps  | 8.7Gbps     |

### Hauptserver

Der Hauptserver wird konstant alle Dienste betreiben, dazu wird genügend Rechenleistung, sowie Arbeitsspeicher benötigt. Die erwartete Laufzeit des Systems beläuft sich auf 5 Jahre.

| Komponenten                                                                                                                           | Preis       |
| ------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [1x Radxa Rock 5C (32Gb)](https://arace.tech/products/radxa-rock-5c?variant=42798017052852)                                           | CHF 163     |
| [1x Radxa Heatsink 6540B](https://arace.tech/products/radxa-heatsink-6540b-for-rock-5c)                                               | CHF 4       |
| [1x Radxa Penta SATA HAT](https://arace.tech/products/radxa-penta-sata-hat-up-to-5x-sata-disks-hat-for-raspberry-pi-5)                | CHF 37      |
| [1x Radxa eMMC Module (32Gb)](https://arace.tech/products/emmc-module?variant=12483308748885)                                         | CHF 17      |
| [1x Radxa Power DC12 60W](https://arace.tech/products/radxa-power-dc-60w)                                                             | CHF 10      |
| [4x Delock SATA Verlängerung](https://www.galaxus.ch/de/s1/product/delock-kabel-serial-ata-und-power-intern-interne-kabel-pc-5997343) | CHF 22      |
| [5x WD Red Plus (4Tb)](https://www.galaxus.ch/de/s1/product/wd-red-plus-4-tb-35-cmr-festplatte-22886688)                              | CHF 500     |
| **TOTAL**                                                                                                                             | **CHF 753** |

### Backupserver

Der Backupserver wird den Hauptserver spiegeln und übernimmt im Falle das dieser nicht mehr erreichbar wäre. Er ist darauf ausgelegt nur temporär zugeschaltet zu werden und stellt nur die essenziellen Dienste zur Verfügung, dadurch benötigt er weniger Rechenleistung und Arbeitsspeicher, was ihn günstiger macht.  

| Komponenten                                                                                                                           | Preis       |
| ------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [1x Radxa Rock 5C Lite (16Gb)](https://arace.tech/products/radxa-rock-5c?variant=42798339621044)                                      | CHF 86      |
| [1x Radxa Heatsink 6540B](https://arace.tech/products/radxa-heatsink-6540b-for-rock-5c)                                               | CHF 4       |
| [1x Radxa Penta SATA HAT](https://arace.tech/products/radxa-penta-sata-hat-up-to-5x-sata-disks-hat-for-raspberry-pi-5)                | CHF 37      |
| [1x Radxa eMMC Module (32Gb)](https://arace.tech/products/emmc-module?variant=12483308748885)                                         | CHF 17      |
| [1x Radxa Power DC12 60W](https://arace.tech/products/radxa-power-dc-60w)                                                             | CHF 10      |
| [4x Delock SATA Verlängerung](https://www.galaxus.ch/de/s1/product/delock-kabel-serial-ata-und-power-intern-interne-kabel-pc-5997343) | CHF 22      |
| [5x WD Red Plus (4Tb)](https://www.galaxus.ch/de/s1/product/wd-red-plus-4-tb-35-cmr-festplatte-22886688)                              | CHF 500     |
| **TOTAL**                                                                                                                             | **CHF 676** |

### Zusammenbau

[Zusammenbau Youtube-Video](https://youtu.be/l30sADfDiM8 (preview))

## 3. System

Dieser Abschnitt umfasst die Installation, das Einrichten und die Bedienung sämtlicher Software auf Systemebene.

### Armbian

Beschreibung:  
SBCs verwenden im Grunde herkömmliche Operationssysteme. Jedoch schränkt die ARM-Architektur und der Mangel eines UEFI BIOS die Optionen etwas ein. Der Hauptunterschied dabei ist, dass das OS direkt auf den Speicher kopiert werden muss. Dies ist über ein herkömmliches Installationsverfahren nicht möglich und es werden vorgefertigte Images benötigt, welche eine 1:1-Kopie eines Systems sind.

Wie die meisten SBC-Hersteller stellt Radxa ein passendes OS-Image für den Rock 5C zur Verfügung. Dieses ist allerdings aufgrund der graphischen Benutzeroberfläche und weiterer vorinstallierter Software nicht für unsere Zwecke geeignet.

Das Armbian-Projekt entwickelt System-Images für diverse SBCs. Dabei gibt es meistens eine minimale Variante, welche perfekt für unsere Zwecke geeignet ist. Der Rock 5C ist sogar mit Platin-Support gelistet. Zusätzlich enthalten alle Armbian-Images das Armbian-Config Tool, welches hilft das System auf ein internes Medium zu kopieren, sowie einen Katalog an nützlicher Software enthält.

Installation:  

1. Herunterladen des [minimalen Armbian-Images](https://www.armbian.com/radxa-rock-5c/)
2. Herunterladen und installieren von [Balena Etcher](https://etcher.balena.io/)
3. Eine Micro-SD (>1Gb) Karte mit dem PC verbinden
4. Etcher als Administrator ausführen
5. Das heruntergeladene Image und die SD wählen
6. Flash!
7. Die SD in den SD-Karten Leser auf der Unterseite des SBCs einfügen
8. Den SBC einschalten

Einrichtung:  
Nun sollte das System automatisch starten und als nächstes die Erstellung der Nutzerkonten abwarten.

1. Nutzernamen wählen
2. Passwort wählen

::: warn
Es ist bei der Wahl des Passworts zu bedenkten, dass standardmässig ist das QWERTY Tastatur-Layout festgelegt ist.

:::

::: info
Verwende zum ändern des Tastaturlayouts`dpkg-reconfigure keyboard-configuration`

Verwende zum ändern des (Root-)Passworts `(sudo) passwd`

:::

Nachdem die Nutzerkonten erstellt wurden, kann das System mit dem Befehl `armbian-config --cmd STO001` auf ein internes Medium kopiert werden. Als File-System empfiehlt sich BTRFS. Im Anschluss muss das System neu gestartet werden.

Bedienung:  

[Armbian-Config Referenz](https://docs.armbian.com/User-Guide_Armbian-Config/)

### OpenSSH

Beschreibung:  
Das 'Secure Shell'-Protokoll erlaubt den sicheren Zugriff auf die Konsole eines anderen Gerätes. Damit ist es möglich das gesamte Gerät aus der Ferne zu bedienen, vorausgesetzt es läuft und ist mit dem Internet verbunden. Grundsätzlich sollte SSH auf jedem Armbian-System vorinstalliert sein.

Installation:  
`apt install openssh-server -y`

Einrichtung:  

- Root Login de-/aktivieren: `armbian-config --cmd ACC001/ACC002`
- Passwort Login de-/aktivieren: `armbian-config --cmd ACC003/ACC004`
- Schlüssel Login de-/aktivieren: `armbian-config --cmd ACC005/ACC006`
- Einmaliges Passwort de-/aktivieren: `armbian-config --cmd ACC007/ACC008`
- Fernzugriff: Den Port 22/TCP im Router auf den Server weiterleiten, um Zugriff ausserhalb des LAN zu ermöglichen.
- **Empfehlung** - SSH über VSCode nutzen: In VSCode 'Verbinden mit...' anwählen, Nutzer@Addresse und Passwort eingeben.

Bedienung:  
[OpenSSH Referenz](https://www.openssh.com/manual.html)

```sh
ssh -h # Hilfe
ssh Nutzer@Addresse # Verbinden
exit # Verbindung trennen
```

### OpenZFS

Beschreibung:  
Das Zettabyte-File-System stellt Werkzeuge für Storage-Pooling, Backups, Kompression, Verschlüsselung, RAID-Management und Speicherbeschleunigung zur Verfügung.

Installation:  
`armbian-config --cmd ZFS001`

oder [Offizielle Anleitung](https://openzfs.github.io/openzfs-docs/Getting%20Started/Debian/index.html#installation)

Einrichtung:  

1. Erstellen eines Pools mit `zpool create <poolname> <RAID> <drive1> <drive2> <drive3> ...` RAID Optionen: mirror, raidz1, raidz2, raidz3, *empty*
2. Erstellen eines Datensets mit `zfs create <poolname>/<datasetname>`
3. Einstellen von Datensets `zfs set <wert> <poolname>/<datensetname>`

Bedienung:  
[OpenZFS Referenz](https://openzfs.github.io/openzfs-docs/man/master/index.html)

### MiniUPnPc

Beschreibung:  
MiniUPnPc ist eine Kollektion von Befehlen zur Interaktion mit dem 'Universal Plug and Play'-Protokoll. Die Befehle helfen bei der Ermittlung der öffentlichen IP eines Netzwerks, sowie der automatischen Portweiterleitung.

Das './miniupnpc.sh'-Script enthält ein Programm zur dynamischen DNS-Aktualisierung, sowie für die Umleitung der Domain auf ein Backupsystem und automatische Portweiterleitung.

Installation:  
`apt install miniupnpc -y`

Einrichtung:  

1. Lege die benötigten Parameter im Script fest.
2. Platziere die 'miniupnpc.sh'-Datei im Ordner `/etc/cron.d/`
3. Mach das Scrip ausführbar `chmod +x /etc/cron.d/miniupnpc.sh`
4. Öffne den Crontab-Editor für root `crontab -e -u root`
5. Damit das Script beim Systemstart ausgeführ wird, füge diese Zeile hinzu `@reboot root sh /etc/cron.d/miniupnpc.sh`

Bedienung:  
[MiniUPnPc Referenz](https://manpages.debian.org/unstable/miniupnpc/index.html)  
Ports für 7 Tage zum aktuellen System umleiten `upnpc -r <port> <protokoll> ...`  
Externe IP ermitteln `external-ip`

### Inadyn (redundant)

Beschreibung:  
Inadyn ist ein Client, der dazu dient automatisch die DNS-Weiterleitung zu aktualisieren. Dabei ermittelt er die öffentliche IP und leitet diese mit Authentifizierungsinformationen zum DDNS-Dienst weiter.

Installation:  
`apt install inadyn -y`

Einrichtung:  
Infomaniak.com wird standardmässig erst ab Version 2.11.0 unterstützt. Für ältere Versionen muss eine Benutzerdefinierte Konfigration mit dem dyndns2 Protokoll angelegt werden (siehe ./inadyn.conf). Die Konfigurationsdatei befindet sich üblicherweise unter `/etc/inadyn.conf` und benötigt 600 Berechtigungen.

Bedienung:  
[Inadyn Referenz](https://github.com/troglobit/inadyn)  
Überprüfe die Syntax der Konfigurationsdatei mit `inadyn --check-config`  
Überprüfe die Funktionalität mit `inadyn -l debug --foreground --force`

### Docker

Beschreibung:  
Docker ist ein Tool um Dienste in Containern zu betreiben. Container haben den Vorteil vom Host-System abgekapselt zu sein. Das macht sie unabhängig von anderen Containern und sicherer. Der [Dockerhub](hub.docker.com) stellt vorkonfigurierte Container-Images zur Verfügung. Diese enthalten alle benötigten Abhängikeiten für ein Dienst und beschleunigen deren Inbetriebnahme.

Installation:  
`armbian-config --cmd CON002`

oder [Offizielle Anleitung](https://docs.docker.com/engine/install/debian/)

Einrichtung:  
Autostart für Docker einstellen
`systemctl enable docker.service`
`systemctl enable containerd.service`

Bedienung:  
[Docker Referenz](https://docs.docker.com/reference/)

## 4. Dienste

Beschreibung:  
Docker Compose vereinfacht das Management von mehreren Containern und erlaubt alle Dienste mit einem Befehl zu starten. Dabei legt die 'docker-compose.yml'-Datei fest, wie die Container miteinander und mit dem System interagieren.

Bedienung:  
[Docker Compose Referenz](https://docs.docker.com/reference/compose-file/)

Um die Dienste im Hintergrund zu starten, im Verzeichnis der Compose-Datei `docker compose up -d`  
Um den Terminal in einem Container auszuführen `docker compose exec -it <containername> sh`

### .env

Diese Datei enthält die notwendigen Umgebungsvariablen für unsere Dienste. Die leeren Werte müssen konfiguriert werden.

### Cloud

Beschreibung:  
Dieser Dienst ist eine Nextcloud-Instanz. Nextcloud ist ein Open-Source Clouddienst zum selber hosten und wird von der Nextcloud GmbH in Deutschland entwickelt. Es ist bietet einen grossen Katalog an Apps um die Funktionalität der Cloud zu erweitern. Nextcloud gibt es in unterschiedlichen Installationsmethoden:

- Nextcloud All-in-One - Ein Dockerimage, das darauf abzielt, möglicht einfach zum Bedienen zu sein. Es enthält diverse Dienste bereits vorkonfiguriert und kann diese mit einem Knopfdruck zuschalten.
- Nextcloud Pi - Ähnlich wie bei AiO, wird Nextcloud und alle Abhängigkeiten durch die Installation vorkonfiguriert. Dabei wird alles direkt auf das System installiert.
- Nextcloud Server - Diese Variante installiert Nextcloud direkt auf das System.
- Nextcloud Docker - Ein Dockerimage das nur den Nextcloud-Dienst enthält.

Vergleich:

| Variante      | AiO   | Pi   | Server | Docker |
| ------------- | ----- | ---- | ------ | ------ |
| Nutzeranzahl  | 100   | ∞    | ∞      | ∞      |
| Dokumentation | ***   | *    | ****   | *****  |
| Bedienbarkeit | ***** | N/A  | *      | ***    |
| Performance   | **    | **** | *****  | ***    |
| Support       | ***** | *    | *****  | ***    |

AiO fällt aufgrund der limitierten Nutzerzahl leider aus dem Rennen, obwohl diese Variante am einfachsten aufzusetzen wäre. da das System darauf ausgelegt sein soll, für unseren gesamten Verein verfügbar zu sein.

Nextcloud Pi verspricht zwar ein ähnliches Level an Bedienbarkeit wie AiO und hätte durch die Bare-Metal-Installation eine bessere Performance, aufgrund der mangelhaften Dokumentation ist es jedoch ziemlich anstengend und fast unmöglich, allfällige Fehler zu beheben. Support, wenn überhaupt, wird auch nur durch eine kleine Community geleistet.

Nextcloud Server wäre eine mögliche Option, da das System primär für diesen Dienst ausgelegt ist. Die Bare-Metal-Installation macht ein solches System extrem performant, erfordert aber viel manuelles Einrichten. Die Nextcloud GmbH emfiehlt diese Installationsart mur mit Enterprise Support.

Docker umfasst eine grosse Community an Nutzern und viele Hersteller entwickeln ihre eigenen Containerimages. Durch das finden sich enorm viele Resourcen im Internet. Dazu kommt, das Container bereits vorkonfiguriert sind und somit ein grossteil den Aufwandes zur Inbetriebnahme entfällt. Diese Eigenschaften machen die Installation mit Docker zum Favourit.

Einrichtung:  
Die Konfiguration von Nextcloud befindet sich in der Datei `/var/www/html/config/config.php` innerhalb des Containers. Die Datei `/var/www/html/config/sample.config.php` enthält eine Referenz zu allen möglichen Optionen.

### Data

Beschreibung:  
Dieser Dienst ist eine Instanz von MariaDB. Die Nextcloud-Instanz benötigt eine Datenbank zum Speichern von Logindaten. Die MariaDB-Datenbank wurde aufgrund ihrer Gängigkeit gewählt. Alternativ dazu wäre es möglich eine PostgreSQL-Datenbank einzurichten.

Einrichtung:  
Da als unterliegendes Dateisystem ZFS verwendet wird, empfiehlt es sich gewisse redundante Mechanismen in der Konfiguration auszuschalten. Zusätzlich gibt ZFS ein paar Empfehlungen für das Datenset, auf dem sich die Datenbank befindet: [Empfehlungen](https://openzfs.github.io/openzfs-docs/Performance%20and%20Tuning/Workload%20Tuning.html#mysql)

### Web

Beschreibung:  
Wir verwenden Caddy als Webserver. Caddy ist darauf ausgelegt möglichst einfach zum Bedienen und leichtgewichtig zu sein. Es ist nicht die populärste Wahl für einen Webserver, weshalb die meisten Beispiele für Nginx oder Apache gemacht werden. Nextcloud-Docker bietet zwar eine Imageversion mit integriertem Apache-Webserver, da aber so oder so ein weiterer Webserver als Reverse-Proxy konfiguriert wird, kann dieser den Apache-Webserver auch komplett ersetzen.

Einrichtung:

### Backup

### Cache

### Office

## 5. Netzwerk

### Cloudflare

### Ports

### Subnet

### Webserver

## 6. Sicherheit

Wenn es um die Sicherheit des Systems geht, möchte ich zuerst folgende Fragen stellen:

> Wie vertieft hast du dich mit der Sicherheit deines Computers auseinandergesetzt?
>
> Was ist sicherer, ein Computer bei dem sich jemand einmal vertieft Gedanken über dessen Sicherheit gemacht hat, oder ein Computer bei dem sich jemand vermutlich nie Gedanken über die Sicherheit gemacht hat?

### Kommunikationsverschlüsselung

Ziel:  
Schutz vor dem Anzapfen der Kommunikation zwischen Client und Server (Man-in-the-Middle).

Umsetzung:  
Nur Kommunikation über getunelte Kanäle wie HTTPS und SSH zulassen. HTTP-Anfragen per Webserver auf HTTPS umleiten. Ist in der Konfiguration des Webserver möglch.

### Portweiterleitung

Ziel:  
Reduktion der Schwachstellen in einem lokalen Netzwerk.

Umsetzung:  
Nur die benötigten Ports (22, 80, 443) weiterleiten. So wenig wie möglich, so viel wie nötig.

### Netzwerkfirewall

Ziel:  
Härtung des lokelen Netzwerks vor Attacken.

Unsetzung:  
Einstellungen auf dem Router konfigurieren. Private Router sind meist eher streng mit der Sicherheit, was es wahrscheinlicher macht, dass die Einstellungen gelckert werden müssen, anstatt verschärft.

### Netzwerkseparation

Ziel:  
Schutz vor Zugriffen über andere Geräte auf dem lokalen Netzwerk.

Umsetzung:  
Unterschielich je nach Router. Wenn möglich, den Server in ein eigenes Netzwerk platzieren.

### Reverse-Proxy

Ziel:  
Härtung des HTTPS Zugriffs und einschränken von zugänglichen Dateien.

Umsetzung:  
Den Reverse-Proxy Dienst entsprechend konfigurieren.

### Datenträgerverschlüsselung

Ziel:  
Schutz der Daten bei Verlust des Gerätes.

Umsetzung:  
Kann in ZFS eingestellt werden.

### Datenträgerredundanz

Ziel:  
Schutz der Daten für den Fall, dass ein Datenträger kaputt geht.

Umsetzung:  
In ZFS einen Pool mit RAID konfigurieren.

### Serverspiegelung

Ziel:  
Die Funktionalität des Dienstes bei Ausfall des primären Servers aufrecht erhalten.

### Wiederherstellungspunkte

### Rootless Operationssystem

### Sicherheitsschlüssel

## 7. Wartung
