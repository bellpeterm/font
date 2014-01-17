#
# Cookbook Name:: font
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

chef_gem "zip"

remote_file "#{ENV['windir']}\\system32\\FontReg.exe" do
  source node['font']['font_reg_source']
  only_if { node['platform'] == "windows" }
end
