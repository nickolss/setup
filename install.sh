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

#!/bin/bash

# Perguntar se o usuário quer continuar
read -p "Do you want continue? (y/n): " answer
if [[ ! "$answer" =~ ^[Yy]$ ]]; then
  echo "Operação cancelada."
  exit 0
fi

set -e

# Instalando Nix, caso não esteja instalado
if ! command -v nix &>/dev/null; then
  echo "Installing Nix..."
  sh <(curl -L https://nixos.org/nix/install) --no-daemon
else
  echo "Nix is already installed."
fi

# Instalando pacotes do arquivo packages.nix
if [[ -f nix/packages.nix ]]; then
  echo "Installing packages from nix/packages.nix..."

  # Faz um regex para pegar apenas o nome dos arquvos dentro de []
  packages=($(cat nix/packages.nix | sed -n '/\[/,/\]/p' | grep -oP '\s*\K\w+'))

  # Instalar pacotes
  for package in "${packages[@]}"; do
    nix-env -iA nixpkgs.$package
  done
fi

# Configurando programas
echo "Configuring programs..."
for script in config/*.sh; do
  if [[ -f "$script" ]]; then
    echo "Configuring $script"
    bash "$script"
  fi
done

echo "Restart the system for the changes to take effect"