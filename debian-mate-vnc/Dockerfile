FROM debian:trixie

# Update package list and install MATE desktop environment
RUN apt-get update && \
    apt-get install -y \
    xorg \
    dbus \
    mate-desktop-environment tigervnc-standalone-server \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN mkdir -p /tmp/.X11-unix

# Set environment variables for X11 forwarding
ENV DISPLAY=:0
ENV XAUTHORITY=/tmp/.X11-unix

COPY ./vnc-exec.sh /usr/local/bin/vnc-exec.sh

EXPOSE 5901

# Default command to start the MATE session
CMD ["/usr/local/bin/vnc-exec.sh"]
