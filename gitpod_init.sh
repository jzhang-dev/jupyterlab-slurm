#!/usr/bin/env bash
set -euo pipefail

sudo cp -f /etc/munge/munge.key $GITPOD_REPO_ROOT/
sudo chown gitpod:gitpod $GITPOD_REPO_ROOT/munge.key

images=("jupyter" "master" "node")
for image in ${images[@]}
do
    cp -f $GITPOD_REPO_ROOT/munge.key $GITPOD_REPO_ROOT/$image/munge.key
done

docker-compose build baseimage
docker-compose build