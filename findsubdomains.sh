##!bin/bash

#starting sublister

python ~/tools/Sublist3r/sublist3r.py -d $1 -o domains.txt

#starting assetfinder

~/go/bin/assetfinder --subs-only $1 | tee -a domains.txt

#removing duplicate entries
sort -u domains.txt -o domains.txt

#checking for alive domains
echo -e "\n\n [+] Checking for alive domains.. \n"
cat domains.txt | ~/go/bin/httprobe | tee -a alive.txt
