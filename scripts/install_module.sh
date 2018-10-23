#!/bin/bash

if [ $# -ne 3 ]; then
    echo "presto-companion Module Installer"
    echo "use: ./install_module folder_origin folder_destination module_name"
    exit 1
fi

ORIGIN_FOLDER=$1
DESTINATION_FOLDER=$2
MODULE_NAME=$3

echo Install Module "$MODULE_NAME"

# Build Module Dependencies
cd $DESTINATION_FOLDER
composer update --prefer-dist --no-interaction --no-progress

# Move Module Contents to Install Folder
echo Move Module Contents to Prestashop Modules Directory

cd $ORIGIN_FOLDER
rm -Rf $ORIGIN_FOLDER/modules/$MODULE_NAME/*
cp -Rf $DESTINATION_FOLDER/*  $ORIGIN_FOLDER/modules/$1/

# Enable the Module
php bin/console prestashop:module install $MODULE_NAME