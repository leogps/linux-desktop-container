#!/usr/bin/env bash

set -e

hang_on() {
    while true; do
      sleep 1
    done
}

process_vnc() {
    if [ "$VNC" = "true" ]; then
        echo "vnc enabled"
        source /usr/local/bin/vnc-exec.sh
        start_vnc
    fi
}

process_rdp() {
    if [ "$RDP" = "true" ]; then
        echo "rdp enabled"
        source /usr/local/bin/xrdp-exec.sh
        start_rdp
    fi
}

if [[ "$VNC" != "true" && "$RDP" != "true" ]]; then
    echo -e "\nPlease enable one of VNC or RDP\n"
    exit 1
fi

source /usr/local/bin/user_management.sh
create_user
process_vnc
process_rdp

hang_on
