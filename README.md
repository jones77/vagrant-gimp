# General Development Environment

Welcome!  This development environment is meant to get you up and running fast.
This environment is intended for development.

This repository assumes you already have [Vagrant installed][vagrant] and
[VirtualBox installed][vbox].

# Prerequisites

### Required software

* Install the [latest version of Vagrant][vagrant] (Vagrant 1.8.1 as of this
  writing).
* Install the [latest version of VirtualBox][vbox] (VirtualBox 5.0.12 as of this
  writing).

### System requirements

See Tips and Tricks (documented below) for getting more performance out of the
VM.  I recommend leaving at least 2GB of RAM for your operating system and other
applications.

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

### More performance

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
