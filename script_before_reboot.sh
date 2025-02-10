#!/bin/bash

# Trouver le nom de l'utilisateur non-root
username=$(logname)

# Passer en root
sudo su

# Mettre à jour le système
apt update && apt full-upgrade -y

# Installer les paquets nécessaires
apt install git build-essential tcl pipx -y

# Cloner le dépôt ail-framework
git clone https://github.com/ail-project/ail-framework.git /home/$username/ail-framework
cd /home/$username/ail-framework

# Installer les dépendances
./installing_deps.sh

# Vérifier si le répertoire AILENV est présent et activer l'environnement virtuel
if [ -d "/home/$username/ail-framework/AILENV/bin" ]; then
  . /home/$username/ail-framework/AILENV/bin/activate
else
  echo "Le répertoire AILENV n'a pas été trouvé. Veuillez vérifier l'installation."
  exit 1
fi
. ./home/$username/ail-framework/AILENV/bin/activate
# Naviguer dans le répertoire bin et lancer AIL
cd /home/$username/ail-framework/bin
./LAUNCH.sh -l
sleep 180
./LAUNCH.sh -k

# Assurer que le chemin de pipx est configuré correctement
pipx ensurepath

# Redémarrer le système
reboot
