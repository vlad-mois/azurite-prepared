#!/bin/bash

export CURRENT_PATH=$(pwd)
export REPO_ABS_PATH=$(readlink -f $1)

cd /usr/local/lib && tar xzvf $REPO_ABS_PATH/usr-local-lib-node_modules.tar.gz
cd /opt && tar xzvf $REPO_ABS_PATH/opt-azurite.tar.gz
cd $CURRENT_PATH
