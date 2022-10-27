#!/bin/bash
# How to use:
# ./thisSCRIPT [domain]
echo '  ________ _______ ___      ___ _____  ___   
 /"       /"      |"  \    /"  (\"   \|"  \  
(:   \___|:        \   \  //  /|.\\   \    | 
 \___  \ |_____/   )\\  \/. ./ |: \.   \\  | 
  __/  \\ //      /  \.    //  |.  \    \. | 
 /" \   :|:  __   \   \\   /   |    \    \ | 
(_______/|__|  \___)   \__/     \___|\____\) 
	

 '
# Exit if $1 = null:
if [[ $1 == "" ]]
then
        echo '
	-h: for help
        '
        exit
fi


# Show help menu eand exit:
if [[ $1 == "-h" ]]
then
	echo '
	This script will auto find subdomain for you by OSINT.
	Just run command ./thisSCRIPTname [domain].
	'
	exit
fi

export OSINTDNSTARGET=$1

# Create source: 
echo 'baidu
bufferoverun
crtsh
hackertarget
otx
projecdiscovery
rapiddns
sublist3r
threatcrowd
trello
urlscan
vhost
virustotal
zoomeye' > /tmp/hitempsource.txt

# Find subdomain:
while read source ; do theHarvester -d "${OSINTDNSTARGET}" -b $source ;done < /tmp/hitempsource.txt |  grep -Eo "[a-zA-Z0-9./?=_-]*[:]([0-9]{1,3}[.]){3}[0-9]{1,3}" | sort -u | tr : "\t"  


# Find subdomain:
# while read source ; do theHarvester -d "${TARGET}" -b $source ;done < /tmp/hitempsource.txt
# tr ""




