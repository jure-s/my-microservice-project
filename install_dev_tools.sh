#!/bin/bash

set -e

echo "🔍 Перевірка та встановлення потрібних інструментів..."

# Docker
if ! command -v docker &> /dev/null; then
  echo "🛠 Встановлення Docker..."
  sudo apt update
  sudo apt install -y ca-certificates curl gnupg lsb-release
  sudo mkdir -p /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] \
    https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  sudo apt update
  sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
  echo "✅ Docker встановлено."
else
  echo "✅ Docker вже встановлено."
fi

# Docker Compose
if ! docker compose version &> /dev/null; then
  echo "🛠 Встановлення Docker Compose..."
  sudo curl -L "https://github.com/docker/compose/releases/download/v2.24.6/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
  sudo chmod +x /usr/local/bin/docker-compose
  echo "✅ Docker Compose встановлено."
else
  echo "✅ Docker Compose вже встановлено."
fi

# Python
if ! python3 --version | grep -q "3.9\|[4-9]"; then
  echo "🛠 Встановлення Python 3.9+..."
  sudo apt update
  sudo apt install -y python3 python3-pip
  echo "✅ Python встановлено."
else
  echo "✅ Python вже встановлено."
fi

# Django
if ! python3 -m django --version &> /dev/null; then
  echo "🛠 Встановлення Django..."
  pip3 install Django
  echo "✅ Django встановлено."
else
  echo "✅ Django вже встановлено."
fi

echo "🎉 Усі інструменти встановлено або вже присутні!"
