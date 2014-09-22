#!/bin/bash

#Required
domain=$1
commonname=$domain

#Change to your company details
country=US
state=Pennsylvania
locality=Pittsburgh
organization=yourOrg.com
organizationalunit=someUnit
email=someUnit@yourOrg.com

#Optional
password=dummy

if [ -z "$domain" ]
then
	echo "Argument not present."
	echo "Useage $0 [common name]"
	exit 99
fi

echo "Generating certfor $domain"

openssl genrsa -out key.pem 2048

echo "Removing passphrase from key"
openssl rsa -in key.pem -passin pass:$password -out ${domain}.key.pem

openssl req -new -key ${domain}.key.pem -out ${domain}.req.pem -outform PEM \
	-subj "/C=$country/ST=$state/L=$locality/O=$organization/OU=$organizationalunit/CN=$commonname/emailAddress=$email" -nodes

cd ../testca

openssl ca -config openssl.cnf -in ../${domain}/${domain}.req.pem -out \
	../${domain}/${domain}.cert.pem -notext -batch -extensions server_ca_extensions

cd ../${domain}/

openssl pkcs12 -export -out ${domain}.keycert.p12 -in ${domain}.cert.pem -inkey ${domain}.key.pem

echo "done"
