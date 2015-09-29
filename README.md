# Installing chef-server

[install server](https://docs.chef.io/install_server.html)

```
vagrant up
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
