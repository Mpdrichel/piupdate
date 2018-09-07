#!/bin/bash

read -p "Geef de naam van het systeem op (Enkel de 4 cijfers): " SYSNR
echo ""

if test "$SYSNR" = ""; then
        echo "$0: De invoer mag niet leeg zijn" >&2
        exit 1;

fi

sudo tee /home/pi/identifier.json << EOF
{
        "id": "illi-mis-$SYSNR",
        "number": "1$SYSNR"
}
EOF

cat /home/pi/identifier.json

sudo sed -i s/0100/"$SYSNR"/g /etc/hostname

cat /etc/hostname

sudo sed -i s/0100/"$SYSNR"/g /etc/hostapd/hostapd.conf

cat /etc/hostapd/hostapd.conf

sudo sed -i s/0100/"$SYSNR"/g /etc/hosts

cat /etc/hosts

sudo sed -i s/0100/"$SYSNR"/g /etc/iptables/rules.v4

cat /etc/iptables/rules.v4

sudo sed -i s/0100/"$SYSNR"/g /etc/systemd/system/autossh.service

cat /etc/systemd/system/autossh.service

echo ""
echo "Klaar met het aanpassen van het systeemnummer."
echo ""
echo "Wil je ook een locatie toevoegen? (j/n) "
read answer

while [[ x$answer != xj && x$answer != xn ]]
do
        echo "Geef j of n op!: "
        read answer
done

if [ "$answer" = "j" ]; then

        cd /home/pi/pi-sync && git reset --hard
        cd /home/pi/pi-sync/src && chmod +x zorglocatie.sh &&./zorglocatie.sh

echo "Klaar met toevoegen."
echo "Draai dit script opnieuw als je het zorghuis wilt wijzigen."

elif [ "$answer" = "n" ]; then

echo "Klaar met aanpassen."
echo "Draai dit script opnieuw als je het zorghuis wilt toevoegen."

fi

exit 0
