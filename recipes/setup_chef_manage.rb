execute 'install-opscode-manage' do
  command 'chef-server-ctl install opscode-manage'
end

execute 'reconfigure-chef-server' do
  command 'chef-server-ctl reconfigure'
end

execute 'reconfigure-opscode-manage' do
  command 'opscode-manage-ctl reconfigure'
end
