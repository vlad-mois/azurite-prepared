#!/bin/bash

export CURRENT_PATH=$(pwd)
export REPO_ABS_PATH=$(readlink -f $1)

echo "check npm installed"
if ! command -v npm
then
    echo "npm not installed"
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh \
      | bash \
      && source $BASHRC
fi

echo "check node installed"
if ! command -v node
then
    echo "node not installed"
    nvm install v14.17.0
fi

echo "copying archives"
cd /usr/local/lib && tar xzvf $REPO_ABS_PATH/usr-local-lib-node_modules.tar.gz
cd /opt && tar xzvf $REPO_ABS_PATH/opt-azurite.tar.gz

cd /opt/azurite && npm config set unsafe-perm=true && npm install -g --loglevel verbose

echo "check azutite installed"
if ! command -v azurite
then
    echo "azurite not installed"
    exit 1
fi

cd $CURRENT_PATH
