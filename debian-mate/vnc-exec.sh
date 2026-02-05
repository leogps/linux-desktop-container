#!/usr/bin/env bash

set -e

DISPLAY_NUM=1

start_vnc() {
    local user="$1"
    echo "Requested vnc for $user"
    ran_as=$(whoami)
    if [[ -n "$user" && "$user" != "$ran_as" ]]; then
        sudo -u "$user" tigervncserver -localhost no :"$DISPLAY_NUM"
    else
        eval $(dbus-launch --sh-syntax --exit-with-session)
        tigervncserver -localhost no :"$DISPLAY_NUM"
    fi

    echo "VNC server is running on port: $((5900 + DISPLAY_NUM))"
    echo "*****************---------*****************"
    echo "VNC server processing complete."
    echo "*****************---------*****************"
}

stop_vnc() {
    echo "Stopping VNC..."
    tigervncserver -kill :$DISPLAY_NUM || true
    echo "VNC server stopped."
}

restart_vnc() {
    stop_vnc
    sleep 1
    start_vnc
}

cleanup_vnc() {
    stop_vnc || true
    rm -rf /tmp/.X1-lock || true
    rm -rf /tmp/.X11-unix/* | true
}

status_vnc() {
    if pgrep -f "Xtigervnc :$DISPLAY_NUM" > /dev/null; then
        echo "VNC server is running on :$DISPLAY_NUM"
    else
        echo "VNC server is not running."
    fi
}
