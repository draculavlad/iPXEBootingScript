tftp pxe image
```
http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/pxelinux.0
```

kernel
```
http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/initrd.gz
```

initrd
```
http://archive.ubuntu.com/ubuntu/dists/xenial-updates/main/installer-amd64/current/images/netboot/ubuntu-installer/amd64/linux
```


ipxe src
```
http://boot.ipxe.org/ipxe.iso
http://boot.ipxe.org/ipxe.efi
```

mirror source(offical relese source iso mount)
```
http://old-releases.ubuntu.com/releases/16.04.4/ubuntu-16.04.5-server-amd64.iso
```
config
```
mkdir /mnt/ubuntu1604
mount -o loop ubuntu-16.04.6-server-amd64.iso /mnt/ubuntu1604
```

