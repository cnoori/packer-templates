#!/bin/bash

echo "updating the machine"
rm -fR /var/lib/apt/lists/*
apt-get update
apt-get -y upgrade

echo "installing cloud-set-guest-password"
chmod +x /etc/init.d/cloud-set-guest-password
update-rc.d cloud-set-guest-password defaults

echo "installing cloud-set-guest-sshkey"
chmod +x /etc/init.d/cloud-set-guest-sshkey
update-rc.d cloud-set-guest-sshkey defaults

echo "setting noatime option"
sed -i 's|errors=remount-ro|errors=remount-ro,noatime|g' /etc/fstab
