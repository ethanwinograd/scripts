#!/bin/bash

array=(server1.somedomain.com, server2.somedomain.com)

cd testca

rm serial

echo 01 > serial

touch index.txt

openssl req -x509 -config openssl.cnf -newkey rsa:2048 -days 3650 \
-out cacert.pem -outform PEM -subj /CN=MyTestCA/ -nodes

openssl x509 -in cacert.pem -out cacert.cer -outform DER

cd ..

for var in "${array[@]}"
do
  mkdir -p ${var}

  cd ${var}
  ../make_certs.sh ${var}
  cd ..
 done

echo "done"
