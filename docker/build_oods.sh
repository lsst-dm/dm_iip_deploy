#!/bin/bash
docker-compose --env-file versions.env build oods
docker-compose --env-file versions.env build atoods
docker-compose --env-file versions.env build ccoods
