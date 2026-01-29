# linux-desktop-container
Container(s) with (minimal) Desktop Environments

## Debian Mate VNC
    docker run -it --rm \
      -p 5901:5901 \
      leogps/debian-mate-vnc:1.0.0

- Use vnc-viewer application to connect to localhost:5901.
  - On MacOs, Open Finder > CMD+K > vnc://localhost:5901
- Enter the password chosen during docker run above.