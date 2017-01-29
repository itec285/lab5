#mount /dev/sda2 /mnt
#cp /mnt/Windows/NTDS/ntds.dit ~
#cp /mnt/Windows/System32/config/SYSTEM ~

#Start extracting the ntds.dit file to exportable files
echo \######################################################################
echo \#  Starting Initial Table Extraction.  This may take a few minutes.  #
echo \#                                                                    #
echo \######################################################################
cd /opt/libesedb/esedbtools
./esedbexport -m tables /root/ntds.dit
echo Moving files to root directory
mv ntds.dit.export/ ~
