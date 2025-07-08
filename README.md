# TVR-Cloud

Ziel dieses Repos ist es den Aufbau des TVR-Cloud-Servers zu dokumentieren. Die Inhalte umfassen Informationen zu Analysen von Alternativen, getroffenen Entscheidungen und Handhabung verschiedener Software. Jedes Kapitel behandelt einen Aspekt des Aufbaus.

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

Verwendung:

Verwalten lässt die Domain im Infomaniak-Manager unter 'Menu > Web & Domains > Domains > Domainname > Dashboard'.

### Dynamic DNS

Beschreibung:

Private Netzwerke erhalten ihre öffentlichen IP-Addressen vom jeweiligen Internet Service Provider. Diese IPs sind nicht statisch und können je nach ISP in regelmässigen Abständen ändern. Um trotzdem einen Dienst in einem privaten Netzwerk bereitstellen zu können, gibt es die Möglichkeit die IP über einen DDNS-Dienst laufend zu aktualisieren. Dabei sendet ein Gerät aus dem Netzwerk die Informationen über die öffentliche IP über eine Schnittstelle zum Hostinganbieter.

Verwendung:

Wenn man im Manager eine Domain betrachtet, findet man unter 'Menu > Dynamic DNS' die Einstellungen für den DDNS-Dienst. Um den Dienst nutzen zu können, müssen die gewünschten Sub-Domains, ein Nutzername und ein Passwort gewählt werden, **diese sind spezifisch für den DDNS-Dienst und unterscheiden sich vom Standard Infomaniak Konto.** Es ist möglich einzelne Sub-Domains mit verschiedenen Nutzernamen und Passwörtern zu verwalten.

Die wichtigen Informationen für das Aktualisieren der DDNS sind:

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

Verwendung:

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

### Virtual Private Server

## 2. Hardware

Beschreibung:

Für gewöhnlich werden Network-Attached-Storage-Geräte für das hosten von privaten Cloud-Diensten verwendet. Sie verfügen üblicherweise über umfangreiche Möglichkeiten zur Speicherausstattung und Ethernet konnektivität. Hochwertigere Geräte verfügen zudem über die M.2 Speicheranschlüsse, damit ein NVMe cache betrieben werden kann, was die Geschwindigkeit von Speicheroperationen beschleunigen kann. Sie sind deshalb ideal für das Ablagern und Anzeigen von grossen Mediendateien wie Filmen für wenige Nutzer geeignet. Der Nachteil von NAS-Geräten ist, dass sie nur über spärliche Rechenleistung und Arbeitsspeicher verfügen und bereits Einsteigermodelle einen beachtlichen Preis haben. Das macht sie ungünstig zum betreiben von Cloud-Diensten für viele Nutzer oder mit höherem Rechenaufwand.

Single-Board-Computer-Systeme zielen darauf ab, möglichst preiswert und kompakt zu sein. Neueste Geräte nutzen wie Smartphones die ARMx64 Prozessor-Architektur, was sie effizient und zugleich leistungsstark macht. Diese Aspekte macht sie ideal für den kontinuierlichen Betrieb von intensiven Aufgaben. SBC kommen in verschiedenen Formen, gewisse mehr und gewisse weniger geeignet für das Hosten von Cloud-Diensten. Dabei gibt es viele Möglichkeiten sie mit Erweiterungen auf gewisse Tasks abzustimmen.

Unser Verein umfasst viele Mitglieder, welche alle potenziell Gebrauch von einem Cloud-Dienst machen könnte. Primär würde die Cloud als Kollaborationsplattform genutzt, mit der Fähigkeit als Ablage für unsere Fotos zu dienen, also werden eher kleine bis mittlere Dateien vom System gehandlet. Die Dienste, die den kollaborativen Aspekt ermöglichen, benötigen mehr Leistung als ein einfacher Datenspeicher.

Vergleich:

