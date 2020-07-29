#!/bin/bash

echo "Setup..."

# TODO this script should move to setup. It's handy to have it in foreground while debugging

git init --bare remote # Prepare a fake remote to push to

git clone https://github.com/etnbrd/ecommerce-workshop.git ~/ecommerce-observability
cd ~/ecommerce-observability
docker-compose pull agent frontend advertisements db # pull images now to avoid wasting time later
docker build -t discounts-service discounts-service # build image now to avoid wasting time later
git remote add deploy ~/remote # Add the fake remote
cp scripts/pre-push .git/hooks/ # Setup the fake CI/CD

git config --global user.email "relevant-titmouse@dash2020.datadoghq.com"
git config --global user.name "relevant titmouse"

# ./scripts/build.sh

# mkdir /ecommerce-observability
# git clone https://github.com/burningion/ecommerce-observability /ecommerce-observability
# cd /ecommerce-observability && git checkout no-instrumentation

# docker pull postgres:11-alpine
# docker pull burningion/ecommerce-spree-ads:latest
# docker pull burningion/ecommerce-spree-observability:cpu-workaround
# docker pull burningion/ecommerce-spree-discounts:latest

echo "Done"