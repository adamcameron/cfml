#!/bin/bash

# usage
# ./restartContainers.sh [password to use for various services]
# use same password as when initially calling rebuildContainers.sh

# EG:
# ./restartContainers.sh 12345

clear; printf "\033[3J"
docker-compose stop
MARIADB_ROOT_PASSWORD=$1 MARIADB_PASSWORD=$1 docker-compose up --detach mariadb
MARIADB_PASSWORD=$1 FTP_USER_PASSWORD=$1 docker-compose up --detach lucee
FTP_USER_PASSWORD=$1 docker-compose up --detach ftp
