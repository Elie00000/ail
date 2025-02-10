#!/bin/bash

apt update && apt full-upgrade -y
apt install git build-essential tcl pipx -y

git clone https://github.com/ail-project/ail-framework.git
cd ail-framework

./installing_deps.sh
echo "Installation de AIL terminée"

if [ -d "./AILENV/bin" ]; then
  echo "Installation vérifiée et réussie"
else
  echo "Le répertoire AILENV n'a pas été trouvé. Veuillez vérifier l'installation."
  exit 1
fi

cd ~/ail-framework/bin && ./LAUNCH.sh -l
sleep 120
./LAUNCH.sh -k

pipx ensurepath

reboot
