#!/bin/bash

while IFS='' read -r line || [[ -n "$line" ]]; do
    wget --user <user_name> --password <passwd> ;
done < $1
