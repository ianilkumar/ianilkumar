#
# Cookbook Name:: myoracle
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
#Chef::Log.info(node['myoracle']['var1'])

group node['cgbu_brmc_test']['test_user_group'] do
  :create
end

user node['cgbu_brmc_test']['test_user'] do
  comment 'cgbu_test user'
  home ['cgbu_brmc_test']['test_user_home']
  shell '/bin/bash'
  gid node['cgbu_brmc_test']['test_user_group']
end

directory "#{node['cgbu_brmc_test']['test_user_home']/cuke4brm}" do
  owner node['cgbu_brmc_test']['test_user']
  group node['cgbu_brmc_test']['test_user_group']
  mode '0755'
  action :create
end

remote_file "#{node['cgbu_brmc_test']['test_user_home']}/#{node['cgbu_brmc_test']['local_apache_tomcat_package']}" do
  source "#{node['cgbu_brmc_test']['remote_url']}/#{node['cgbu_brmc_test']['local_apache_tomcat_package']}"
  group node['cgbu_brmc_test']['test_user_group']
  mode '0755'
  action :create
end

execute 'untar the apache package' do
  command 'tar -xvfz node['cgbu_brmc_test']['local_apache_tomcat_package']'
  not_if {File.exists?("#{node['cgbu_brmc_test']['test_user_home']}/apache-tomcat-7.0.50")}
  owner node['cgbu_brmc_test']['test_user']
  group node['cgbu_brmc_test']['test_user_group']
  mode '0755'
end

remote_file "#{node['cgbu_brmc_test']['test_user_home']}/#{node['cgbu_brmc_test']['cuke4brm_test_framework_package']}" do
  source "#{node['cgbu_brmc_test']['remote_url']}/#{node['cgbu_brmc_test']['cuke4brm_test_framework_package']}"
  group node['cgbu_brmc_test']['test_user_group']
  mode '0755'
  action :create
end

execute 'untar the cuke4brm_test_framework_package' do
  command 'tar -xvzf "#{node['cgbu_brmc_test']['test_user_home']}/#{node['cgbu_brmc_test']['cuke4brm_test_framework_package']}"'
  not_if {File.exists?("#{node['cgbu_brmc_test']['test_user_home']}/cuke4brm_test_framework ")}
  owner node['cgbu_brmc_test']['test_user']
  group node['cgbu_brmc_test']['test_user_group']
  mode '0755'
end

