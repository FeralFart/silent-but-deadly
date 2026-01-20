# Homelab Docker Stack Collection

This repository contains my personal collection of Docker Compose files for running various self-hosted services.  
Each service lives in its own folder with a dedicated `*.yml` file for easy deployment, updates, and backup.

---

## Repository Structure

| Service        | Description |
|----------------|-------------|
| **adguard/**   | AdGuard Home – DNS-level ad blocking and network filtering. |
| **debian-no-vnc/** | Debian Trixie – Minimal Debian desktop accessible via noVNC. Useful for testing GUI apps or running lightweight desktop in Docker. |
| **dozzle/** | Dozzle – Web-based simplest live-log viewer. |
| **filebrowser/** | FileBrowser – Web-based file manager with upload/download and user permissions. |
| **gitea/**     | Gitea – Lightweight, self-hosted Git service similar to GitHub. |
| **heimdall/**  | Heimdall – Application dashboard to organise shortcuts to all services. |
| **homeassistant/** | Home Assistant – Home automation and smart device control. |
| **immich/**    | Immich – Self-hosted photo and video backup solution. |
| **netalertx/**    | NetAlertX – Solution for comprehensive network monitoring. |
| **nginx-alpine/**     | Nginx – Minimalist reverse proxy for devices with limited storage space. |
| **nginx-web/**     | Nginx – Absolute minimum (no backend, no DB) static HTML dashboard. |
| **nginx/**     | Nginx – Lightweight web server or reverse proxy. |
| **pihole/**    | Pi-hole – Network-wide ad blocker and DNS sinkhole. |
| **plex/**      | Plex Media Server – Movie and TV streaming for local media libraries;<br>also includes related media management services such as: <br><br>qBittorrent – Open-source software alternative to µTorrent,<br>Radarr – Media management tool,<br>Tautulli – Monitoring and analytics tool for Plex. |
| **portainer/** | Portainer – Web UI for managing Docker containers. |
| **trilium/** | Trilium – Cross-platform, hierarchical note taking application. |
| **uptimekuma/** | Uptime Kuma – System monitoring. |
| **watchtower/** | Watchtower – Automatic container updates. |
| **wireguard/** | Wireguard – General purpose VPN. |

---

## How to Use

Each service directory contains a single Docker Compose file.  
To deploy any service:

```powershell
cd SERVICE_NAME
docker-compose -f .\SERVICE_NAME.yml up -d

# Example:
cd gitea
docker-compose -f .\gitea.yml up -d