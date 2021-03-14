#!/bin/sh
chpasswd < /root/passwd

if [ -f /ogm/.init.sh ];then
    /ogm/.init.sh
    rm -f /ogm/.init.sh
fi
if [ -f /ogm/.startup.sh ];then
    /ogm/.startup.sh
fi
/usr/sbin/sshd -D