Hier wird das gewünsche SBC-System mit einem ähnlichen NAS-Gerät verglichen. Der SBC könnte mit einem [2.5Gbps Ethernet Adapter](https://www.galaxus.ch/de/s1/product/delock-adapter-usb-typ-a-stecker-zu-25-gigabit-lan-usb-30-rj45-25-gigabit-ethernet-1x-netzwerkadapte-13172086) (45CHF) ergänzt werden.

| System            | Radxa Rock 5C 32Gb          | Terramaster F4-424  |
| ----------------- | --------------------------- | ------------------- |
| Schächte          | **5x SATA**                 | 4x SATA             |
| Ethernet          | 1x 1Gbps                  | **2x 2.5 Gbps**     |
| Arbeitsspeicher   | **32Gb**                    | 8Gb                 |
| Prozessor         | **4x 3.30GHz, 4x 2.31GHz**  | 4x 3.40GHz          |
| Leistungsaufnahme | **~8W**                     | ~17W                |
| M.2 Cache         | Nein                        | **Ja**              |
| Preis             | **CHF 275**                 | CHF 420             |

Wenn man die verschiedenen Typen von Speichermedien vergleicht, stellt man schnell fest, dass jede Option gewisse Vorteile mit sich bringt. Auf den ersten Blick mögen SSDs als offensichtliche Antwort erscheinen, was bei genauerer Analyse anders aussieht. SSDs mögen zwar schnell sein, das System ist jedoch auf die Transferrate des Ethernet Ports begrenzt und obwohl HDDs im Ruhezustand mehr Strom benötigen als SSDs, sind sie aufgrund des geringeren Preises günstiger auf die erwartete Laufzeit gesehen. Ideal wären also 2.5" Festplatten, da es jedoch nur Optionen mit SMR und nicht CMR gibt, fällt die Wahl auf 3.5" HDDs.

| Medium (5x)               | 2.5" SSD      | 2.5" HDD  | 3.5" HDD    |
| ------------------------- | ------------- | --------- | ----------- |
| Preis                     | CHF 1305      | CHF 699   | **CHF 544** |
| Leistungsaufnahme Standby | **~0.2W**     | ~1.0W     | ~2.5W       |
| Leistungsaufnahme Last    | ~25W          | **~10W**  | ~25W        |
| Lesegeschwindigkeit       | **22.4Gbps**  | 5.6Gbps   | 8.7Gbps     |
| Schreibgeschwindigkeit    | **21.2Gbps**  | 5.6Gbps   | 8.7Gbps     |

### Hauptserver

Der Hauptserver wird konstant alle Dienste betreiben, dazu wird genügend Rechenleistung, sowie Arbeitsspeicher benötigt.

| Komponenten                                                                                                                           | Preis        |
| ------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| [1x Radxa Rock 5C (32Gb)](https://arace.tech/products/radxa-rock-5c?variant=42798017052852)                                           | CHF 163      |
| [1x Radxa Heatsink 6540B](https://arace.tech/products/radxa-heatsink-6540b-for-rock-5c)                                               | CHF 4        |
| [1x Radxa Penta SATA HAT](https://arace.tech/products/radxa-penta-sata-hat-up-to-5x-sata-disks-hat-for-raspberry-pi-5)                | CHF 37       |
| [1x Radxa eMMC Module (32Gb)](https://arace.tech/products/emmc-module?variant=12483308748885)                                         | CHF 17       |
| [1x Radxa Power DC12 60W](https://arace.tech/products/radxa-power-dc-60w)                                                             | CHF 10       |
| [4x Delock SATA Verlängerung](https://www.galaxus.ch/de/s1/product/delock-kabel-serial-ata-und-power-intern-interne-kabel-pc-5997343) | CHF 44       |
| [5x WD Red Plus (4Tb)](https://www.galaxus.ch/de/s1/product/wd-red-plus-4-tb-35-cmr-festplatte-22886688)                              | CHF 500      |
| **TOTAL**                                                                                                                             | **CHF 775**  |

### Backupserver

Der Backupserver wird den Hauptserver spiegeln und übernimmt im Falle das dieser nicht mehr erreichbar wäre. Er ist darauf ausgelegt nur temporär zugeschaltet zu werden und hostet nur die essenziellen Dienste, dadurch benötigt er weniger Rechenleistung und Arbeitsspeicher, was ihn günstiger macht.

| Komponenten                                                                                                                           | Preis        |
| ------------------------------------------------------------------------------------------------------------------------------------- | ------------ |
| [1x Radxa Rock 5C Lite (16Gb)](https://arace.tech/products/radxa-rock-5c?variant=42798339621044)                                      | CHF 86       |
| [1x Radxa Heatsink 6540B](https://arace.tech/products/radxa-heatsink-6540b-for-rock-5c)                                               | CHF 4        |
| [1x Radxa Penta SATA HAT](https://arace.tech/products/radxa-penta-sata-hat-up-to-5x-sata-disks-hat-for-raspberry-pi-5)                | CHF 37       |
| [1x Radxa eMMC Module (32Gb)](https://arace.tech/products/emmc-module?variant=12483308748885)                                         | CHF 17       |
| [1x Radxa Power DC12 60W](https://arace.tech/products/radxa-power-dc-60w)                                                             | CHF 10       |
| [4x Delock SATA Verlängerung](https://www.galaxus.ch/de/s1/product/delock-kabel-serial-ata-und-power-intern-interne-kabel-pc-5997343) | CHF 44       |
| [5x WD Red Plus (4Tb)](https://www.galaxus.ch/de/s1/product/wd-red-plus-4-tb-35-cmr-festplatte-22886688)                              | CHF 500      |
| **TOTAL**                                                                                                                             | **CHF 698**  |

## 3. System

### Armbian

### OpenSSH

### OpenZFS

### Inadyn

### Miniupnpc

### Docker

## 4. Dienste

### Cloud

### Data

### Web

### Backup

### Cache

### Office

## 5. Netzwerk

### Cloudflare

### Ports

### Subnet

### Webserver

## 6. Sicherheit

### Kommunikationsverschlüsselung

### Portweiterleitung

### Netzwerkfirewall

### Netzwerkseparation

### Reverse-Proxy

### Datenträgerverschlüsselung

### Datenträgerredundanz

### Serverspiegelung

### Wiederherstellungspunkte

### Rootless Operationssystem

### Sicherheitsschlüssel

## 7. Wartung
