#!/bin/bash

# Passer en root
if [ "$EUID" -ne 0 ]; then
  echo "Veuillez exécuter ce script en tant que root."
  exit 1
fi

# Mettre à jour le système
apt update && apt full-upgrade -y

# Installer les paquets nécessaires
apt install git build-essential tcl pipx -y

# Cloner le dépôt ail-framework
git clone https://github.com/ail-project/ail-framework.git
cd ail-framework

# Installer les dépendances
./installing_deps.sh
echo "Installation de AIL terminée"

# Vérifier si le répertoire AILENV est présent et activer l'environnement virtuel
if [ -d "./AILENV/bin" ]; then
  echo "Installation vérifiée et réussie"
else
  echo "Le répertoire AILENV n'a pas été trouvé. Veuillez vérifier l'installation."
  exit 1
fi

# Naviguer dans le répertoire bin et lancer AIL
cd ~/ail-framework/bin && ./LAUNCH.sh -l
sleep 120
./LAUNCH.sh -k

# Assurer que le chemin de pipx est configuré correctement
pipx ensurepath

# Redémarrer le système
reboot
