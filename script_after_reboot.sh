#!/bin/bash

cd ~/ail-framework/crawler

# Assurer que le chemin de pipx est configuré correctement
pipx ensurepath

# Installer Poetry
pipx install poetry
pipx ensurepath

# Cloner et préparer valkey
git clone https://github.com/valkey-io/valkey.git
cd valkey
git checkout 7.2
make
cd ..

# Cloner et installer lacus
git clone https://github.com/ail-project/lacus.git
cd lacus
poetry install
poetry shell
poetry run playwright install-deps

# Configurer LACUS_HOME
echo LACUS_HOME="`pwd`" >> .env

# Copier le fichier de configuration de logging
cd lacus/config
cp logging.json.sample logging.json

# Mettre à jour les dépendances avec Poetry
poetry run update --init

# Installer Tor
sudo apt install tor dbus-x11 -y

# Cloner et configurer pystemon
cd ~/ail-framework/
git clone https://github.com/Elie00000/pystemon.git
cd ./configs/


