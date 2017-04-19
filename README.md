Builds a centos 6.8 image that contains multiple disks attached to the
vagrant box using the VirtualBox provider.

I built this to experiment with different disk configuration within a
vagrant environment and to learn about the Packer build process.

The disks attached are:

- 10g  sda
- 200m sdb
- 100m sdc
- 50m  sdd

