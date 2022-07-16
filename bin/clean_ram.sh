#!/bin/bash -e

sudo apt-get -y autoremove
sudo apt-get -y clean
sudo apt-get -y autoclean
sudo apt-get -y update
sudo apt-get -y upgrade
# Clean tmp
sudo rm -rf /tmp/*
# Clean logs
sudo rm -rf /var/log/*
# Clean cache
sudo rm -rf /var/cache/*
# Clean bash history
sudo rm -rf /root/.bash_history
# Clean ram
free -m
sudo sync
sudo sysctl -w vm.drop_caches=3
sudo sync
free -m
