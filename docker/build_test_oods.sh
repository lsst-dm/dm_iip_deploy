#!/bin/bash
loc="`dirname \"$0\"`"
source $loc/versions.sh
docker-compose build test-oods
