#!/bin/bash
echo ****************setup-devel
echo ${JOB_NAME}
echo ${JOB_DIR}
echo ${PKG_DIR}
echo ${HOME}
echo ************devel


pushd ${HOME}
mkdir -p logs
mkdir -p conf
popd

# Bootstrap
# source ./scripts/setup-vars.sh
echo ********************************setup-config
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-config.sh
echo *******************************config

echo ********************************setup-apt
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-apt.sh
echo ****************************apt

# Setup and install services dependencies
echo ********************************setup-postgresql
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-postgresql.sh
echo ********************************postgresql
#source ./scripts/setup-redis.sh
#source ./scripts/setup-rabbitmq.sh

# Setup and install python related dependencies
echo ********************************setup-buildessential
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-buildessential.sh
echo ********************************buildessential

echo ********************************setup-python
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-python.sh
echo ********************************python
# Setup Taiga
echo ********************************setup-frontend
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-frontend.sh
echo ********************************frontend

echo ********************************setup-backend
source /var/vcap/jobs/${JOB_NAME}/devel/scripts/setup-backend.sh
echo ********************************backend
