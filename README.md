# Servidor Web com Vagrant + Nginx + deploy automático

Projeto de infraestrutura que cria uma máquina virtual Ubuntu com **Nginx** usando **Vagrant** e **VirtualBox**, e atualiza o site dentro dela automaticamente a cada `push` na branch `main` com **GitHub Actions**.

## O que o projeto demonstra

- Infraestrutura como código com `Vagrantfile` e script de provisionamento (`provision/provision.sh`)
- Configuração de servidor Nginx servindo conteúdo estático
- Pipeline de deploy contínuo com GitHub Actions e *runner* self-hosted

## Tecnologias

Vagrant · VirtualBox · Ubuntu 22.04 (`ubuntu/jammy64`) · Nginx · GitHub Actions · Bash

## Como funciona

1. O `Vagrantfile` cria a VM (1 GB de RAM, 2 CPUs), redireciona a porta 80 da VM para a 8080 do host e define o IP privado `192.168.56.10`.
2. O `provision/provision.sh` instala Nginx e Git e configura o site para ser servido a partir de `/vagrant/site`.
3. O workflow `.github/workflows/deploy.yml` roda em um *runner* self-hosted a cada push na `main`: copia o conteúdo de `site/` para `/vagrant/site/` e recarrega o Nginx.

## Como executar

Pré-requisitos: [Vagrant](https://www.vagrantup.com/) e [VirtualBox](https://www.virtualbox.org/).

```bash
git clone https://github.com/CAITANO19/RepoREP.git
cd RepoREP
vagrant up
```

O site fica disponível em `http://localhost:8080`.

Para o deploy automático funcionar, é necessário registrar um *runner* self-hosted do GitHub Actions na máquina onde a VM está rodando.

## Estrutura

```
Vagrantfile              definição da VM
provision/provision.sh   instalação e configuração do Nginx
site/index.html          conteúdo servido
.github/workflows/       deploy automático (deploy.yml)
```

## Autor

Victor Caitano — [@CAITANO19](https://github.com/CAITANO19)
