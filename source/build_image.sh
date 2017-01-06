#!/usr/bin/env bash
set -e


docker build -t test/nc_base .

# A test to see whether we can create a file in a mounted directory and
# read it again afterwards.
docker run --env NC_USER_ID=$(id -u) -v/tmp:/data test/nc_base /bin/bash -c "python -c 'import flask'; echo 'Hello World!' > /data/blah.txt; ls -l /data"
cat /tmp/blah.txt
rm /tmp/blah.txt
