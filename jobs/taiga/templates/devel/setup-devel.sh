#!/bin/bash


pushd ~
mkdir -p logs
mkdir -p conf
popd

# Bootstrap
# source ./scripts/setup-vars.sh
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-config.sh
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-apt.sh

# Setup and install services dependencies
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-postgresql.sh
#source ./scripts/setup-redis.sh
#source ./scripts/setup-rabbitmq.sh

# Setup and install python related dependencies
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-buildessential.sh
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-python.sh

# Setup Taiga
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-frontend.sh
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-backend.sh

