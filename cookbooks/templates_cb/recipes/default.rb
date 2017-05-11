#
# Cookbook Name:: templates_cb
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
=begin
template '/root/sudors' do
  source 'sudors.erb'
  mode '0440'
  owner 'root'
  group 'root'
  variables({
    sudoers_groups: node['authorization']['sudo']['groups'],
    sudoers_users: node['authorization']['sudo']['users'],
    #passwordless: true
  })
end
=end
service "sshd" do 
  action :nothing
end

template '/root/server.xml' do
  source 'server.xml.erb'
  mode '0440'
  owner 'root'
  group 'root'
 notifies :start, 'service[sshd]', :immediate 
end
