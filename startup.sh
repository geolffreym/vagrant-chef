#!/bin/bash
echo '**Installing dependencies**'

echo '**Updating Packages**'

apt-get update

echo '**Installing Ruby'
apt-get install ruby2.1 gem rubygems build-essential virtualbox ruby-dev libsqlite3-dev
which ruby2.1
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

gem install librarian-chef

echo '**Getting Cookbooks**'

librarian-chef install





