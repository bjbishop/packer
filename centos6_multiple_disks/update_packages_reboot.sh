#!/bin/bash

function vagrant_sudo() {
    echo 'vagrant' | sudo -S sh -c "$*"
}

vagrant_sudo "yum update -y kernel kernel-firmware libstdc++"
vagrant_sudo "yum install -y parted"
vagrant_sudo "parted --script --align minimal /dev/sdb mklabel msdos mkpart primary 0.0 200.0 set 1 raid on"
vagrant_sudo "parted --script --align minimal /dev/sdc mklabel msdos mkpart primary 0.0 100.0 set 1 LVM on"
vagrant_sudo "parted --script --align minimal /dev/sdd mklabel msdos mkpart primary 0.0 50.0 set 1 LVM on"
vagrant_sudo "reboot"
