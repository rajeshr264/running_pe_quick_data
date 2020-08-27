#!/bin/sh

if [ $# -ne 3 ]
  then
    echo "Error: No arguments supplied"
    echo "Usage: run.sh <PE FQDN> <PE Node User name> <PE Node Private Key>"
    exit
fi

if ! command -v bolt &> /dev/null
then
    echo "Error: bolt executable could not be found"
    echo "Info: Bolt installation instructions are at https://puppet.com/docs/bolt/latest/bolt_installing.html"
    exit
fi

echo "Info: Downloading pe_quick_data module from https://forge.puppet.com"
bolt puppetfile install
echo "Info: Running the pe_quick_data module. The collected data will be in /tmp"
bolt plan run pe_quick_data::data_collect output_dir=/tmp \
--targets $1  \
--user $2 \
--private_key $3 \
--run-as root 
