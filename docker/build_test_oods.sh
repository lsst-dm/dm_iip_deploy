#!/bin/bash
loc="`dirname \"$0\"`"
docker-compose --env-file versions.env build test-oods
