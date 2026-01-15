FROM debian:trixie

ENV DEBIAN_FRONTEND=noninteractive
ENV DISPLAY=:0
ENV VNC_PORT=5900
ENV NOVNC_PORT=6080
ENV HOME=/home/debian

# Build-time password args
ARG ROOT_PASSWORD= # Root password
ARG DEBIAN_PASSWORD= # User (debian) password

# Install all packages
RUN apt-get update && apt-get install -y --no-install-recommends \
    xfce4 xfce4-terminal xfdesktop4\
    x11vnc xvfb \
    novnc websockify \
    dbus-x11 \
    supervisor \
    fonts-dejavu \
    sudo \
    curl wget \
    nano less tree \
    unzip zip \
    iproute2 net-tools iputils-ping \
    unattended-upgrades apt-listchanges \
    chromium \
 || apt-get install -y --no-install-recommends chromium-browser \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

# Configure unattended upgrades
RUN dpkg-reconfigure --frontend noninteractive unattended-upgrades && \
    echo 'APT::Periodic::Update-Package-Lists "1";' >> /etc/apt/apt.conf.d/20auto-upgrades && \
    echo 'APT::Periodic::Unattended-Upgrade "1";' >> /etc/apt/apt.conf.d/20auto-upgrades && \
    echo 'APT::Periodic::AutocleanInterval "7";' >> /etc/apt/apt.conf.d/20auto-upgrades

# Configure apt-listchanges frontend correctly
RUN echo 'DPkg::Tools::Options::/usr/bin/apt-listchanges "frontend=pager";' > /etc/apt/apt.conf.d/20apt-listchanges

# Create user
RUN useradd -m -s /bin/bash debian

# Add debian to sudo group
RUN usermod -aG sudo debian

# Set passwords for root and debian
RUN echo "root:${ROOT_PASSWORD}" | chpasswd && \
    echo "debian:${DEBIAN_PASSWORD}" | chpasswd

# Optional: allow passwordless sudo (commented out)
# RUN echo "debian ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Ensure Chromium profile folder exists and is owned by debian
RUN mkdir -p /home/debian/chromium-profile && \
    chown -R debian:debian /home/debian/chromium-profile

# Create Chromium wrapper script to reduce DBus/GCM errors
RUN echo '#!/bin/bash\nexec chromium --user-data-dir=/home/debian/chromium-profile --no-sandbox --disable-gpu --disable-gcm --disable-background-networking "$@"' \
    > /usr/local/bin/start-chromium && chmod +x /usr/local/bin/start-chromium && chown debian:debian /usr/local/bin/start-chromium

# Create XFCE menu shortcut for Chromium
RUN mkdir -p /home/debian/.local/share/applications && \
    echo '[Desktop Entry]\nName=Chromium\nComment=Web Browser\nExec=/usr/local/bin/start-chromium %U\nIcon=chromium\nTerminal=false\nType=Application\nCategories=Network;WebBrowser;\nStartupNotify=true' \
    > /home/debian/.local/share/applications/chromium.desktop && \
    chmod +x /home/debian/.local/share/applications/chromium.desktop && \
    chown -R debian:debian /home/debian/.local/share/applications

# Logs
RUN mkdir -p /home/debian/logs && chown -R debian:debian /home/debian/logs

# Fix noVNC path
RUN ln -s /usr/share/novnc/vnc.html /usr/share/novnc/index.html

# Create VNC password. Default is "debian".
RUN mkdir -p /home/debian/.vnc && \
    x11vnc -storepasswd debian /home/debian/.vnc/passwd && \
    chown -R debian:debian /home/debian/.vnc

# Supervisor config
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# Switch to debian user
USER debian
WORKDIR /home/debian

# Expose noVNC
EXPOSE 6080

# Start supervisor
CMD ["/usr/bin/supervisord", "-c", "/etc/supervisor/conf.d/supervisord.conf"]
