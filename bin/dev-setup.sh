#!/usr/bin/env bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml run admin bin/container-setup.sh
docker-compose -f docker-compose.yml -f docker-compose.dev.yml run front bin/container-setup.sh

# add to /etc/hosts
if grep -q "1devblog.local" /etc/hosts; then
    echo "1devblog.local exists in /etc/hosts"
else
    echo "127.0.0.1 1devblog.local" >> /etc/hosts;
    echo " Added 127.0.0.1 1devblog.local to /etc/hosts"
fi
if grep -q "admin.1devblog.local" /etc/hosts; then
    echo "admin1devblog.local exists in /etc/hosts"
else
    echo "127.0.0.1 admin.1devblog.local" >> /etc/hosts;
    echo " Added 127.0.0.1 admin.1devblog.local to /etc/hosts"
fi