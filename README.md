# Installing chef-server

## Local 

### Chef-Server (Vagrant box)

```
# /etc/hosts

192.168.0.10 chefserver.local
```

Run `vagrant up`.

- `chef-server` recipe installs chef-server and creates an organization and an
  admin user.
- `chef-server::setup_chef_manage` recipe installs chef sever webui

Check network config:

```
vagrant ssh -c "ip address show eth0 | grep 'inet ' | sed -e 's/^.*inet//' -e 's/\/.*$//'"
```

Check installation:

```
vagrant ssh
sudo chef-server-ctl status
sudo chef-server-ctl test
```

### Workstation (Host)


## Remote server

```
# digitalocean droplet
ssh root@<ip.digitalocean.droplet>
adduser admin
gpasswd -a admin sudo

ssh -A admin@<ip.digitalocean.droplet>
wget https://web-dl.packagecloud.io/chef/stable/packages/ubuntu/trusty/chef-server-core_12.2.0-1_amd64.deb
dpkg -i chef-server-core_12.2.0-1_amd64.deb 
```

```
# workstation

# ssh access to digitalocean droplet
ssh-keygen
ssh-copy-id admin@<ip.digitalocean.droplet>
ssh-add
ssh -A <user>@<ip.digitalocean.droplet>

# download chef repo certificates
scp admin@<ip.digitalocean.droplet>:/home/admin/admin.pem .chef/
scp admin@<ip.digitalocean.droplet>:/home/admin/digitalocean-validator.pem .chef/
knife ssl fetch

# test
knife client list

# bootstrap node
knife bootstrap node_domain_or_IP -x demo -A -P password --sudo --use-sudo-password -N name

# verify bootstraped node
knife client list
knife node list
```

# Generating chef-repo

```
rvm use system ; eval "$(chef shell-init `basename $SHELL`)"
chef generate app chef-repo
chef gem install knife-solo
chef-apply ~/Projects/
```

# test-kitchen commands

Install chef-server into vagrant box

```
kitchen create <platform>
kitchen converge <platform>
kitchen login <platform>
kitchen destroy <platform>
```

Where you should replace `<platform>` with `server-ubuntu-1404`

Based on [official documentation](https://docs.chef.io/install_server.html)

# Documentation

[install server](https://docs.chef.io/install_server.html)
