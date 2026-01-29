#!/usr/bin/env bash

set -e

DISPLAY_NUM=1

#trap "kill $VNC_PID; rm -f /tmp/.X11-unix/X$DISPLAY_NUM" EXIT
#trap "rm -f /tmp/.X11-unix/X$DISPLAY_NUM" EXIT

tigervncserver -localhost no :$DISPLAY_NUM

echo "vnc-server is running on port: $((5900 + DISPLAY_NUM))"

while true; do
  sleep 1
done
