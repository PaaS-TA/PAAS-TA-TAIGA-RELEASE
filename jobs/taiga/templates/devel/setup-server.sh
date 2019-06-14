#!/bin/bash

#if [[ $EUID -eq 0 ]]; then
#  echo "taiga-scripts doesn't works properly if it used with root user." 1>&2
#  exit 1
#fi

su root -c "/var/vcap/jobs/${JOB_NAME}/devel/setup-devel.sh"

# Post Setup Services
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-circus.sh"
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-nginx.sh"
