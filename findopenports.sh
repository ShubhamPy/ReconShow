#!/bin/bash
mkdir nmapscans

for domain in $(cat $1)
do
        nmap -sV $domain | tee nmapscans/$domain
done
