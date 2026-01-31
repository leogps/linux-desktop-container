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
