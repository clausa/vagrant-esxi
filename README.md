# Vagrant ESXi Provider

This is a Vagrant plugin for VMware ESXi.

**NOTE:** This is a work in progress, it's based on [vagrant-vsphere](https://github.com/nsidc/vagrant-vsphere) and [vagrant-aws](https://github.com/mitchellh/vagrant-aws), the documentation below is supplementary.

## Usage

    Make sure ofvtool is installed and in $PATH

    gem build vagrant-esxi.gemspec
    vagrant plugin install ./vagrant-esxi-*.gem

## ESXi Host Setup

1. enable SSH
2. enable public key authentication, e.g. `cat ~/.ssh/id_rsa.pub | ssh root@host 'cat >> /etc/ssh/keys-root/authorized_keys'`
3. set the license key (if you haven't done so already), e.g. `ssh root@host vim-cmd vimsvc/license --set 'XXXXX-XXXXX-XXXXX-XXXXX-XXXXX'`

## Example Vagrantfile

    config.vm.box = "rhel66_vmware"
    config.vm.box_url = "http://my.vagrant.boxes/rhel66_vmware.box"
    config.vm.hostname = "rhel66"

    config.vm.provider :esxi do |esxi|
      esxi.name = "rhel66"
      esxi.host = "host"
      esxi.datastore = "datastore1"
      esxi.vmx = "/path/to/.vagrant.d/boxes/rhel66/0/esxi/rhel66.vmx"
      esxi.user = "root"
      esxi.password = "Zkg1nJXM1sh19sw9uV6P"
      esxi.network = "bridged=PACKER"

    end

## Issues

https://github.com/pdericson/vagrant-esxi/issues
