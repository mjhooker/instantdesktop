#!/bin/bash

useradd -m novnc


cp getandsetupnovnc.bash openssl.cnf.patch /home/novnc

chown novnc.novnc /home/novnc/getandsetupnovnc.bash

unset XAUTHORITY
su - -c /home/novnc/getandsetupnovnc.bash novnc



echo do your thing
bash

echo exiting

killall -u novnc
sleep 5
userdel -r novnc

