# General Development Environment

This repository assumes you already have [Vagrant
installed](https://www.vagrantup.com/vagrant) and [VirtualBox
installed](https://www.virtualbox.org/wiki/Downloads).

# Provision development environment

    # FIXME: git clone https://github.com/samrocketman/vagrant-gimp.git
    # FIXME: cd vagrant-gimp
    # FIXME: vagrant up

When the provisioning is done you should reload to get a desktop
environment.

    vagrant reload

# Control development environment

To get the current status of your virtual machine execute the following.

    vagrant status

To poweroff the virtual machine execute the following.

    vagrant halt

Use `vagrant up` to power on the development environment.

# Log in

Then log in with the user `vagrant` and password `vagrant`.

Alternatively, open a terminal and execute the following.

    vagrant ssh

# Tips and Tricks

## More performance

Currently the vagrant box is relatively low spec with the default 8MB video RAM,
2048MB RAM, and 1 CPU core.  The `build-gimp.sh` script will automatically take
advantage of more cores to build GIMP faster.  Just edit the
[`Vagrantfile`](Vagrantfile) file and update the following settings.

    # Customize the VM specs (memory values in MB)
    vb.memory = "8192"
    vb.customize ["modifyvm", :id, "--vram", "128"]
    vb.cpus = "8"

### VirtualBox Guest Additions

Why VirtualBox guest additions?  The VM becomes more performant.  If you're
using a graphical UI then it will autoscale when you fullscreen the virtual
machine.  Shared clipboards can also be enabled.  These features are useful when
developing software inside a VM.

A script for installing VirtualBox guest additions has been provided.  From
within the VM simply call:

    /vagrant/setup/vbox-guest-additions/install.sh

One can override the version of guest additions being installed.  The version of
guest additions should match the version of VirtualBox installed on the host
system.

    vbox_version=5.0.12 /vagrant/setup/vbox-guest-additions/install.sh
