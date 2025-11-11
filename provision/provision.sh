#!/usr/bin/env bash
set -euo pipefail

echo "[Provision] Atualizando sistema e instalando Nginx + Git..."
sudo apt-get update -y
sudo apt-get install -y nginx git

echo "[Provision] Configurando Nginx..."
sudo rm -rf /etc/nginx/sites-enabled/default

sudo bash -c "cat > /etc/nginx/sites-available/meusite" <<'EOF'
server {
    listen 80;
    root /vagrant/site;
    index index.html;
    server_name _;
}
EOF

sudo ln -sf /etc/nginx/sites-available/meusite /etc/nginx/sites-enabled/meusite
sudo systemctl restart nginx
sudo systemctl enable nginx
echo "[Provision] Pronto! Acesse http://localhost:8080"
