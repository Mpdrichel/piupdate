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

echo "fixing namesetup"

rm /home/pi/namesetup.sh
cp /home/pi/piupdate/namesetup.sh /home/pi
chmod +x /home/pi/namesetup.sh

echo "klaar voor nu, changegeneral is nog verouderd"
