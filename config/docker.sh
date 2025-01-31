#!/bin/bash

set -e

# Add docker.service in system
sudo cp ~/.nix-profile/etc/systemd/system/docker.service /etc/systemd/system/

# Enable docker in auto init
sudo systemctl enable docker
