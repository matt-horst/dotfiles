## Install Arch Linux
1. Boot from the Arch ISO install medium

2. Ensure that the system is booted in UEFI mode. The following should run without error:
```
ls /sys/firmware/eif/efivars
```

3. Connect to the internet. This can be accomplished by simply connecting an ethernet (preferred) or using wifi:
```
nmcli device wifi connect <SSID> --ask
```

4. Use `fdisk` to create the partions as necessary.
```
fdisk /dev/<DEVICE>
```

5. Format boot partition.
```
mkfs.fat -F 32 /dev/<BOOT_PART>
```

6. Setup encrypted partition.
```
cryptsetup --use-random luksFormat /dev/<LUKS_PART>
cryptsetup open /dev/<LUKS_PART> cryptroot
```

7. Format Luks partition
```
mkfs.btrfs -L arch /dev/mapper/cryptroot
```

8. Create Btrfs Subvolumes
```
mount /dev/mapper/cryptroot /mnt

btrfs subvolume create /mnt/@
btrfs subvolume create /mnt/@home
btrfs subvolume create /mnt/@var_cache
btrfs subvolume create /mnt/@var_log
btrfs subvolume create /mnt/@swap

umount /mnt
```

9. Mount Btrfs Subvolumes and Boot Partition
```
mount -o noatime,compress=zstd,subvol=@ /dev/mapper/cryptroot /mnt
mount -o noatime,compress=zstd,subvol=@home /dev/mapper/cryptroot /mnt/home
mount -o noatime,compress=zstd,subvol=@var_cache /dev/mapper/cryptroot /mnt/var/cache
mount -o noatime,compress=zstd,subvol=@var_log /dev/mapper/cryptroot /mnt/var/log
mount -o defaults,nodatacow,subvol=@swap /dev/mapper/cryptroot /mnt/swap

mount /dev/<BOOT_PART> /mnt/boot
```


10. Install base system and core software
```
pacstrap -K /mnt base base-devel linux linux-firmware linux-headers btrfs-progs cryptsetup snapper grub efibootmgr networkmanager openssh git vim sudo
```

11. Create the filesystem table
```
genfstab -U /mnt >> /mnt/etc/fstab
```

12. Enter the new system
```
arch-chroot /mnt /bin/bash
```

13. Create swapfile
```
btrfs filesystem mkswapfile --size 24G /swap/swapfile
swapon /swap/swapfile

echo '/swap/swapfile none swap defaults 0 0' >> /etc/fstab
```

13. Set the timezone
```
ln -s /usr/share/zoneinfo/<REGION>/<LOCAL> /etc/localtime
```

14. Set the hardware clock using the system clock
```
hwclock --systohc
```

15. Set the locale. 
```
# Edit /etc/locale.gen file by uncommenting the `en_US.UTF-8 UTF-8` line

locale-gen
echo LANG=en_US.UTF-8 > /etc/locale.conf
```

16. Set the hostname
```
echo <HOSTNAME> > /etc/hostname
```

17. Create the user
```
useradd -m -G wheel <USERNAME>
passwd <USERNAME>               # Set the password of the new user
passwd                          # Set the password for the root user
```

18. Grant wheel group super-user privileges:
```
visudo

# uncomment `%wheel ALL=(ALL) ALL`
```

19. Configure `mkinitcpio`
    - Edit `/etc/mkinitcpio.conf`
    - Add `sd-encrypt` to `HOOKS` before `filesystems`

20. Recreate the initramfs
```
mkinitcpio -P
```

21. Edit `/etc/crypttab`
```
cryptroot UUID=<LUKS_PART_UUID> none luks
```

21. Setup GRUB
```
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB
```
Find the UUID of the `<LUKS_PART>` and `<WINDOWS_EFI_PART>` using `lsblk --fs`
```
GRUB_CMDLINE_LINUX="rd.luks.name=<LUKS_PART_UUID>=cryptroot root=/dev/mapper/cryptoot"
```

Add GRUB menu entry for Windows 11
```
# /etc/grub.d/40_custom

if [ "${grub_platform}" == "efi" ]; then
	menuentry "Windows 11" {
		insmod part_gpt
		insmod fat
		insmod search_fs_uuid
		insmod chain

		search --fs-uuid --set=root <WINDOW_EFI_PART_UUID>
		chainloader /EFI/Boot/bootx64.efi
	}
fi
```

Create GRUB config
```
grub-mkconfig -o /boot/grub/grub.cfg
```

## Btrfs Snapshots
1. Create snapper configurations
```
snapper -c root create-config /
snapper -c home create-config /home/

systemctl enable snapper-timeline.time snapper-cleanup.timer
```


2. Install snap-pac and grub-btrfs
```
# Adds hooks to pacman to automatically create snapshots before/after system updates
sudo pacman -S snap-pac

# Automatically creates GRUB menu entries for snapshots
sudo pacman -S inotify-tools grub-btrfs

sudo systemctl enable grub-btrfsd
```

## Install AUR Helper
```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

## Run the Installation Script
```
git clone https://github.com/matt-horst/dotfiles.git
cd dotfiles
./install.sh
```

## Automatic Login Using ReGreet
```
sudo pacman -S greetd-regreet
```

```
# /etc/greetd/config.toml

[terminal]
# The VT to run the greeter on. Can be "next", "current" or a number
# designating the VT.
vt = 1

# The default session, also known as the greeter.
[default_session]
command = "dbus-run-session start-hyprland -- -c /etc/greetd/hyprland.lua"
user = "greeter"

[initial_session]
command = "dbus-run-session start-hyprland"
user = "matt"
```


```
# /etc/greetd/hyprland.lua

hl.on("hyprland.start", function()
    hl.exec_cmd("regreet; hyprctl dispatch 'hl.dsp.exit()'")
    hl.exec_cmd("hyprpaper")
end)

hl.config({
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        disable_hyprland_guiutils_check = true,
    },

    cursor = {
	no_hardware_cursors = 1,
    },
})
```
