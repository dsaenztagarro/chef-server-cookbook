#
# Cookbook Name:: chef-server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

package_url = node['chef-server']['url']
package_name = ::File.basename(package_url)
package_local_path = "#{Chef::Config[:file_cache_path]}/#{package_name}"

if File.exists?(package_local_path)
  log 'message' do
    message "File already exists: #{package_local_path}"
    level :info
  end
else
  # package is remote, let's download it
  remote_file package_local_path do
    source package_url
  end
end

package package_name do
  source package_local_path
  provider Chef::Provider::Package::Dpkg
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
  notifies :run, 'execute[user-create]', :immediately
  notifies :run, 'execute[org-create]', :immediately
end

execute 'reconfigure-chef-server' do
  command 'chef-server-ctl reconfigure'
  action :nothing
end

execute 'org-create' do
  command "chef-server-ctl org-create " \
    "#{org['org-name']} " \
    "#{org['full-name']} " \
    "--association_user #{admin['user-name']} " \
    "--filename #{org['rsa_private_key']}"
  action :nothing
end

execute 'user-create' do
  command "chef-server-ctl user-create " \
    "#{admin['user-name']} " \
    "#{admin['first-name']} " \
    "#{admin['last-name']} " \
    "#{admin['email']} " \
    "#{admin['password']} " \
    "--filename #{admin['rsa_private_key']}"
  action :nothing
end
