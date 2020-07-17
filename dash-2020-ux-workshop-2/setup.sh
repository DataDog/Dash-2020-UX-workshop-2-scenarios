#!/bin/bash
mkdir ~/ecommerce-observability
git clone https://github.com/etnbrd/ecommerce-observability ~/ecommerce-observability
cd ~/ecommerce-observability && git checkout no-instrumentation
cp -r hooks .git/hooks
touch ~/done-setup
