echo 0
mount /dev/sdb2 /mnt
echo 1
mount --bind /dev /mnt/dev
echo 2
mount --bind /proc /mnt/proc
echo 3
mount --bind /sys /mnt/sys
echo 4
mount --bind /sys/firmware/efi/efivars /mnt/sys/firmware/efi/efivars
echo 5
mount /dev/sdb1 /mnt/boot/efi
echo 6
mount -o remount,rw /dev/sdb1 /mnt/boot/efi
echo 7
mount --bind /run /mnt/hostrun
echo 8
chroot /mnt
echo 9
mkdir /run/lvm
echo 10
mount --bind /hostrun/lvm /run/lvm
echo 11
grub-install /dev/sdb
echo 12
update-grub
echo 13
exit
echo 14
umount /mnt/dev
echo 15
umount /mnt/proc
echo 16
umount /mnt/sys/firmware/efi/efivars
echo 17
umount /mnt/sys
echo 18
umount /mnt/boot/efi
echo 19
umount /mnt/hostrun
echo 20
umount /mnt/run/lvm
echo 21
umount /mnt
echo 22
reboot
