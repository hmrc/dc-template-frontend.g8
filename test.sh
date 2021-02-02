#!/usr/bin/env bash

if [[ -f ./build.sbt ]] && [[ -d ./src/main/g8 ]]; then

    export TEMPLATE=`pwd | xargs basename`
    echo ${TEMPLATE}
    mkdir -p target/sandbox
    cd target/sandbox
    sudo rm -r some-service-frontend
    g8 file://../${TEMPLATE} --serviceName="Some Service Frontend" --serviceTargetPort="9999" --serviceTitle="Some Service Title" --package="uk.gov.hmrc.someservicefrontend" -o some-service-frontend "$@"
    cd some-service-frontend
    git init
    git add .
    git commit -m start
    sbt test it:test

else

    echo "WARNING: run the script ./test.sh in the template root folder"
    exit -1

fi
