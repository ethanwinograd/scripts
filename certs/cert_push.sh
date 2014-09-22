#! /bin/bash
array=(server1.somedomain.com, server2.somedomain.com)

for var in "${array[@]}"
do

  cd  ${var}
  cp ../testca/cacert.pem hf.pem
  cat ${var}.key.pem ${var}.cert.pem  > ${var}.pem

  scp ${var}.pem  hf.pem  cdris@${var}:/data/certs

  cd ..
done

