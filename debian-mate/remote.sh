#!/usr/bin/env bash

set -e

source /usr/local/bin/vnc-exec.sh
source /usr/local/bin/xrdp-exec.sh
source /usr/local/bin/user_management.sh

hang_on() {
    while true; do
      sleep 1
    done
}

process_vnc() {
    if [ "$VNC" = "true" ]; then
        echo "vnc enabled"
        start_vnc $USER
    fi
}

process_rdp() {
    if [ "$RDP" = "true" ]; then
        echo "rdp enabled"
        start_rdp
    fi
}

cleanup() {
    echo "cleaning up..."
    cleanup_vnc
    cleanup_rdp
}

start() {
    if [[ "$VNC" != "true" && "$RDP" != "true" ]]; then
        echo -e "\nPlease enable one of VNC or RDP using environment variables, e.g. VNC='true' or RDP='true' \n"
        exit 1
    fi

    cleanup

    create_user
    process_vnc
    process_rdp

    hang_on
}

case "${1:-}" in
    start)
        start
        ;;
    start-vnc)
        start_vnc
        ;;
    stop-vnc)
        stop_vnc
        cleanup_vnc
        ;;
    restart-vnc)
        restart_vnc
        ;;
    cleanup-vnc)
        cleanup_vnc
        ;;
    status-vnc)
        status_vnc
        ;;
    start-rdp)
        start_rdp
        ;;
    stop-rdp)
        stop_rdp
        ;;
    restart-rdp)
        restart_rdp
        ;;
    cleanup-rdp)
        cleanup_rdp
        ;;
    status-rdp)
        status_rdp
        ;;
    *)
        echo "Usage: $0 {start|start-vnc|stop-vnc|restart-vnc|cleanup-vnc|status-vnc|start-rdp|stop-rdp|restart-rdp|cleanup-rdp|status-rdp"
        exit 1
        ;;
esac
