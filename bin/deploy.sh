#!/usr/bin/env bash

UNIXTIME=$(date +%s)

cd ./front
docker build -f Dockerfile.prod -t repo.treescale.com/skoba/blog:build-$UNIXTIME .
docker push repo.treescale.com/skoba/blog:build-$UNIXTIME

cd ../admin
docker build -f Dockerfile.prod -t repo.treescale.com/skoba/blog-admin:build-$UNIXTIME .
docker push repo.treescale.com/skoba/blog-admin:build-$UNIXTIME

cd ..
helm upgrade -i --set image.tag=build-$UNIXTIME --wait --namespace default blog ./chart
ADMIN_POD=$(kubectl get pods -l app.kubernetes.io/name=blog-admin --output=jsonpath={.items..metadata.name})
kubectl exec $ADMIN_POD bundle exec ./cli db_migrate