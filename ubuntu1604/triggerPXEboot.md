# trigger pxe boot for next boot
```
ipmitool chassis bootdev pxe options=efiboot,persistent
reboot
```
