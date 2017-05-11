#
# Cookbook Name:: four_cb
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
=begin
cookbook_file '/root/config.txt' do
  source 'config.txt'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
=end

Chef::Log.info("#{node['platform']}")

if node['platform'] == 'oracle'
	Chef::Log.info(" Iam in oracle machine")
elsif node['platform'] == 'ubuntu'
	Chef::Log.info(" Iam in ubuntu machine")
end
	