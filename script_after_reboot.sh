#!/bin/bash

# Trouver le nom de l'utilisateur non-root
username=$(logname)

# Assurer que le chemin de pipx est configuré correctement
pipx ensurepath

# Installer Poetry
pipx install poetry
pipx ensurepath

# Cloner et préparer valkey
git clone https://github.com/valkey-io/valkey.git /home/$username/ail-framework/bin/crawlers/valkey
cd /home/$username/ail-framework/bin/crawlers/valkey
git checkout 7.2
make
cd ..

# Cloner et installer lacus
git clone https://github.com/ail-project/lacus.git /home/$username/ail-framework/bin/crawlers/lacus
cd /home/$username/ail-framework/bin/crawlers/lacus
poetry install 
poetry run playwright install-deps
apt install ffmpeg libavcodec-extra
# Configurer LACUS_HOME
echo LACUS_HOME="`pwd`" >> .env

# Copier le fichier de configuration de logging
cd /home/$username/ail-framework/bin/crawlers/lacus/config
cp logging.json.sample logging.json

# Mettre à jour les dépendances avec Poetry
poetry run update --init

# Installer Tor
sudo apt install tor -y

# Cloner et configurer pystemon
cd /home/$username/ail-framework/
git clone https://github.com/Elie00000/pystemon.git /home/$username/ail-framework/pystemon
cd /home/$username/ail-framework/pystemon
pip3 install -r requirements.txt
sed -i "s|dir = /home/pystemon/pystemon|dir = /home/$username/ail-framework/pystemon|" /home/$username/ail-framework/configs/core.cfg
