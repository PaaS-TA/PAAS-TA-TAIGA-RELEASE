#!/bin/bash

#if [[ $EUID -eq 0 ]]; then
#  echo "taiga-scripts doesn't works properly if it used with root user." 1>&2
#  exit 1
#fi
echo ************setup-server
echo ${JOB_NAME}
echo ${JOB_DIR}
echo ${PKG_DIR}
echo ${HOME}
echo ************server
source  /var/vcap/jobs/${JOB_NAME}/devel/setup-devel.sh

# Post Setup Services
source  /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-circus.sh
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-nginx.sh
