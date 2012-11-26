#
# Cookbook Name:: subsonic
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

package 'openjdk-6-jre'

template '/etc/default/subsonic' do
  source 'subsonic'
end

execute 'download' do
  command 'wget http://prdownloads.sourceforge.net/subsonic/subsonic-4.7.deb -O /tmp/subsonic.deb'
  notifies :run, resources(execute: :install)
end

execute 'install' do
  command 'dpkg -i /tmp/subsonic.deb'
end

service 'subsonic' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
