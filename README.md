# linux-desktop-container
Container(s) with (minimal) Desktop Environments

## Debain Mate
  On the Hub: [leogps/debian-mate:1.0.0](https://hub.docker.com/r/leogps/debian-mate)

    docker run -ti --rm \
    -p 5901:5901 \
    -p 3389:3389 \
    -e USER="mymate" \
    -e USER_IS_SUDO="true" \
    debian-mate

Availble Options Using Environment variables:
### Environment Variables

| Variable       | Description                                      | Default | Example |
|----------------|--------------------------------------------------|---------|---------|
| `VNC`          | Enable or disable the VNC server                 | `true`  | `false` |
| `RDP`          | Enable or disable the RDP server                 | `false` | `true`  |
| `USER`         | Username to create inside the container          | `mate`  | `john`  |
| `USER_IS_SUDO` | Grant sudo privileges to the created user        | `false` | `true`  |

### Ports
| Port   | Description |
|--------|-------------|
| `3389` | RDP Port    |
| `5901` | VNC Port    |

---

## Debian Mate VNC
  On the Hub: [leogps/debian-mate-vnc:1.0.0](https://hub.docker.com/r/leogps/debian-mate-vnc)

    docker run -it --rm \
      -p 5901:5901 \
      leogps/debian-mate-vnc:1.0.0

- Use vnc-viewer application to connect to localhost:5901.
  - On MacOs, Open Finder > CMD+K > vnc://localhost:5901
- Enter the password chosen during docker run above.
