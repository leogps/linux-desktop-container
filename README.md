# linux-desktop-container
Container(s) with (minimal) Desktop Environments

## Debian Mate VNC
    docker run -it --rm \
      -e DISPLAY=$DISPLAY \
      -p 5901:5901 \
      debian-mate-vnc

- Use vnc-viewer application to connect to localhost:5901.
  - On MacOs, Open Finder > CMD+K > vnc://localhost:5901
- Enter the password chosen during docker run above.