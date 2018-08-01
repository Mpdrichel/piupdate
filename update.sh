#!/bin/bash

#!/bin/bash
cd /home/pi/pi-bus-server

git reset --hard && git pull && npm i && npm run build

cd /home/pi/pi-controller

git reset --hard && git pull && npm i && npm run build

cd /home/pi/pi-logger

git reset --hard && git pull && npm i && npm run build

cd /home/pi/pi-player

git reset --hard && git pull && npm i && npm run build

cd /home/pi/pi-program

git reset --hard && git pull && npm i && npm run build

cd /home/pi/pi-server

git reset --hard && git pull && npm i && npm run build

cd /home/pi/pi-sync

git reset --hard && git pull && npm i && npm run build

echo "klaar met updaten software"

echo "Systeem updaten"

sudo apt update
sudo apt upgrade -y

echo "logmap aanmaken"

mkdir /home/pi/logs

echo "klaar voor nu, namesetup en changegeneral zijn nog verouderd"
