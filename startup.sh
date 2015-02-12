#!/bin/bash
echo '**Installing dependencies**'

echo '**Updating Packages**'

apt-get update

echo '**Installing Ruby'
apt-get install ruby gem rubygems build-essential ruby-dev
gem update


echo '**Installing Vagrant'

if [ ! -d /src ]; then
    mkdir /src
fi

cd /src
wget -q https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
dpkg -i vagrant_1.7.2_x86_64.deb


echo '**Creating directories**'

mkdir /vagrant
cd /vagrant
vagrant init

echo '**Installing Chef**'

gem install knife-solo
gem install librarian-chef

echo '**Getting Cookbooks**'

librarian-chef install





