#!/bin/bash 
#installer routine for NFC Reader system on RPI

if ! [ $(id -u) = 0 ]; then
   echo "This script needs to be executed by a super user please reffer to the manual"
   exit 1
fi

echo "Current date : $(date) @ $(hostname)"
echo "Copying NFC service to systemd"
cp nfc.service /lib/systemd/system/


echo "Asigning permissions to files"
chmod 644 /lib/systemd/system/nfc.service
chmod +x /home/pi/NFC-reader/nfc.py

echo "registering NFC Reader service to Reader"
systemctl daemon-reload
systemctl enable nfc.service
systemctl start nfc.service

sleep 5

echo "getng status from service"
systemctl status nfc.service