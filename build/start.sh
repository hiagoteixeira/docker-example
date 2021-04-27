#!/bin/bash

echo "Start apache"
sudo service apache2 start

# Prender execução do docker
tail -f /dev/null
