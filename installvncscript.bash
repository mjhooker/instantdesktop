#!/bin/bash

uid=`uuidgen`
uid=`echo ${uid} | tr -d "-"`
echo creating ${uid}

useradd -m ${uid}

chmod og-r /home/${uid}

chmod og-r /home


cp -r /root/noVNC /home/${uid}
chown -R ${uid}.${uid} /home/${uid}/noVNC

cp getandsetupnovnc.bash /home/$uid

chown ${uid}.${uid} /home/${uid}/getandsetupnovnc.bash

unset XAUTHORITY
su - -c /home/${uid}/getandsetupnovnc.bash ${uid}


echo exiting

killall -u ${uid}
sleep 5
killall -u ${uid}
sleep 5
userdel -r ${uid}

