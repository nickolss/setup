# Automação de Setup

Este repositório visa automatizar o setup de um ambiente de desenvolvimento utilizando **yay** e **Shell Script**. O script instala e configura ferramentas essenciais como **Neovim**, **htop**, **git**, entre outras.

## ⚠️ Compatibilidade

Este script é projetado **exclusivamente** para distribuições baseadas no **Arch Linux**. Se sua distribuição não for baseada no Arch, o script não funcionará.

## 📦 Ferramentas Instaladas

O script instala os seguintes pacotes via **[yay](https://github.com/Jguer/yay)**:

- **Neovim**: Editor de texto altamente configurável e extensível.
- **Fzf**: Ferramenta de fuzzy para encontrar arquivos no terminal.
- **htop**: Monitor de sistema interativo.
- **Git**: Sistema de controle de versão distribuído.
- **Mise**: Ferramenta para automatizar builds.
- **Docker**: Ferramenta de manipulação de containers.
- **Zoxide**: Uma alternativa ao cd que aprende os diretórios que você acessa com mais frequência e permite navegar rapidamente entre eles.

## 🚀 Como usar

### Requisitos

- Distribuição baseada no **Arch Linux**.

### Passos para Rodar o Script

1. **Clone o repositório**:

   ```bash
   git clone https://github.com/nickolss/setup.git
   cd setup
   ```

2. **Execute o script de instalação**:

   ```bash
   ./install.sh
   ```
