#/bin/sh
clear
echo "
Scanning
-------------------------------------------------------------------------------
nmap -p- -sC -sV -oN path/out_file.txt $IP --open
nmap -p- --min-rate=10000 $IP -oN path/out_file.txt


Spawn python TTY shell
-------------------------------------------------------------------------------
Remote site
 python3 -c 'import pty; pty.spawn(\"/bin/bash\");'
 python -c 'import pty; pty.spawn(\"/bin/bash\");'
 export PATH=/usr/local/sbin;/usr/local/bin;/usr/sbin/;/sbin;/bin;/usr/games;/tmp
 export TERM=xterm-256color
 alias ll='clear ; ls -lsaht --color=auto'
 Ctrl + Z

Host site
 stty raw -echo ; fg ; reset

Remote site
 stty columns 200 rows 200


Fuzzing files
-------------------------------------------------------------------------------
wfuzz -c -z file,/opt/SecList/Discovery/Web-Content/raft-large-files.txt http://10.11.12.13/FUZZ

Fuzzing directories
wfuzz -c -z file,/opt/SecList/Discovery/Web-Content/raft-large-directories.txt http://10.11.12.13/FUZZ/

Fuzzing files with extension
wfuzz -c -z file,/opt/SecList/Discovery/Web-Content/raft-large-files.txt http://10.11.12.13/FUZZ.php

Fuzzing parameters
wfuzz -c -z file,/opt/SecList/Discovery/Web-Content/burp-parameter-names.txt http://10.11.12.13/target.php?FUZZ=../../../../../../../etc/passwd


Enumeration
-------------------------------------------------------------------------------
enum4linux-ng -A $IP -oA outfile.txt

Check for SUID/GUID
find / -perm -u=s -type f 2>/dev/null
find / -perm -g=s -type f 2>/dev/null"
