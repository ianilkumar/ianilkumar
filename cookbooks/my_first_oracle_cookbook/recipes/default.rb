#
# Cookbook Name:: my_first_oracle_cookbook
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
Chef::Log.info("Hello My First Cookbook")

directory '/root/apache2/Test1/Test2/Test3' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
  recursive true
end
