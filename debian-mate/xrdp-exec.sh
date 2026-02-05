#!/usr/bin/env bash

set -e

start_rdp() {
    echo "Starting RDP..."
    echo mate-session > /home/$USER/.xsession
    /usr/sbin/xrdp-sesman
    /usr/sbin/xrdp
    echo -e "*****************---------*****************"
    echo "RDP server processing complete."
    echo -e "*****************---------*****************\n"
}

stop_rdp() {
    echo "Stopping RDP..."
    pkill -f xrdp-sesman || true
    pkill -f xrdp || true
    cleanup_rdp
    echo "RDP server stopped."
}

restart_rdp() {
    stop_rdp
    sleep 1
    start_rdp
}

cleanup_rdp() {
    echo "Cleaning up xrdp..."
    rm -rf /var/run/xrdp* || true
}

status_rdp() {
    if pgrep -f xrdp > /dev/null; then
        echo "RDP server is running."
    else
        echo "RDP server is not running."
    fi
}
