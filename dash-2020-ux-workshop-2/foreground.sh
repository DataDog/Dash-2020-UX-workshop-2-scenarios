#!/bin/bash

echo "Setup..."

# git init --bare remote # Prepare a fake remote to push to

# git clone https://github.com/etnbrd/ecommerce-workshop.git ~/ecommerce-observability
# cd ~/ecommerce-observability
# git remote add deploy ~/remote # Add the fake remote
# cp scripts/pre-push .git/hooks/ # Setup the fake CI/CD

# git config --global user.email "relevant-titmouse@dash2020.datadoghq.com"
# git config --global user.name "relevant titmouse"

# ./scripts/build.sh

mkdir /ecommerce-observability
git clone https://github.com/burningion/ecommerce-observability /ecommerce-observability
cd /ecommerce-observability && git checkout no-instrumentation

docker pull postgres:11-alpine \
  burningion/ecommerce-spree-ads:latest \
  burningion/ecommerce-spree-observability:cpu-workaround \
  burningion/ecommerce-spree-discounts:latest

echo "Done"