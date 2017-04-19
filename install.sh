#!/bin/bash

function pearson_sudo() {
    echo 'vagrant' | sudo -S sh -c "$*"
}

pearson_sudo "yum install -y -v perl gcc wget kernel-devel-$(uname -r) kernel-headers-$(uname -r)"
pearson_sudo "mount -o loop /home/vagrant/VBoxGuestAdditions.iso /mnt"
pearson_sudo "/mnt/VBoxLinuxAdditions.run --nox11"
pearson_sudo "umount /mnt"
pearson_sudo "yum remove -y kernel-headers-$(uname -r) kernel-devel-$(uname -r) kernel rsyslog"
mkdir ~vagrant/.ssh
chmod 700 ~vagrant/.ssh
cd ~vagrant/.ssh
wget --no-check-certificate 'https://raw.github.com/mitchellh/vagrant/master/keys/vagrant.pub' -O authorized_keys
chmod 600 ~vagrant/.ssh/authorized_keys
chown -R vagrant ~vagrant/.ssh
rm ~vagrant/VBoxGuestAdditions.iso

