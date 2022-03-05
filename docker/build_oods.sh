#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/versions.sh
docker-compose build oods
docker-compose build atoods
docker-compose build ccoods
