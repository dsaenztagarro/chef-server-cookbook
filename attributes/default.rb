default['chef-server']['url'] = \
  'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/' \
  'chef-server-core_12.2.0-1_amd64.deb'

default['chef-server']['file_download_path'] = '/vagrant/downloads'

default['chef-server']['admin'] = {
  'user-name' => 'userlocal',
  'first-name' => 'User',
  'last-name' => 'Local',
  'email' => 'user.local@gmail.com',
  'password' => '123456',
  'rsa_private_key' => '/vagrant/permissions/userlocal.pem'
}

default['chef-server']['organization'] = {
  'org-name' => 'orglocal',
  'full-name' => 'Org Local',
  'rsa_private_key' => '/vagrant/permissions/orglocal-validator.pem'
}
