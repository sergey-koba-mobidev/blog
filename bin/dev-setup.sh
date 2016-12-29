#!/usr/bin/env bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml run admin bin/container-setup.sh
docker-compose -f docker-compose.yml -f docker-compose.dev.yml run front bin/container-setup.sh