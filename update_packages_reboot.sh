#!/bin/bash

function pearson_sudo() {
    echo 'vagrant' | sudo -S sh -c "$*"
}

pearson_sudo "yum update -y kernel kernel-firmware libstdc++"
pearson_sudo "reboot"
