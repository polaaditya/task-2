#
# Cookbook:: task
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

#installing Internet Information Services
include_recipe 'iis::default' if node['task']['install-iis']

#installing Windows Updates
include_recipe 'wsus-client::update'

#Creating the Icons Directory
directory "#{node['iis']['docroot']}/icons" do
  action :create
end

# now create and start the site (note this will use the default application pool which must exist)
iis_site 'Icon Site' do
  protocol :http
  port 80
  path "#{node['iis']['docroot']}/icons"
  action [:add,:start]
end
