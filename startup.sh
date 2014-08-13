#!/bin/bash
echo '**Installing dependencies**'

echo '**Updating Packages**'

apt-get update

echo 'Installing Ruby'
apt-get install ruby gem rubygems build-essential ruby-dev
gem update


echo '**Installing Vagrant'

mkdir /src
cd /src
wget -q https://dl.bintray.com/mitchellh/vagrant/vagrant_1.6.3_x86_64.deb
dpkg -i vagrant_1.6.3_x86_64.deb


echo '**Creating directories**'

mkdir /vagrant
cd /vagrant
vagrant init

echo '**Installing Chef**'

gem install knife-solo
gem install librarian-chef





