#!/bin/bash

echo "Setup..."

while [ ! -f "~/done-setup" ]; do
  sleep 1
done

rm ~/done-setup
cd ~/ecommerce-observability