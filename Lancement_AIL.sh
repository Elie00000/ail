#!/bin/bash
username=$(logname)
# Ouvrir le premier terminal et exécuter les commandes
gnome-terminal -- bash -c "
cd /home/$username/ail-framework/;
cd /home/$username/ail-framework/bin;
./LAUNCH.sh -l;
./LAUNCH.sh -f;
cd  /home/$username/ail-framework/bin/crawlers/lacus;
poetry run start;
cd /home/$username/ail-framework/pystemon/;
./pystemon.py;
bash" &

# Ouvrir le deuxième terminal et exécuter les commandes
gnome-terminal -- bash -c "
sleep 60
cd /home/$username/ail-framework/;
cd /home/$username/ail-framework/bin/importer;
./PystemonImporter.py;
bash"

