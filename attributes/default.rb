default['chef-server']['url'] = \
  'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/' \
  'chef-server-core_12.1.2-1_amd64.deb'
default['chef-server']['file_download_path'] = '/vagrant/downloads'

default['chef-server']['admin'] = {
  'user-name' => 'myuser',
  'first-name' => 'MyUser',
  'last-name' => 'MyUser',
  'email' => 'david.saenz.tagarro@gmail.com',
  'password' => '123456',
  'rsa_private_key' => '/home/vagrant/myuser.pem'
}

default['chef-server']['organization'] = {
  'org-name' => 'mychef',
  'full-name' => 'MyChef Org',
  'rsa_private_key' => '/home/vagrant/mychef-validator.pem'
}
