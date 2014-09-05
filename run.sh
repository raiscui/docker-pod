#!/bin/bash
PASS=${ROOT_PASS:-$(pwgen -s 12 1)}
_word=$( [ ${ROOT_PASS} ] && echo "preset" || echo "random" )
echo "=> Setting a ${_word} password to the root user"
echo "root:$PASS" | chpasswd
echo "root password '$PASS'"
nohup /usr/sbin/sshd -D >/.pm2/ssh.log &
/usr/local/bin/pod web start
/usr/bin/node /usr/local/bin/pod startall
/usr/local/bin/pm2 logs