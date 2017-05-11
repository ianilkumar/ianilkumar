#
# Cookbook Name:: environments_cb
# Recipe:: default
#
# Copyright 2017, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
node.default['environments_cb']['test_user_group'] = "modified_by_recipe"
Chef::Log.info(node['environments_cb']['test_user_group'])