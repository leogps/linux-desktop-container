#!/usr/bin/env bash

set -e

create_user() {
    echo "Creating user $USER"
    useradd -m -s /bin/bash "$USER" && \
        echo "User created. Choose a password for the user." && \
        passwd "$USER"

    echo "USER_IS_SUDO: $USER_IS_SUDO"
    if [ "$USER_IS_SUDO" = "true" ]; then
        echo "Adding $USER to sudo group"
        usermod -aG sudo $USER
        groups $USER
    fi
}
