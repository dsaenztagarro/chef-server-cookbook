# Installing chef-server

## Local (Vagrant box)

```
vagrant up

# Get vagrant box ip
vagrant ssh -c "ip address show eth0 | grep 'inet ' | sed -e 's/^.*inet//' -e 's/\/.*$//'"

# Check installation
vagrant ssh
sudo chef-server-ctl status
sudo chef-server-ctl test
```

## Remote server

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
