#!/bin/sh
ssh ubuntu@3.16.188.148 <<EOF
    cd ~/node-jenkins-app-example
    git pull origin master
    curl -o-   https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh    | bash
    . ~/.nvm/nvm.sh
    nvm install v14.14.0
    npm install
    npm install -g pm2
    pm2 restart ecosystem.config.js
    exit
EOF