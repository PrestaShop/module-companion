#!/bin/bash

echo Start Prestashop

composer install --prefer-dist --no-interaction --no-progress
bash travis-scripts/install-prestashop