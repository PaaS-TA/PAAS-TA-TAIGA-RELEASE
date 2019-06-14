#!/bin/bash


pushd ${HOME}
mkdir -p logs
mkdir -p conf
popd

# Bootstrap
# source ./scripts/setup-vars.sh
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-config.sh"
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-apt.sh"

# Setup and install services dependencies
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-postgresql.sh"
#source ./scripts/setup-redis.sh
#source ./scripts/setup-rabbitmq.sh

# Setup and install python related dependencies
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-buildessential.sh"
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-python.sh"

# Setup Taiga
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-frontend.sh"
su root -c "/var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-backend.sh"

