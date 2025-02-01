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

# Pergunta ao usuário se deseja continuar
read -p "Do you want to continue? (y/n) " answer

if [[ ! "$answer" =~ ^[Yy]$ ]]; then
  echo "Operation canceled"
  exit 0
fi

set -e

# Instalando yay se não estiver instalado
if ! command -v yay &>/dev/null; then
  echo "Yay is not installed, installing yay..."
  sudo pacman -S --needed --noconfirm git base-devel && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
  # Remover o diretório yay após a instalação
  rm -rf "$PWD/yay"
else
  echo "Yay is already installed."
fi

# Iniciando instalação dos aplicativos
for app in apps/*.sh; do
  # Verifica se o arquivo existe antes de tentar executá-lo
  if [[ -f "$app" ]]; then
    echo "Installing $app"
    bash "$app"
  else
    echo "No scripts found in apps/"
  fi
done
