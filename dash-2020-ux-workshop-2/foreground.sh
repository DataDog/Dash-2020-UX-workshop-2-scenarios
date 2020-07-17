#!/bin/bash

echo "Setup..."


mkdir ~/ecommerce-observability
git clone https://github.com/etnbrd/ecommerce-workshop.git ~/ecommerce-observability
cd ~/ecommerce-observability && git checkout no-instrumentation
cp -r hooks .git/hooks
# touch ~/done-setup

# while [ ! -f "~/done-setup" ]; do
#   sleep 1
# done

# rm ~/done-setup
# cd ~/ecommerce-observability