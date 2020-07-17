#!/bin/bash

echo "Setup..."

git init --bare remote # Prepare a fake remote to push to

git clone https://github.com/etnbrd/ecommerce-workshop.git ~/ecommerce-observability
cd ~/ecommerce-observability
git remote add deploy ~/remote # Add the fake remote
cp hooks/* .git/hooks/ # Setup the fake CI/CD

# touch ~/done-setup

# while [ ! -f "~/done-setup" ]; do
#   sleep 1
# done

# rm ~/done-setup
# cd ~/ecommerce-observability