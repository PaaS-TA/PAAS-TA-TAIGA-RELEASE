#!/bin/bash

FRONTEND_VERSION="stable"

pushd ${HOME}

cat > /tmp/conf.json <<EOF
{
    "api": "/api/v1/",
    "eventsUrl": null,
    "debug": "true",
    "publicRegisterEnabled": true,
    "feedbackEnabled": false,
    "privacyPolicyUrl": null,
    "termsOfServiceUrl": null,
    "maxUploadFileSize": null,
    "gitHubClientId": null,
    "contribPlugins": []
}
EOF


#if [ ! -e ~/taiga-front ]; then
    # Initial clear
#    git clone https://github.com/taigaio/taiga-front-dist.git taiga-front
#    tar xfz /home/inception/workspace/user/kjhyun/setup-taiga-FE/taiga-front/taiga-front.tar.gz
#    tar xfz ${PKG_DIR}/taiga-front.tar.gz
    pushd ${HOME}/taiga-front
#    git checkout -f stable

    mv /tmp/conf.json dist/

    popd
#else
#    pushd ~/taiga-front
#    git fetch
#    git checkout -f stable 
#    git reset --hard origin/stable
#    tar xfz ${PKG_DIR}/taiga-front.tar.gz
#    popd
#fi

popd
