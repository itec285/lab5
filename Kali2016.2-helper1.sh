#!/bin/bash

# Windows Server 2012/2016 AD Password Cracker script Part I.
# Jan 2017, M. Long
#
# This script automates the process of installing several necessary tools into Kali Linux 2016.2012/2016
# Credit for most of this to: http://hackers-workshop.net/how-to-install-smbexec2-on-kali-linux

# No longer need the below line (link was broken)...now included in my repository
#wget http://www.ntdsxtract.com/downloads/ntdsxtract/ntdsxtract_v1_2_beta.zip

# Instead, copy from the current directory (which contains my github contents) to the /opt directory.
cp ntdsxtract_v1_2_beta.zip /opt

#Make sure we are up to date
echo RUNNING APT-GET UPDATE
apt-get update

cd /opt
git clone https://github.com/itec285/lab5-smbexec.git
mv lab5-smbexec smbexec
git clone https://github.com/itec285/lab5-libesedb.git
mv lab5-libesedb libesedb

#Install more necessary software
apt-get -y install automake autoconf autopoint gcc-mingw-w64-x86-64 libtool pkg-config 

#Configure libesedb
cd /opt/libesedb/
./synclibs.sh 
./autogen.sh 
./configure
make

#Unzip Configure NTDSXtract
cd /opt
unzip ntdsxtract_v1_2_beta.zip -d NTDSXtract/
rm ntdsxtract_v1_2_beta.zip

echo Preparing to start editor for the smbexec.yml file
echo 
echo Edit the following lines to read as follows
echo
echo mingw: /usr/bin/x86_64-w64-mingw32-gcc
echo esedbexport: /opt/libesedb/esedbtools/esedbexport
echo
read -rsp $'Press any key to continue...\n' -n 1 key

leafpad /opt/smbexec/smbexec.yml
cd /

#Start extracting the ntds.dit file to exportable files
echo \#######################################################################
echo \#  Starting Initial Table Extraction.  This may take a few minutes.  ##
echo \#                                                                    ##
echo \#######################################################################
cd /opt/libesedb/esedbtools
./esedbexport -m tables /root/ntds.dit
echo
echo Moving files to root directory
mv ntds.dit.export/ ~






