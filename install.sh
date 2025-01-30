#!/bin/bash

set -e

# Installing Nix
if ! command -v nix &>/dev/null; then
  echo "Installing Nix..."
  sh <(curl -L https://nixos.org/nix/install) --daemon
else
  echo "Nix is already installed."
fi

# Installing programs from Nix
echo "Starting development setup..."
sudo nixos-rebuild switch -I nixos-config=nix/configuration.nix

# Configuring programs
for script in config/*.sh; do
  if [[ -f "$script" ]]; then
    echo "Configuring $script"
    bash "$script"
  fi
done

echo "Finish him"
