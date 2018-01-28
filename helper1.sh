#!/bin/bash

# Windows Server 2012/2016 AD Password Cracker script Part I.
# Jan 2017, Jan 2018 M. Long
#
# This script automates the process of installing several necessary tools into Kali Linux 2016.2012/2016
# Credit for most of this to: http://hackers-workshop.net/how-to-install-smbexec2-on-kali-linux

# Instead, copy from the current directory (which contains my github contents) to the /opt directory.
cp ntdsxtract_v1_2_beta.zip /opt

# OLD 2017.3 WAY - We will also unzip libesedb and move to the /opt dir with the right name
#unzip lab5-libesedb-2018.zip
#mv lab5-libesedb-2018/ /opt/libesedb/

#Make sure we are up to date, then install libesedb-utils
echo RUNNING APT-GET UPDATE
apt-get update
echo INSTALLING LIBESEDB-UTILS
apt-get -y install libesedb-utils

#Unzip Configure NTDSXtract
cd /opt
unzip ntdsxtract_v1_2_beta.zip -d NTDSXtract/
rm ntdsxtract_v1_2_beta.zip

#Start extracting the ntds.dit file to exportable files
echo \#######################################################################
echo \#  Starting Initial Table Extraction.  This may take a few minutes.  ##
echo \#                                                                    ##
echo \#######################################################################
cd ~ 
esedbexport -m tables /root/ntds.dit
#Note, the export files will be placed into files in the ~/ntds.dit.export/ directory







