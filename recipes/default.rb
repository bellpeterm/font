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
  source "http://util1.util.sea.corp.w3data.com/FontReg.exe"
  only_if { node['platform'] == "windows" }
end