These scripts are useful for generating a number of self-signed ssl certs for a number of boxes.

Edit the array in the various scripts to contain your list of boxes.

run make_all_certs.sh to generate a series of certificates iinto subfolders named for each domain.
  (it calls make_certs.sh for each server, passing in the servername as a variable)

run cert_push.sh to push the certs out to each server.  Default destination for these is/data/certs.

You may need to create this directory first on the target boxes  - you may wish to change this path.
