#!/bin/bash

ascii_art='
          _____                    _____                _____                    _____                    _____          
         /\    \                  /\    \              /\    \                  /\    \                  /\    \         
        /::\    \                /::\    \            /::\    \                /::\____\                /::\    \        
       /::::\    \              /::::\    \           \:::\    \              /:::/    /               /::::\    \       
      /::::::\    \            /::::::\    \           \:::\    \            /:::/    /               /::::::\    \      
     /:::/\:::\    \          /:::/\:::\    \           \:::\    \          /:::/    /               /:::/\:::\    \     
    /:::/__\:::\    \        /:::/__\:::\    \           \:::\    \        /:::/    /               /:::/__\:::\    \    
    \:::\   \:::\    \      /::::\   \:::\    \          /::::\    \      /:::/    /               /::::\   \:::\    \   
  ___\:::\   \:::\    \    /::::::\   \:::\    \        /::::::\    \    /:::/    /      _____    /::::::\   \:::\    \  
 /\   \:::\   \:::\    \  /:::/\:::\   \:::\    \      /:::/\:::\    \  /:::/____/      /\    \  /:::/\:::\   \:::\____\ 
/::\   \:::\   \:::\____\/:::/__\:::\   \:::\____\    /:::/  \:::\____\|:::|    /      /::\____\/:::/  \:::\   \:::|    |
\:::\   \:::\   \::/    /\:::\   \:::\   \::/    /   /:::/    \::/    /|:::|____\     /:::/    /\::/    \:::\  /:::|____|
 \:::\   \:::\   \/____/  \:::\   \:::\   \/____/   /:::/    / \/____/  \:::\    \   /:::/    /  \/_____/\:::\/:::/    / 
  \:::\   \:::\    \       \:::\   \:::\    \      /:::/    /            \:::\    \ /:::/    /            \::::::/    /  
   \:::\   \:::\____\       \:::\   \:::\____\    /:::/    /              \:::\    /:::/    /              \::::/    /   
    \:::\  /:::/    /        \:::\   \::/    /    \::/    /                \:::\__/:::/    /                \::/____/    
     \:::\/:::/    /          \:::\   \/____/      \/____/                  \::::::::/    /                  ~~          
      \::::::/    /            \:::\    \                                    \::::::/    /                               
       \::::/    /              \:::\____\                                    \::::/    /                                
        \::/    /                \::/    /                                     \::/____/                                 
         \/____/                  \/____/                                       ~~                                       
'

echo -e "$ascii_art"

read -p "Do you want continue? (y/n): " answer
if [[ ! "$answer" =~ ^[Yy]$ ]]; then
  echo "Operação cancelada."
  exit 0
fi

set -e

# Installing Nix
if ! command -v nix &>/dev/null; then
  echo "Installing Nix..."
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
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

echo "Restart the system for the changes to take effect"