bash 'get_config_files' do
  cwd ::File.dirname(node['chef-repo']['filepath'])
  code <<-EOH
    mkdir -p .chef
    scp #{node['chef-server']['config-filepath']}/admin.pem #{chef_repo_filepath}/.chef
    scp #{node['chef-server']['config-filepath']}/mychef.pem #{chef_repo_filepath}/.chef
  EOH
end
