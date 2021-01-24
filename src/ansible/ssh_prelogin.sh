#!/bin/sh

expect -c "
set timeout 5
spawn env LANG=C /usr/bin/ssh root@node-app
expect \"(yes/no)?\"
send \"yes\n\"
expect \"#\"
exit 0
"
