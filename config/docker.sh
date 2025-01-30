#!/bin/bash

# Adding your user in docker group
sudo usermod -aG docker $USER

# Auto initialization
sudo systemctl enable docker
