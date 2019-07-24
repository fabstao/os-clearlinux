# Custom Openstack ClearLinux image

## Requirements

Current ClearLinux host with ister.py installed (os-installer bundle):

```
$ sudo swupd update
$ sudo swupd bundle-add os-installer
```


## Use

Clone:

```
git clone <git URL>
```

To create your own image you can use the cloud-efi.json template. The cloud-legacy.json template is for BIOS boot, otherwise you need to enable UEFI boot in your Openstack cloud.

The template oscd.json is for BIOS boot and Openstack style ConfigDrive (fake cd). This one supports network_data.json, pretty handy if you can't or do not want to use DHCP.

Example assuming you have openstack CLI tools installed and rc file loaded:

```
$ sudo -E ./create.sh
$ sudo umount /tmp/oscd
$ openstack image create Clear30480 --file oscd-clr-cloudimage.img --min-disk 8 --min-ram 1000 --container-format bare --disk-format qcow2  --property 'img_config_drive=mandatory' 

```


