# NetAlertX runs only on a linux host, requires several directories for persistent storage and runtime operations.

## Directory Layout:

```text
~/docker/netalertx/
├── docker-compose.yml
├── data/
│   ├── db/
│   └── config/
└── tmp/
    ├── log/
    ├── run/
    │   └── tmp/
    ├── api/
    └── nginx/
        └── active-config/
```

## Folders to be created:

```text
./data/db
./data/config
./tmp/log
./tmp/run/tmp
./tmp/api
./tmp/nginx/active-config
```
Commands to create folders and set permissions:

```bash
sudo rm -rf ./data ./tmp
mkdir -p ./data/db ./data/config ./tmp/log ./tmp/run/tmp ./tmp/api ./tmp/nginx/active-config
```

## Set ownership and permissions to allow container read/write

```bash
sudo chmod -R 777 ~/docker/netalertx
```

## Firewall / Networking Fix

### Allow the required NetAlertX ports:

```bash
sudo iptables -I DOCKER-USER -p tcp --dport 20211 -j ACCEPT
sudo iptables -I DOCKER-USER -p tcp --dport 20212 -j ACCEPT
```

### Save iptables rules so they persist after reboot:

```bash
sudo apt install iptables-persistent
sudo netfilter-persistent save
```