mount /dev/sdb2 /mnt
mount --bind /dev /mnt/dev
mount --bind /proc /mnt/proc
mount --bind /sys /mnt/sys
mkdir /mnt/sys/firmware/efi/efivars
mount --bind /sys/firmware/efi/efivars /mnt/sys/firmware/efi/efivars
mkdir /mnt/boot/efi
mount /dev/sdb1 /mnt/boot/efi
mount -o remount,rw /dev/sdb1 /mnt/boot/efi
mkdir /mnt/hostrun
mount --bind /run /mnt/hostrun
chroot /mnt
mkdir /run/lvm
mount --bind /hostrun/lvm /run/lvm
grub-install /dev/sda
update-grub
exit
umount /mnt/dev
umount /mnt/proc
umount /mnt/sys/firmware/efi/efivars
umount /mnt/sys
umount /mnt/boot/efi
umount /mnt/hostrun
umount /mnt/run/lvm
umount /mnt
REBOOT
