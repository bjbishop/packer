#!/bin/bash

function vagrant_sudo() {
    echo 'vagrant' | sudo -S sh -c "$*"
}

vagrant_sudo "yum update -y kernel kernel-firmware libstdc++"
vagrant_sudo "reboot"
