# Custom Openstack ClearLinux image

## Use

Clone:

```
git clone <git URL>
```
The .xz file is a usable image with cloud-init for Openstack (could work with other cloud-init compatible clouds)

To create your own image you can use the cloud.json template. The cloud-legacy.json template is for BIOS boot, otherwise you need to enable UEFI boot in your Openstack cloud.

Example assuming you have openstack CLI tools installed and rc file loaded:

```
$ sudo -E ister.py -t cloud-efi.json
$ openstack image create Clear29810 --file fabscloud29810.img.img --min-disk 10 --min-ram 1000 --container-format bare --disk-format qcow2  --property 'config_drive=true' --property 'hw_firmware_type=uefi'
```


