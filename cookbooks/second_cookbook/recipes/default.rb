#
# Cookbook Name:: second_cookbook
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

remote_file "#{node['second_cookbook']['local_download_dir']}/#{node['second_cookbook']['installer_name']}" do
  source "#{node['second_cookbook']['remote_url']}"
  action :create
  not_if {File.exists?("#{node['second_cookbook']['local_download_dir']}/#{node['second_cookbook']['installer_name']}")}
end



execute 'install_git' do
	command "#{node['second_cookbook']['local_download_dir']}/#{node['second_cookbook']['installer_name']} /SILENT"
	#not_if {File.exists?('C:/chef/Git-2.12.2.2-64-bit.exe')}
end


Chef::Log.info("#{node['second_cookbook']['testvalue']}")
