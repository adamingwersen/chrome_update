#!/usr/bin/env bash

# Version
CHROME_DRIVER_VERSION=`curl -sS chromedriver.storage.googleapis.com/LATEST_RELEASE`

# Remove existing downloads
rm ~/Downloads/google-chrome-stable_current_amd64.deb
rm ~/Downloads/chromedriver_linux64.zip
sudo rm /usr/local/bin/chromedriver

# Install Chrome
wget -N https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -P ~/Downloads/
sudo dpkg -i --force-depends ~/Downloads/google-chrome-stable_current_amd64.deb
sudo apt-get -f install -y
sudo dpkg -i --force-depends ~/Downloads/google-chrome-stable_current_amd64.deb

# Instal ChromeDriver
wget -N http://chromedriver.storage.googleapis.com/$CHROME_DRIVER_VERSION/chromedriver_linux64.zip -P ~/Downloads/
unzip ~/Downloads/chromedriver_linux64.zip -d ~/Downloads/
rm ~/Downloads/chromedriver_linux64.zip
sudo mv -f ~/Downloads/chromedriver /usr/local/bin/chromedriver
sudo chown root:root /usr/local/bin/chromedriver
sudo chmod 0755 /usr/local/bin/chromedriver
