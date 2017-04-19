#!/bin/bash

function vagrant_sudo() {
    echo 'vagrant' | sudo -S sh -c "$*"
}

vagrant_sudo "yum install -y -v perl gcc wget kernel-devel-$(uname -r) kernel-headers-$(uname -r)"
vagrant_sudo "mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt"
vagrant_sudo "/mnt/VBoxLinuxAdditions.run --nox11"
vagrant_sudo "umount /mnt"
vagrant_sudo "yum remove -y kernel-headers-$(uname -r) kernel-devel-$(uname -r) kernel rsyslog"
mkdir ~vagrant/.ssh
chmod 700 ~vagrant/.ssh
cd ~vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 ~vagrant/.ssh/authorized_keys
chown -R vagrant ~vagrant/.ssh
rm ~vagrant/VBoxGuestAdditions.iso

