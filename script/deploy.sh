#!/bin/sh
ssh -v -tt -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -o GlobalKnownHostsFile=/dev/null ubuntu@3.16.188.148 <<EOF
    cd ~/node-jenkins-app-example
    git pull origin main
    curl -o-   https://raw.githubusercontent.com/creationix/nvm/v0.33.8/install.sh    | bash
    . ~/.nvm/nvm.sh
    nvm install v14.14.0
    npm install
    npm install -g pm2
    pm2 restart ecosystem.config.js
    exit
EOF