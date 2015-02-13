#!/bin/bash
echo '**Installing dependencies**'

echo '**Updating Packages**'

apt-get update

echo '**Installing Ruby'
echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | tee /etc/apt/sources.list.d/opscode.list

apt-get install ruby2.1 gem rubygems build-essential chef chef-server virtualbox-4.2 ruby-dev libsqlite3-dev
which ruby2.1
gem update


echo '**Installing Vagrant'

if [ ! -d /src ]; then
    mkdir /src
fi

cd /src
wget -q https://dl.bintray.com/mitchellh/vagrant/vagrant_1.7.2_x86_64.deb
dpkg -i vagrant_1.7.2_x86_64.deb
vagrant plugin install vagrant-omnibus
vagrant plugin install vagrant-vbguest


echo '**Creating directories**'

mkdir /vagrant
cd /vagrant
vagrant init

echo '**Installing Chef**'

gem install knife-solo
gem install librarian-chef

echo '**Getting Cookbooks**'

librarian-chef install





