#!/bin/bash

echo -------------- Import the public key for APT ---------------
sudo wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

echo ---------------- Create list file for MongoDV --------------
sudo echo "deb [ arch=amd64,arm64 ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/4.4 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

echo ------------------------ Update packages -------------------
sudo apt-get update

echo ------------------------ Install Mongo ---------------------
sudo apt-get install -y mongodb-org

echo --------------- Remove Exsiting Conf File ------------------
sudo rm /etc/mongod.conf

echo ---------------------- Copy New Conf File ------------------
sudo ln -s /home/vagrant/env/mongodb/mongod.conf /etc/mongod.conf

echo ------------------------- Start Mongo ----------------------
sudo systemctl start mongod

echo ------------------------- Get Mongo Status -----------------
sudo systemctl status mongod
