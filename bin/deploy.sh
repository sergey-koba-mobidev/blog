#!/usr/bin/env bash
cd ./front
docker build -f Dockerfile -t sergkoba/blog:latest .
docker push sergkoba/blog:latest

cd ../admin
docker build -f Dockerfile -t sergkoba/blog:latest-admin .
docker push sergkoba/blog:latest-admin

cd ..
rancher up -d -u -c -p

rancher exec admin bundle exec ./cli db_migrate