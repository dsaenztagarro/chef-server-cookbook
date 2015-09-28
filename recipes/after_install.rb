admin = node['chef-server']['admin']
org = node['chef-server']['organization']

execute 'org-user-remove' do
  # command "chef-server-ctl org-user-remove --yes #{org['org-name']} #{admin['user-name']}"
  command "knife group remove user #{admin['user-name']} admins"
end

execute 'user-delete' do
  command "chef-server-ctl user-delete --yes #{admin['user-name']}"
end

execute 'org-delete' do
  command "chef-server-ctl org-delete --yes #{org['org-name']}"
end
