#!/usr/bin/env bash

set -e

DISPLAY_NUM=1

start_vnc() {
    echo "Starting vnc..."
    sudo -u $USER tigervncserver -localhost no :$DISPLAY_NUM
    echo "vnc-server is running on port: $((5900 + DISPLAY_NUM))"
    echo -e "*****************---------*****************"
    echo "VNC server processing complete."
    echo -e "*****************---------*****************\n"
}
