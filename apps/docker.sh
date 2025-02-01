# Instala docker e docker-compose
yay -S --needed docker docker-compose --noconfirm

# Adiciona o usuário ao grupo do docker
sudo usermod -aG docker ${USER}

# Reinicia o servico do docker
sudo systemctl restart docker.service

# Adiciona o docker em inicialização automática
sudo systemctl enable docker.service
