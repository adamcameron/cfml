#!/bin/bash

# usage
# ./rebuildContainers.sh [password to use for various services]
# EG:
# ./rebuildContainers.sh 12345

clear; printf "\033[3J"
docker-compose down --remove-orphans --volumes
LUCEE_PASSWORD=$1 docker-compose build --no-cache
MARIADB_ROOT_PASSWORD=$1 MARIADB_PASSWORD=$1 FTP_USER_PASSWORD=$1 docker-compose up --force-recreate --detach
