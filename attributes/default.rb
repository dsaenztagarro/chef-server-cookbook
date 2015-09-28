default['chef-server']['url'] = \
  'https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/' \
  'chef-server-core_12.2.0-1_amd64.deb'

default['chef-server']['admin'] = {
  'user-name' => 'myuser',
  'first-name' => 'MyUser',
  'last-name' => 'MyUser',
  'email' => 'david.saenz.tagarro@gmail.com',
  'password' => '123456',
  'rsa_private_key' => '~/myuser.pem'
}

default['chef-server']['organization'] = {
  'org-name' => 'mychef',
  'full-name' => 'MyChef Org',
  'rsa_private_key' => '~/mychef-validator.pem'
}
