#!/bin/bash

# usage
# ./restartContainers.sh [DB root password] [DB user password]
# use same passwords as when initially calling rebuildContainers.sh

# EG:
# ./restartContainers.sh 123 1234

clear; printf "\033[3J"
docker-compose stop
MARIADB_ROOT_PASSWORD=$1 MARIADB_PASSWORD=$2 docker-compose up --detach mariadb
MARIADB_PASSWORD=$2 docker-compose up --detach lucee
