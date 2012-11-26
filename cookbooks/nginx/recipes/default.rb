#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2012, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

template '/etc/nginx/conf.d/subsonic.conf' do
  source 'subsonic.conf'
end

node['nginx']['install_pkgs'].each do |p|
  package p do
    action :install
  end
end

service 'nginx' do
  supports :status => true, :restart => true, :reload => true
  action [:enable, :start]
end
