#
# Cookbook Name:: chef-server
# Recipe:: default
#
# Copyright (c) 2015 The Authors, All Rights Reserved.

admin = node['chef-server']['admin']
org = node['chef-server']['organization']

package_url = node['chef-server']['url']
package_name = ::File.basename(package_url)
package_path = nil
package_cache_path = File.join(Chef::Config[:file_cache_path], package_name)
package_download_path = File.join(node['chef-server']['file_download_path'], package_name)

if File.exists?(package_cache_path)
  log 'message' do
    message "Package found (cache): #{package_cache_path}"
    level :info
  end
  package_path = package_cache_path
elsif File.exists? package_download_path
  log 'message' do
    message "Package found (download): #{package_download_path}"
    level :info
  end
  package_path = package_download_path
else
  # package is remote, let's download it
  remote_file package_cache_path do
    source package_url
  end
end

dpkg_package package_path do
  notifies :run, 'execute[reconfigure-chef-server]', :immediately
  notifies :run, 'execute[user-create]', :immediately
  notifies :run, 'execute[org-create]', :immediately
end

execute 'reconfigure-chef-server' do
  command 'chef-server-ctl reconfigure'
  # action :nothing
end


execute 'user-create' do
  command "chef-server-ctl user-create " \
    "#{admin['user-name']} " \
    "#{admin['first-name']} " \
    "#{admin['last-name']} " \
    "#{admin['email']} " \
    "#{admin['password']} " \
    "--filename #{admin['rsa_private_key']}"
  # action :nothing
end

execute 'org-create' do
  command "chef-server-ctl org-create " \
    "#{org['org-name']} " \
    "#{org['full-name']} " \
    "--association_user #{admin['user-name']} " \
    "--filename #{org['rsa_private_key']}"
  # action :nothing
end
