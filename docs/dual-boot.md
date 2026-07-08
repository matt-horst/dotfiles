##Windows Boot Menu Entry

`**/etc/grub.d/40_custom**`
```
#!/bin/sh
exec tail -n +3 $0

if [ "${grub_platform}" == "efi" ]; then
    menuentry "Windows 11" {
        insmod part_gpt
        insmod fat
        insmod search_fs_uuid
        insmod chain

        search --fs-uuid --set=root <UUID OF WINDOWS PARTITION>
        chainloader /EFI/Boot/bootx64.efi
    }
fi
```
Current UUID of Windows Partition: `08F1-C3EA`
