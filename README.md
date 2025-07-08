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

Unter den grossen schweizer Hostinganbietern gibt es grundsätzlich [Hostpoint.ch](https://hostpoint.ch) und [Infomaniak.com](https://infomaniak.com), wobei letzterer im Vergleich der relevanten Werte als Favourit hervortritt.

Vergleich:

| Anbieter                 | Infomaniak  | Hostpoint   |
| :----------------------- | ----------- | :---------- |
| Kosten .ch Domainname    | CHF10/Jahr  | CHF15/Jahr  |
| Kosten 10x E-Mail Nutzer | CHF192/Jahr | CHF200/Jahr |
| Speicher Postfach        | unbegrenzt  | 15Gb/Nutzer |
| Drive-Speicher           | 15Gb/Nutzer | 15Gb/Nutzer |
| Standort                 | Genf        | Rapperswil  |

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

## 2. Hardware

### Hauptserver

### Backupserver

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
