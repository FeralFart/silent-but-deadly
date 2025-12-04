# Homelab Docker Stack Collection

This repository contains my personal collection of Docker Compose files for running various self-hosted services.  
Each service lives in its own folder with a dedicated `*.yml` file for easy deployment, updates, and backup.

---

## Repository Structure

| Service        | Description |
|----------------|-------------|
| **adguard/**   | AdGuard Home – DNS-level ad blocking and network filtering. |
| **filebrowser/** | FileBrowser – Web-based file manager with upload/download and user permissions. |
| **gitea/**     | Gitea – Lightweight, self-hosted Git service similar to GitHub. |
| **heimdall/**  | Heimdall – Application dashboard to organise shortcuts to all services. |
| **homeassistant/** | Home Assistant – Home automation and smart device control. |
| **immich/**    | Immich – Self-hosted photo and video backup solution. |
| **nginx/**     | Nginx – Lightweight web server or reverse proxy. |
| **pihole/**    | Pi-hole – Network-wide ad blocker and DNS sinkhole. |
| **plex/**      | Plex Media Server – Movie and TV streaming for local media libraries. |
| **portainer/** | Portainer – Web UI for managing Docker containers. |
| **watchtower/** | Watchtower – Automatic container updates. |

---

## How to Use

Each service directory contains a single Docker Compose file.  
To deploy any service:

```bash
powershell
cd SERVICE_NAME
docker-compose.exe .\(SERVICE_NAME).yml up -d
e.g.
cd gitea
docker-compose.exe -f .\gitea.yml up -d

---

## License

This repository is for personal use.
Feel free to copy structure or ideas for your own homelab.