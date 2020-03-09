#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/versions.sh
docker-compose build base atbase atarchiver atcontroller ccbase ccarchiver cccontroller
