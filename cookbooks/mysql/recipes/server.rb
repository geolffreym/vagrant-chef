#
# Cookbook Name:: mysql
# Recipe:: default
#
# Copyright 2014, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

@version = '5.5'

execute "apt-get update" do
  command "apt-get update"
end

package 'mysql-server' do
  action :install
  version "5.5*"
end

service 'mysql' do
  action [ :enable, :start ]
end
