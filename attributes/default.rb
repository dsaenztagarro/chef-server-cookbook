default['chef-server']['url'] = \
  'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/' \
  'chef-server-core_12.2.0-1_amd64.deb'

default['chef-server']['file_download_path'] = '/vagrant/downloads'

default['chef-server']['admin'] = {
  'user-name' => 'admin',
  'first-name' => 'admin',
  'last-name' => 'admin',
	'email' => 'admin@vagrant.es',
  'password' => '123456',
  'rsa_private_key' => '/vagrant/permissions/admin.pem'
}

default['chef-server']['organization'] = {
  'org-name' => 'vagrant',
  'full-name' => 'Vagrant VMs',
  'rsa_private_key' => '/vagrant/permissions/vagrant-validator.pem'
}
