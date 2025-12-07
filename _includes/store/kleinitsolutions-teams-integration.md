{% if page.lang == 'de' %}
## Microsoft Teams Integration für Kimai

Ein Kimai-Plugin zur automatischen Erstellung von Kunden- und Projektordnern in einem ausgewählten Microsoft-Team.  
Basierend auf Ihren Kundendaten und Projekten in Kimai legt das Plugin die entsprechenden Ordnerstrukturen im gewünschten Team an – vollständig automatisiert und zuverlässig.

Optimieren Sie Ihre Dokumentenablage, reduzieren Sie manuellen Aufwand und stellen Sie sicher, dass Ihre Teams immer den passenden Ordner zur richtigen Zeit haben.

Perfekt für Agenturen, IT-Dienstleister und Unternehmen, die Microsoft Teams als zentrale Arbeitsplattform nutzen.

## Automatische Ordnerstrukturen in Microsoft Teams

Das Plugin erstellt automatisch:

- Kundenordner
- Projektordner
- Strukturierte Ablagen unterhalb eines von Ihnen definierten Basisordners

Der gesamte Prozess geschieht über die Microsoft Graph API, ohne manuelles Eingreifen.

## Was ist enthalten?

- ein neuer Konsolenbefehl `ms-teams:sync-folders` für die Erstellung von Kunden- und Projektordnern
- Validierung Ihrer Teams-Konfiguration (Team ID, Ordnerpfad)
- Unterstützung für `.env`-Variablen:
    - `GRAPH_TENANT_ID`
    - `GRAPH_CLIENT_ID`
    - `GRAPH_CLIENT_SECRET`

## Systemvoraussetzungen

Sie benötigen:

- eine gültige Azure-App-Registrierung
- die Möglichkeit, Umgebungsvariablen in `.env.local` zu setzen
- Zugriff auf Microsoft Graph API

Cronjobs sind optional – das Plugin kann auch manuell über den Befehl ausgeführt werden.

## Einrichtungsschritte nach der Installation

1. Fügen Sie in Ihrer Kimai-Installation eine `.env` Datei hinzu:

```
GRAPH_TENANT_ID=
GRAPH_CLIENT_ID=
GRAPH_CLIENT_SECRET=
```
Wenn Sie Docker verwenden, fügen Sie die Variablen in Ihrer `docker-compose.yml` Datei hinzu oder setzen Sie die folgende Flags
```
-e GRAPH_TENANT_ID=''
-e GRAPH_CLIENT_ID=''
-e GRAPH_CLIENT_SECRET=''
```
beim Starten des Containers.

2. Konfigurieren Sie unter  
   **Kimai → System → Microsoft Teams**  
   das gewünschte Team und den Ordnerpfad.

3. Führen Sie bei Bedarf den Konsolenbefehl aus:

```
bin/console ms-teams:sync-folders
```


Damit werden Kunden- und Projektordner mit Ihrem Microsoft-Team erstellt, solange Sie noch nicht existieren.

{% else %}

## Microsoft Teams Integration for Kimai

A Kimai plugin that automatically creates customer and project folders inside a selected Microsoft Team.  
Based on your Kimai customer and project data, the plugin generates the corresponding folder structure within the chosen Team — fully automated and reliable.

Optimize your document organization, reduce manual work, and ensure your team always has the correct folder at the right time.

Perfect for agencies, IT service providers, and organizations using Microsoft Teams as their main collaboration platform.

## Automated folder structure in Microsoft Teams

The plugin automatically creates:

- customer folders
- project folders
- structured subfolders inside a chosen base directory

Everything is handled via the Microsoft Graph API without manual interaction.

## What's included?

- a new console command `ms-teams:sync-folders` for creation of customer and project folders
- configuration validation (Team ID, folder path)
- support for `.env` variables:
    - `GRAPH_TENANT_ID`
    - `GRAPH_CLIENT_ID`
    - `GRAPH_CLIENT_SECRET`

## System Requirements

You need:

- a valid Azure App Registration
- the ability to set environment variables via `.env.local`
- access to Microsoft Graph API

Cronjobs are optional — the sync command may also run manually.

## Setup steps after Installation

1. Create a `.env` file inside your Kimai installation and add:

```
GRAPH_TENANT_ID=
GRAPH_CLIENT_ID=
GRAPH_CLIENT_SECRET=
```
If you are using Docker, add the variables to your `docker-compose.yml` file or set the following flags
```
-e GRAPH_TENANT_ID=''
-e GRAPH_CLIENT_ID=''
-e GRAPH_CLIENT_SECRET=''
```
when starting the container.

2. Configure the desired team and folder path under:  
   **Kimai → System → Microsoft Teams**

3. Run the sync command if needed:

```
bin/console ms-teams:sync-folders
```

This creates all customer and project folders with your selected Microsoft Team.
{% endif %}
