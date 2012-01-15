#/bin/bash

whoami

mkdir -p ./.vnc
chmod 700 .vnc
pwd="vncnovnc"
echo -n $pwd | tightvncpasswd -f > .vnc/passwd
chmod 600 .vnc/passwd

git clone https://github.com/kanaka/noVNC.git

#cp /usr/lib/ssl/openssl.cnf .
#patch < openssl.cnf.patch

vncserver 

file=`ls -t -1 .vnc/*.log | head -1`
echo file is $file
port=`grep "TCP port" $file | tr "\040" "\011" | cut -f10`
echo port is $port

cd noVNC

echo -e "\n\n\n\n\n\n\n\n\n" | openssl req -new -x509 -days 365 -nodes -out self.pem -keyout self.pem
# -config ../openssl.cnf

./utils/launch.sh --vnc localhost:${port}

bash
