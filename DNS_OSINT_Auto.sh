#!/bin/bash
# How to use:
# ./thisSCRIPT [domain] [where-to-save-result]
echo '  ________ _______ ___      ___ _____  ___   
 /"       /"      |"  \    /"  (\"   \|"  \  
(:   \___|:        \   \  //  /|.\\   \    | 
 \___  \ |_____/   )\\  \/. ./ |: \.   \\  | 
  __/  \\ //      /  \.    //  |.  \    \. | 
 /" \   :|:  __   \   \\   /   |    \    \ | 
(_______/|__|  \___)   \__/     \___|\____\) 
	

 '
# Exit if $1 = null:
if test "$1" = "" || test "$2" = ""; 
then
	echo '
	This script will auto find subdomain for you by OSINT.
	Just run command ./thisSCRIPTname [domain] [where-to-save-result].
	'
	exit
fi

export OSINTDNSTARGET=$1

# Create source: 
echo 'anubis
baidu
bevigil
binaryedge
bing
bingapi
bufferoverun
censys
certspotter
crtsh
dnsdumpster
duckduckgo
fullhunt
github-code
hackertarget
hunter
intelx
omnisint
otx
pentesttools
projectdiscovery
qwant
rapiddns
rocketreach
securityTrails
sublist3r
threatcrowd
threatminer
urlscan
virustotal
yahoo
zoomeye' > /tmp/hitempsource.txt

# Find subdomain:
while read source ; do theHarvester -d "${OSINTDNSTARGET}" -b $source ;done < /tmp/hitempsource.txt |  grep -Eo "[a-zA-Z0-9./?=_-]*[:]([0-9]{1,3}[.]){3}[0-9]{1,3}" | sort -u | tr : "\t" | tee $2

# Find subdomain:
# while read source ; do theHarvester -d "${TARGET}" -b $source ;done < /tmp/hitempsource.txt
# tr ""




