# TVR-Cloud

Der TV Reichenburg ist im stetigen Wachstum. Mit diesem Wachstum wird es immer schwieriger, die Zusammenarbeit der einzelnen Mitglieder ohne Weiteres zu koordinieren. Unser aktuelles Vorgehen, dass jeder seine Dateien auf dem eigenen Gerät, einem Drive, NAS oder sogar auf CDs speichert und physisch, per Mail oder per Online-Zugriff weitergibt, reicht meiner Meinung nach nicht mehr aus.

Dieses Projekt entstand aus eigener Kuriosität sowie dem Bedürfnis, unserem Verein eine optimale Basis zur Zusammenarbeit zu schaffen, um weiteres Wachstum zu vereinfachen.

Ziel dieses Repos ist es, alles zu dokumentieren, was benötigt wird, um ein TVR-Cloud-System zu betreiben. Die Inhalte umfassen Vergleiche verschiedener Optionen und entsprechende Empfehlungen/Entschlüsse, Beschreibungen zum Installieren, Aufsetzen und Bedienen verschiedenster Software, Sicherheitsüberlegungen und Wartungshinweise.

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
Unter den grossen Schweizer Hostinganbietern gibt es grundsätzlich [Hostpoint.ch](https://hostpoint.ch) und [Infomaniak.com](https://infomaniak.com), wobei letzterer im Vergleich der relevanten Werte als Favorit hervortritt.

| Anbieter                 | Infomaniak   | Hostpoint    |
| ------------------------ | ------------ | ------------ |
| Kosten .ch Domainname    | CHF 10/Jahr  | CHF 15/Jahr  |
| Kosten 10x E-Mail Nutzer | CHF 192/Jahr | CHF 200/Jahr |
| Speicher Postfach        | unbegrenzt   | 15GB/Nutzer  |
| Drive-Speicher           | 15GB/Nutzer  | 15GB/Nutzer  |
| Standort                 | Genf         | Rapperswil   |

### Domain

Beschreibung:  
Eine Domain ist im Grunde ein nutzerdefinierter Name für eine IP-Adresse, dabei leitet ein Hostinganbieter mit einer statischen IP die Anfragen auf eine Domain zur entsprechenden IP eines Servers weiter.

Der Anbieter unserer Wahl Infomaniak bietet .ch Domainnamen für CHF 10/Jahr an. Im Preis inbegriffen sind ein DDNS-Dienst, unlimitierte Sub-Domains, 1 E-Mail-Adresse sowie eine statische Webseite mit 100Gb Speicherplatz.

Bedienung:  
Verwalten lässt sich die Domain im Infomaniak-Manager unter 'Menu > Web & Domains > Domains > Domainname > Dashboard'.

### Dynamic DNS

Beschreibung:  
Private Netzwerke erhalten ihre öffentlichen IP-Adressen vom jeweiligen Internet Service Provider. Diese IPs sind nicht statisch und können je nach ISP in regelmässigen Abständen ändern. Um trotzdem einen Dienst in einem privaten Netzwerk bereitstellen zu können, gibt es die Möglichkeit, die IP über einen DDNS-Dienst laufend zu aktualisieren. Dabei sendet ein Gerät aus dem Netzwerk die Informationen über die öffentliche IP über eine Schnittstelle zum Hostinganbieter.

Bedienung:  
Wenn man im Manager eine Domain betrachtet, findet man unter 'Menu > Dynamic DNS' die Einstellungen für den DDNS-Dienst. Um den Dienst nutzen zu können, müssen die gewünschten Sub-Domains, ein Nutzername und ein Passwort gewählt werden. Es ist möglich, einzelne Sub-Domains mit verschiedenen Nutzernamen und Passwörtern zu verwalten.

::: info
Diese Nutzernamen und Passwörter sind spezifisch für den DDNS-Dienst und unterscheiden sich vom Standard Infomaniak-Konto.

Für unsere Zwecke reicht es, wenn für alle Subdomains die gleichen Logindaten verwendet werden.

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
Infomaniak bietet einen Mail-Dienst für die jeweilige Domain an. Es wird empfohlen, das Konto mithilfe des gewünschten Mail-Clients zu betrachten.

Bedienung:  
Im Manager unter 'Menu > Collaboration-Tools > Mail-Service > Domainname > Auf meinen Mail-Service zugreifen' lassen sich die einzelnen Adressen für die jeweilige Domain verwalten.

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

Zu jeder Domain erhält man bei Infomaniak gratis eine statische Webseite mit 10Mb Speicher. Infomaniak verfügt auch über Möglichkeiten zur Anbindung einer Wix- oder Wordpress-Seite.

### Virtual Private Server

VPS sind quasi Server, die man mieten kann. Die Vorteile dabei liegen darin, dass keine eigene Hardware und deren Wartung benötigt wird und dass sie über Notstromsysteme sowie eine starke Internetverbindung verfügen. Da unser Verein einen Ausfall des Servers verkraften kann, sind solche Systeme allerdings nicht notwendig und der Wartungsaufwand ist nach dem Zusammenbau relativ klein.

Infomaniak's VPS-Angebot startet bei einem Preis von CHF 38/Monat, dabei verfügt das System über lediglich 250Gb Speicher und 12Gb RAM. Somit ist diese Lösung im Vergleich mit einem eigenen Server nicht besonders ansprechend.

### Öffentliche Cloud

Öffentliche Cloud-Produkte wie Microsoft 365 oder Atlassian Cloud haben den Vorteil, dass man sich keine Gedanken weder über die Hardware noch die Software machen muss und man generell auf einen Supportdienstleister zurückgreifen kann, wenn etwas nicht funktioniert. Der Haken dabei ist der hohe Preis, welcher für nicht kommerzielle Organisationen kaum tragbar ist. Dabei wird trotzdem ein Systemadministrator benötigt, der sich mit dem Management der Cloud auseinandersetzt.

Eine private Cloud hat den Vorteil, dass sie abgesehen von den Betriebskosten des Servers komplett kostenlos ist. Zusätzlich ist eine eigene Lösung flexibler und kann besser auf die Bedürfnisse angepasst werden.

## 2. Hardware

Beschreibung:  
Für gewöhnlich werden Network-Attached-Storage-Geräte für das Hosten von privaten Cloud-Diensten verwendet. Sie verfügen üblicherweise über umfangreiche Möglichkeiten zur Speicherausstattung und Ethernet-Konnektivität. Hochwertigere Geräte verfügen zudem über M.2 Speicheranschlüsse, damit ein NVMe-Cache betrieben werden kann, was die Geschwindigkeit von Speicheroperationen beschleunigen kann. Sie sind deshalb ideal für das Ablagern und Anzeigen von grossen Mediendateien wie Filmen für wenige Nutzer geeignet. Der Nachteil von NAS-Geräten ist, dass sie nur über spärliche Rechenleistung und Arbeitsspeicher verfügen und bereits Einsteigermodelle einen beachtlichen Preis haben. Das macht sie ungeeignet zum Betreiben von Cloud-Diensten für viele Nutzer oder mit höherem Rechenaufwand.

Single-Board-Computer-Systeme zielen darauf ab, möglichst preiswert und kompakt zu sein. Neueste Geräte nutzen wie Smartphones die ARMx64 Prozessor-Architektur, was sie effizient und zugleich leistungsstark macht. Diese Aspekte machen sie ideal für den kontinuierlichen Betrieb von intensiven Aufgaben. SBC kommen in verschiedenen Formen, gewisse mehr und gewisse weniger geeignet für das Hosten von Cloud-Diensten. Dabei gibt es diverse Möglichkeiten, sie mit Erweiterungen auf spezifische Aufgaben abzustimmen.

Unser Verein umfasst viele Mitglieder, welche alle potenziell Gebrauch von einem Cloud-Dienst machen könnten. Primär würde die Cloud als Kollaborationsplattform genutzt, mit der Fähigkeit als Ablage für unsere Fotos zu dienen, also werden eher kleine (Dokumente) bis mittlere Dateien (Fotos) vom System verarbeitet. Die Dienste, die den kollaborativen Aspekt ermöglichen, benötigen mehr Leistung als ein einfacher Datenspeicher.

Vergleich:  
SBC: [Radxa Rock 5C 32GB](https://radxa.com/products/rock5/5c/)  
NAS: [Terramaster F4-424 Pro](https://www.terra-master.com/global/products/homesoho-nas/f4-809.html)

| System            | SBC                        | NAS              |
| ----------------- | -------------------------- | ---------------- |
| Datenträger       | **5x SATA**                | 4x SATA          |
| Ethernet          | **1x 5Gbps**               | 2x 2.5 Gbps      |
| Arbeitsspeicher   | **32GB**                   | 16GB             |
| Prozessor         | **4x 2.26GHz, 4x 1.80GHz** | 8x 1.80GHz       |
| Leistungsaufnahme | **8W**                     | 13W              |
| Cache             | ZFS ARC                    | M.2 SSD          |
| Gehäuse           | eigenbau                   | **vorgefertigt** |
| Preis             | **CHF ~321**               | CHF 579          |

Bemerkungen:  
ZFS ARC verwendet vom System nicht verwendeten Arbeitsspeicher, um Input/Output-Prozesse zu beschleunigen. Diese Caching-Methode ist bei ausreichend Arbeitsspeicher schneller als eine M.2 SSD.

SSD: [Samsung 870 EVO](https://www.samsung.com/ch/memory-storage/sata-ssd/mz-77e4t0b-eu/)  
HDD: [WD Red Plus](https://www.westerndigital.com/products/internal-drives/wd-red-plus-sata-3-5-hdd?sku=WD40EFPX)

| Datenträgertyp (5x)    | SSD            | HDD            |
| ---------------------- | -------------- | -------------- |
| Preis                  | CHF 1300       | **CHF 500**    |
| Haltbarkeit            | **5-10 Jahre** | 3-5 Jahre      |
| Ausfall                | Spontan        | **Allmählich** |
| Leistungsaufnahme Ruhe | **0.2W**       | 1.5W           |
| Leistungsaufnahme Last | 25.0W          | **23.5W**      |
| Schreibgeschwindigkeit | **21.2Gbps**   | 7.2Gbps        |
| Lesegeschwindigkeit    | **22.4Gbps**   | 7.2Gbps        |

Bemerkungen:  
Schreib- und Lesegeschwindigkeiten sind inkonsequent, weil das System durch die verfügbare Internetleitung limitiert wird. Auch der Stromverbrauch ist inkonsequent, da die Strompreise auf die erwartete Lebenszeit kaum einen Unterschied machen. Die Haltbarkeit ist bei SSDs schwer einzuschätzen, da sie vom Nutzungsverhalten abhängt, sollte aber bei geringer Nutzung länger sein als HDDs. Hier wäre die Rechnung lediglich Kosten/Lebensdauer und Egal ob man pessimistisch oder optimistisch rechnet sind HDDs günstiger.

### Hauptserver

Der Hauptserver wird konstant alle Dienste betreiben, dazu wird genügend Rechenleistung sowie Arbeitsspeicher benötigt. Die erwartete Laufzeit des Systems beläuft sich auf 5 Jahre.

| Komponenten                                                                                                                                       | Preis        |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| [1x Radxa Rock 5C (32GB)](https://arace.tech/products/radxa-rock-5c?variant=42798017052852)                                                       | CHF 163      |
| [1x Radxa Heatsink 6540B](https://arace.tech/products/radxa-heatsink-6540b-for-rock-5c)                                                           | CHF 4        |
| [1x Radxa Penta SATA HAT](https://arace.tech/products/radxa-penta-sata-hat-up-to-5x-sata-disks-hat-for-raspberry-pi-5)                            | CHF 37       |
| [1x Radxa eMMC Module (32GB)](https://arace.tech/products/emmc-module?variant=12483308748885)                                                     | CHF 17       |
| [1x Radxa Power DC12 60W](https://arace.tech/products/radxa-power-dc-60w)                                                                         | CHF 10       |
| [1x Delock 5G Ethernet Adapter](https://www.galaxus.ch/de/s1/product/delock-usb-typ-a-5-gigabit-lan-adapter-usb-rj45-1x-netzwerkadapter-54010746) | CHF 34       |
| [1x Delock 92mm 5V Lüfter](https://www.galaxus.ch/de/s1/product/delock-axialluefter-5-v-dc-92-x-92-x-25-mm-schwarz-92-mm-1-x-pc-luefter-60097835) | CHF 20       |
| [5x Delock SATA Verlängerung](https://www.galaxus.ch/de/s1/product/delock-kabel-serial-ata-und-power-intern-interne-kabel-pc-5997343)             | CHF 28       |
| [1x OEM JST PH 2-Pin Stecker](https://www.galaxus.ch/de/s1/product/oem-jst-ph-2pin-female-elektronikkabel-stecker-5997777)                        | CHF 8        |
| [5x WD Red Plus 4TB](https://www.galaxus.ch/de/s1/product/wd-red-plus-4-tb-35-cmr-festplatte-22886688)                                            | CHF 500      |
| 1x DIY Gehäuse                                                                                                                                    | CHF ???      |
| **TOTAL**                                                                                                                                         | **CHF ~821** |

### Backupserver

Der Backupserver wird den Hauptserver spiegeln und übernimmt dessen Funktion im Falle, dass dieser nicht mehr erreichbar wäre. Er ist darauf ausgelegt, nur temporär zugeschaltet zu werden und stellt nur die essenziellen Dienste zur Verfügung, dadurch benötigt er weniger Rechenleistung und Arbeitsspeicher, was ihn günstiger macht.  

| Komponenten                                                                                                                                       | Preis        |
| ------------------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| [1x Radxa Rock 5C Lite (16GB)](https://arace.tech/products/radxa-rock-5c?variant=42798339621044)                                                  | CHF 86       |
| [1x Radxa Heatsink 6540B](https://arace.tech/products/radxa-heatsink-6540b-for-rock-5c)                                                           | CHF 4        |
| [1x Radxa Penta SATA HAT](https://arace.tech/products/radxa-penta-sata-hat-up-to-5x-sata-disks-hat-for-raspberry-pi-5)                            | CHF 37       |
| [1x Radxa eMMC Module (32GB)](https://arace.tech/products/emmc-module?variant=12483308748885)                                                     | CHF 17       |
| [1x Radxa Power DC12 60W](https://arace.tech/products/radxa-power-dc-60w)                                                                         | CHF 10       |
| [1x Delock 5G Ethernet Adapter](https://www.galaxus.ch/de/s1/product/delock-usb-typ-a-5-gigabit-lan-adapter-usb-rj45-1x-netzwerkadapter-54010746) | CHF 34       |
| [1x Delock 92mm 5V Lüfter](https://www.galaxus.ch/de/s1/product/delock-axialluefter-5-v-dc-92-x-92-x-25-mm-schwarz-92-mm-1-x-pc-luefter-60097835) | CHF 20       |
| [5x Delock SATA Verlängerung](https://www.galaxus.ch/de/s1/product/delock-kabel-serial-ata-und-power-intern-interne-kabel-pc-5997343)             | CHF 28       |
| [1x OEM JST PH 2-Pin Stecker](https://www.galaxus.ch/de/s1/product/oem-jst-ph-2pin-female-elektronikkabel-stecker-5997777)                        | CHF 8        |
| [5x WD Red Plus 4TB](https://www.galaxus.ch/de/s1/product/wd-red-plus-4-tb-35-cmr-festplatte-22886688)                                            | CHF 500      |
| 1x DIY Gehäuse                                                                                                                                    | CHF ???      |
| **TOTAL**                                                                                                                                         | **CHF 744** |

### Zusammenbau

- [Zusammenbau SBC](https://youtu.be/l30sADfDiM8 (preview))
- [Inspiration Gehäuse](https://makerworld.com/en/models/1605027-raspberry-pi-5-based-4-bay-nas (preview))

## 3. System

Dieser Abschnitt umfasst die Installation, das Einrichten und die Bedienung sämtlicher Software auf Systemebene.

### Armbian

Beschreibung:  
SBCs verwenden im Grunde herkömmliche Betriebssysteme. Jedoch schränkt die ARM-Architektur und der Mangel eines UEFI BIOS die Optionen etwas ein. Der Hauptunterschied dabei ist, dass das OS direkt auf den Speicher kopiert werden muss. Dies ist über ein herkömmliches Installationsverfahren nicht möglich und es werden vorgefertigte Images benötigt, welche eine 1:1-Kopie eines Systems sind.

Wie die meisten SBC-Hersteller stellt Radxa ein passendes OS-Image für den Rock 5C zur Verfügung. Dieses ist allerdings aufgrund der grafischen Benutzeroberfläche und weiterer vorinstallierter Software nicht für unsere Zwecke geeignet.

Das Armbian-Projekt entwickelt System-Images für diverse SBCs. Dabei gibt es meistens eine minimale Variante, welche perfekt für unsere Zwecke geeignet ist. Der Rock 5C ist sogar mit Platin-Support gelistet. Zusätzlich enthalten alle Armbian-Images das Armbian-Config Tool, welches hilft, das System auf ein internes Medium zu kopieren, sowie einen Katalog an nützlicher Software enthält.

Installation:  

1. Herunterladen des [minimalen Armbian-Images](https://www.armbian.com/radxa-rock-5c/)
2. Herunterladen und Installieren von [Balena Etcher](https://etcher.balena.io/)
3. Eine Micro-SD (>1GB) Karte mit dem PC verbinden
4. Etcher als Administrator ausführen
5. Das heruntergeladene Image und die SD wählen
6. Flash!
7. Die SD in den SD-Kartenleser auf der Unterseite des SBCs einfügen
8. Den SBC einschalten

Einrichtung:  
Nun sollte das System automatisch starten und als nächstes die Erstellung der Nutzerkonten abwarten.

1. Nutzernamen wählen
2. Passwort wählen
3. System auf internen Speicher kopieren `armbian-config --cmd STO001`
   - BTRFS wählen
4. Neu starten

::: warn  
Es ist bei der Wahl des Passworts zu bedenken, dass standardmässig das QWERTY-Tastatur-Layout festgelegt ist.

:::

Bedienung:  
[Armbian-Config Referenz](https://docs.armbian.com/User-Guide_Armbian-Config/)

```sh
dpkg-reconfigure keyboard-configuration # Tastaturlayout einstellen
<sudo> passwd # (Root) Passwort ändern
```

### OpenSSH

Beschreibung:  
Das 'Secure Shell'-Protokoll erlaubt den sicheren Zugriff auf die Konsole eines anderen Gerätes. Damit ist es möglich, das gesamte Gerät aus der Ferne zu bedienen, vorausgesetzt es läuft und ist mit dem Internet verbunden. Für gewöhnlich ist SSH auf jedem Armbian-System bereits vorinstalliert.

Installation:  
`apt install openssh-server -y`

Einrichtung:  

```sh
armbian-config --cmd ACC001 # Root-Login deaktivieren
armbian-config --cmd ACC002 # Root-Login aktivieren
armbian-config --cmd ACC003 # Passwort-Login deaktivieren
armbian-config --cmd ACC004 # Passwort-Login aktivieren
armbian-config --cmd ACC005 # Schlüssel-Login deaktivieren
armbian-config --cmd ACC006 # Schlüssel-Login aktivieren
armbian-config --cmd ACC007 # Einmaliges Passwort deaktivieren
armbian-config --cmd ACC008 # Einmaliges Passwort aktivieren
```

Bedienung:  
[OpenSSH Referenz](https://www.openssh.com/manual.html)

```sh
ssh -h # Hilfe
ssh Nutzer@Adresse # Verbinden
exit # Verbindung trennen
```

### OpenZFS

Beschreibung:  
Das Zettabyte-Dateisystem stellt Werkzeuge für Storage-Pooling, Backups, Kompression, Verschlüsselung, RAID-Management und Speicherbeschleunigung zur Verfügung.

Installation:  
`armbian-config --cmd ZFS001`

oder [Offizielle Anleitung](https://openzfs.github.io/openzfs-docs/Getting%20Started/Debian/index.html#installation)

Einrichtung:  

- ZFS aktivieren:  

```sh
systemctl enable zfs.target
systemctl enable zfs-import.target
systemctl enable zfs-volumes.target
systemctl disable zfs-import-scan.service
systemctl enable zfs-import-cache.service
systemctl enable zfs-volume-wait.service
```

- ZFS starten:  

```sh
systemctl start zfs.target
systemctl start zfs-import.target
systemctl start zfs-volumes.target
systemctl start zfs-import-cache.service
systemctl start zfs-volume-wait.service
```

- ZFS prüfen:  

```sh
systemctl status zfs.target
systemctl status zfs-import.target
systemctl status zfs-volumes.target
systemctl status zfs-import-scan.service
systemctl status zfs-import-cache.service
systemctl status zfs-volume-wait.service
```

Bedienung:  
[OpenZFS Referenz](https://openzfs.github.io/openzfs-docs/man/master/index.html)

Speicherpool erstellen (`zpool create <Argumente> <Poolname> <RAID> <[Medien]>`):

```sh
zpool create -m /mnt/zfs zfs raidz <Medium1> <Medium2> <Medium3> <Medium4> <Medium5>
```

::: warn  
Speichegeräte sollten nur mit ihrer UUID definiert werden, dies weil die Pfade erst nach dem Systemstart festgelegt werden und ändern können, dadurch könnten Daten verloren gehen. Um alle UUIDs zu listen `ls -lh /dev/disk/by-id/`  
[Arch Wiki](https://wiki.archlinux.org/title/ZFS#Creating_ZFS_pools)

:::

Datensets erstellen (`zfs create <Argumente> <Poolname>/<Datensetname>`):

```sh
zfs create /mnt/zfs/cache
zfs create /mnt/zfs/cloud
zfs create -o recordsize=16K -o primarycache=metadata -o logbias=throughput /mnt/zfs/database
zfs create /mnt/zfs/webserver
```

### Cron

Beschreibung:  
Cron dient zur Konfiguration von Aufträgen, welche in bestimmten Intervallen ausgeführt werden müssen. Das Programm unterstützt uns bei der Erstellung von Backups, dem Synchronisieren der Server und beim Überwachen der Erreichbarkeit.

### Sanoid

Beschreibung:  
Sanoid dient zur Erstellung von Backups.

### Syncoid

Beschreibung:  
Syncoid dient zum Synchronisieren von Geräten.

### MiniUPnPc

Beschreibung:  
MiniUPnPc ist eine Kollektion von Befehlen zur Interaktion mit dem 'Universal Plug and Play'-Protokoll. Die Befehle helfen bei der Ermittlung der öffentlichen IP eines Netzwerks sowie der automatischen Portweiterleitung.

Das './miniupnpc.sh'-Script enthält ein Programm zur dynamischen DNS-Aktualisierung, sowie für die Umleitung der Domain auf ein Backupsystem und automatische Portweiterleitung. Dabei ist die Idee, es regelmässig durch Cron ausführen zu lassen.

Installation:  
`apt install miniupnpc -y`

Einrichtung:  

1. Lege die benötigten Parameter im Script fest.
2. Platziere die 'miniupnpc.sh'-Datei im Ordner `/etc/cron.d/`
3. Mach das Script ausführbar `chmod +x /etc/cron.d/miniupnpc.sh`
4. Öffne den Crontab-Editor für root `crontab -e -u root`
5. Damit das Script jede Minute ausgeführt wird, füge diese Zeile hinzu `* * * * * root sh /etc/cron.d/miniupnpc.sh`

Bedienung:  
[MiniUPnPc Referenz](https://manpages.debian.org/unstable/miniupnpc/index.html)  
Ports für 7 Tage zum aktuellen System umleiten `upnpc -r <port> <protokoll> ...`  
Externe IP ermitteln `external-ip`

### Docker

Beschreibung:  
Docker ist ein Tool, um Dienste in Containern zu betreiben. Container haben den Vorteil, vom Host-System abgekapselt zu sein. Das macht sie unabhängig von anderen Containern und sicherer. Der [Dockerhub](hub.docker.com) stellt vorkonfigurierte Container-Images zur Verfügung. Diese enthalten alle benötigten Abhängigkeiten für einen Dienst und beschleunigen deren Inbetriebnahme.

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
In Docker werden individuelle Dienste, die üblicherweise einen eigenen Server haben, in sogenannte Container verpackt. Docker Compose vereinfacht das Management von mehreren Containern und erlaubt, alle mit einem Befehl zu starten. Dabei legt die 'docker-compose.yml'-Datei fest, wie die Container miteinander und mit dem System interagieren.

Bedienung:  
[Docker Compose Referenz](https://docs.docker.com/reference/compose-file/)

Um die Container im Hintergrund zu starten, im Verzeichnis der Compose-Datei `docker compose up -d`  
Um den Terminal in einem Container auszuführen `docker compose exec -it <containername> sh`

### .env

Diese Datei enthält die notwendigen Umgebungsvariablen für die Container. Die leeren Werte müssen frisch konfiguriert werden.

### Cloud

Beschreibung:  
Dieser Container ist eine Nextcloud-Instanz. Nextcloud ist ein Open-Source Clouddienst zum selber Hosten und wird von der Nextcloud GmbH in Deutschland entwickelt. Es bietet einen grossen Katalog an Apps, um die Funktionalität der Cloud zu erweitern. Nextcloud gibt es in unterschiedlichen Installationsmethoden:

- Nextcloud All-in-One - Ein Dockerimage, das darauf abzielt, möglichst einfach zu bedienen zu sein. Es enthält diverse Dienste bereits vorkonfiguriert und kann diese mit einem Knopfdruck zuschalten.
- Nextcloud Pi - Ähnlich wie bei AiO, wird Nextcloud und alle Abhängigkeiten durch die Installation vorkonfiguriert. Dabei wird alles direkt auf das System installiert.
- Nextcloud Server - Diese Variante installiert Nextcloud direkt auf das System.
- Nextcloud Docker - Ein Dockerimage, das nur den Nextcloud-Dienst enthält.

Vergleich:

| Variante      | AiO   | Pi    | Server | Docker |
| ------------- | ----- | ----- | ------ | ------ |
| Nutzeranzahl  | 100   | ∞     | ∞      | ∞      |
| Dokumentation | ★★★☆☆ | ★☆☆☆☆ | ★★★★☆  | ★★★★★  |
| Einfachheit   | ★★★★★ | ☆☆☆☆☆ | ★☆☆☆☆  | ★★★☆☆  |
| Performance   | ★★☆☆☆ | ★★★★☆ | ★★★★★  | ★★★☆☆  |
| Support       | ★★★★★ | ★☆☆☆☆ | ★★★☆☆  | ★★★★☆  |

AiO fällt aufgrund der limitierten Nutzerzahl leider aus dem Rennen, obwohl diese Variante am einfachsten aufzusetzen wäre, da das System darauf ausgelegt sein soll, für unseren gesamten Verein verfügbar zu sein.

Nextcloud Pi verspricht zwar ein ähnliches Level an Bedienbarkeit wie AiO und hätte durch die Bare-Metal-Installation eine bessere Performance, aufgrund der mangelhaften Dokumentation ist es jedoch ziemlich anstrengend und fast unmöglich, allfällige Fehler zu beheben. Support, wenn überhaupt, wird auch nur durch eine kleine Community geleistet.

Nextcloud Server wäre eine mögliche Option, da das System primär für diesen Dienst ausgelegt ist. Die Bare-Metal-Installation macht ein solches System extrem performant, erfordert aber viel manuelles Einrichten. Die Nextcloud GmbH empfiehlt diese Installationsart nur mit Enterprise Support.

Docker umfasst eine grosse Community an Nutzern und viele Hersteller entwickeln ihre eigenen Containerimages. Dadurch finden sich enorm viele Ressourcen im Internet. Dazu kommt, dass Container bereits vorkonfiguriert sind und somit ein Grossteil des Aufwandes zur Inbetriebnahme entfällt. Diese Eigenschaften machen die Installation mit Docker zum Favorit.

Einrichtung:  
Die Dateien unter `/mnt/zfs/cloud/config/` im äquivalenten Verzeichnis ablegen.

Die Konfiguration von Nextcloud befindet sich im Verzeichnis `/var/www/html/config/` innerhalb des Containers. Die Standardkonfigurationsdatei `config.php` kann mit weiteren Konfigurationsdateien mit Namensformat `<name>.config.php` ergänzt werden. Die Datei `/var/www/html/config/config.sample.php` enthält eine Referenz zu allen möglichen Optionen.

Bedienung:  
Im Webinterface können Nutzer die Teil der 'admin'-Gruppe sind unter 'Menu > Administrationseinstellungen' alle weiteren Einstellungen finden.

### Database

Beschreibung:  
Dieser Container ist eine Instanz von MariaDB. Die Nextcloud-Instanz benötigt eine Datenbank zum Speichern von Login- und Metadaten. Die MariaDB-Datenbank wurde aufgrund ihrer Gängigkeit gewählt. Alternativ dazu wäre es möglich, eine PostgreSQL-Datenbank einzurichten.

Einrichtung:  
Die Datei `/mnt/zfs/database/config/my.cnf` im äquivalenten Verzeichnis ablegen.

::: info  
Da als unterliegendes Dateisystem ZFS verwendet wird, empfiehlt es sich, gewisse redundante Mechanismen in der Konfiguration auszuschalten. Zusätzlich gibt ZFS ein paar Empfehlungen für das Datenset, auf dem sich die Datenbank befindet: [Empfehlungen](https://openzfs.github.io/openzfs-docs/Performance%20and%20Tuning/Workload%20Tuning.html#mysql)

:::

::: warn  
Gewisse Einstellungen, die vom der ZFS-Referenz vorgeschlagen werden sind veraltet. In der Datei `/mnt/zfs/database/config/my.cnf` wurde dies berücksichtigt.

:::

### Webserver

Beschreibung:  
Dieser Container ist ein Caddy-Webserver. Caddy ist darauf ausgelegt möglichst leichtgewichtig und einfach zum Bedienen zu sein. Es ist nicht die populärste Wahl für einen Webserver, weshalb die meisten Beispiele für Nginx oder Apache gemacht werden. Nextcloud-Docker bietet zwar eine Imageversion mit integriertem Webserver, hier wird allerdings die Variante ohne gewählt, weil ein separater Webserver benötigt wird.

Einrichtung:  
[Referenz](https://caddyserver.com/docs/caddyfile)

Die Datei `/mnt/zfs/webserver/caddy/Caddyfile` im äquivalenten Verzeichnis ablegen.

Jegliche Konfiguration wird im Caddyfile vorgenommen, der Container muss im Anschluss neu gestartet werden.

### Background

Beschreibung:  
Dieser Container ist im Grunde eine Kopie des Cloud-Containers. Er ist darür gemacht Hintergrundaufträge wie Indexing oder Analysen unabhängig von Cloud-Container zu auszuführen. Dieser Container benötigt die selbe Docker-Compose-Konfiguration wie der Cloud Container.

Einrichtung:  
In der Cloud unter 'Menu > Administrationseinstellungen > Grundeinstellungen > Hintergrundaufgaben' muss Cron ausgewählt werden. Falls der Background Container nicht funktioniert, wird die Cloud nach einer gewissen Zeit eine Warnung anzeigen.

Bedienung:  
Nextcloud nimmt selber Einstellungen vor.

### Cache

Beschreibung:  
Dieser Container ist ein Redis Cache. Ein Cache beschleunigt Datenbankabfragen und macht die Cloud somit performanter.

Einrichtung:  
Redis benötigt eine Einstellung, die auf Systemebene vorgenommen werden muss. Um diese zu tätigen `sudo sysctl -w vm.overcommit_memory=1`

### Office

Beschreibung:  
Dieser Container ist eine Onlyoffice-Documentserver-Instanz, der das kollaborative Bearbeiten von Office-Dokumenten in der Cloud ermöglicht. Im Gegensatzt zu Collabora, ist Onlyoffice darauf ausgelegt, die bestmögliche Funktionalität mit Microsoft-Formaten zu bieten.

Einrichtung:  

- Kein .env-File definieren
- `JWT_ENABLED='false'` als 'environment' definieren
- Interne URLs in `<office>/etc/onlyoffice/documentserver/default.json` erlauben
- Servicenamen als trusted domains in Nextclouds config.php erlauben
- In Nextclouds config.php folgende Einstellungen definieren:  

```php
'DocumentServerUrl' => '/docs/'
'DocumentServerInternalUrl' => 'http://office/'
'StorageUrl' => 'http://webserver/'
```

::: info
Da der Dokument-Dienst nur intern von der Nextcloud-Instanz verwendet wird, dürfen Sicherheitseinstellungen deaktiviert werden. Dies vereinfacht die Einrichtung des Dienstes.

:::

## 5. Netzwerk

### Cloudflare

### Ports

### Subnet

### Proxy

## 6. Sicherheit

Wenn es um die Sicherheit des Systems geht, möchte ich zuerst folgende Fragen stellen:

> Wie vertieft hast du dich mit der Sicherheit deines Computers auseinandergesetzt?
>
> Was ist sicherer, ein Computer, bei dem sich jemand einmal vertieft Gedanken über dessen Sicherheit gemacht hat, oder ein Computer, bei dem sich jemand vermutlich nie Gedanken über die Sicherheit gemacht hat?

### Kommunikationsverschlüsselung

Ziel:  
Schutz vor dem Anzapfen der Kommunikation zwischen Client und Server (Man-in-the-Middle).

Umsetzung:  
Nur Kommunikation über getunnelte Kanäle wie HTTPS und SSH zulassen. HTTP-Anfragen per Webserver auf HTTPS umleiten. Ist in der Konfiguration des Webservers möglich.

### Portweiterleitung

Ziel:  
Reduktion der Schwachstellen in einem lokalen Netzwerk.

Umsetzung:  
Nur die benötigten Ports (22, 80, 443) weiterleiten. So wenig wie möglich, so viel wie nötig.

### Netzwerkfirewall

Ziel:  
Härtung des lokalen Netzwerks vor Attacken.

Umsetzung:  
Einstellungen auf dem Router konfigurieren. Private Router sind meist eher streng mit der Sicherheit, was es wahrscheinlicher macht, dass die Einstellungen gelockert werden müssen, anstatt verschärft.

### Netzwerkseparation

Ziel:  
Schutz vor Zugriffen über andere Geräte auf dem lokalen Netzwerk.

Umsetzung:  
Unterschiedlich je nach Router. Wenn möglich, den Server in ein eigenes Netzwerk platzieren.

### Reverse-Proxy

Ziel:  
Härtung des HTTPS-Zugriffs und Einschränken von zugänglichen Dateien.

Umsetzung:  
Den Webserver entsprechend konfigurieren.

- Verzeichnisse die durch Nutzer nicht erreicht werden müssen sperren.
- Header nach Empfehlungen von Nextcloud einrichten.
- HTTP-Anfragen auf HTTPS umleiten.

### Datenträgerverschlüsselung

Ziel:  
Schutz der Daten bei Diebstahl des Gerätes.

Umsetzung:  
Kann in ZFS eingestellt werden.

### Datenträgerredundanz

Ziel:  
Schutz der Daten bei Ausfall eines Datenträgers.

Umsetzung:  
In ZFS einen Pool mit RAID konfigurieren.

### Serverspiegelung

Ziel:  
Die Funktionalität des Dienstes bei Ausfall des primären Servers aufrecht erhalten.

Umsetzung:  
Ein zweites gespiegeltes Gerät in einem anderen Netzwerk einrichten.

### Wiederherstellungspunkte

Ziel:  
Schutz vor fehlerhaften Einstellungen und Updates.

Umsetzung:  
Mit Cron automatische Erstellung von Sanoid-Backups erstellen.

### Rootless Docker

### Root Sperren

### Sicherheitsschlüssel

## 7. Wartung

### Zugriff

**Empfehlung** - SSH über VSCode nutzen: In VSCode 'Verbinden mit...' anwählen, Nutzer@Adresse und Passwort eingeben.

### Updates

### Datenträger auswechseln

### Backups wiederherstellen
