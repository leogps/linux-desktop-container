FROM debian:trixie

# Update package list and install MATE desktop environment
RUN apt-get update && \
    apt-get install -y \
    xorg \
    dbus \
    mate-desktop-environment \
    tigervnc-standalone-server xrdp \
    sudo \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/.X11-unix && \
    sudo chmod 1777 /tmp/.X11-unix

# Set environment variables for X11 forwarding
ENV DISPLAY=:0
ENV XAUTHORITY=/tmp/.X11-unix
ENV VNC="true"
ENV RDP="true"
ENV USER="mate"
ENV USER_IS_SUDO="false"

COPY vnc-exec.sh /usr/local/bin/vnc-exec.sh

COPY ./xrdp.ini /etc/xrdp/xrdp.ini
COPY xrdp-exec.sh /usr/local/bin/xrdp-exec.sh

COPY ./user_management.sh /usr/local/bin/user_management.sh
COPY remote.sh /usr/local/bin/remote.sh

EXPOSE 5901
EXPOSE 3389

# Default command to start the MATE session
CMD ["/usr/local/bin/remote.sh"]
