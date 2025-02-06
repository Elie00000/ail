#!/bin/bash

# Ouvrir le premier terminal et exécuter les commandes
gnome-terminal -- bash -c "
cd ~/ail-framework/;
. ./AILENV/bin/activate;
cd bin;
./LAUNCH.sh -l;
./LAUNCH.sh -f;
cd  ~/ail-framework/bin/crawlers/lacus;
poetry run start;
cd ~/ail-framework/pystemon/;
./pystemon.py;
bash" &

# Ouvrir le deuxième terminal et exécuter les commandes
gnome-terminal -- bash -c "
sleep 60
cd ~/ail-framework/;
. ./AILENV/bin/activate;
cd bin/importer;
./PystemonImporter.py;
bash"

