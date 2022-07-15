# Notes

## Scanning
### nmap
```bash
nmap -p- -sC -sV -oN path/out_file.txt $IP --open
nmap -p- --min-rate=10000 $IP -oN path/out_file.txt


```

## Spawnig
### Spawn python TTY shell

```bash
python3 -c 'import pty; pty.spawn("/bin/bash");'
python -c 'import pty; pty.spawn("/bin/bash");'
export PATH=/usr/local/sbin;/usr/local/bin;/usr/sbin/;/sbin;/bin;/usr/games;/tmp
export TERM=xterm-256color
alias ll='clear ; ls -lsaht --color=auto'
```

Ctrl + Z

```bash
stty raw -echo ; fg ; reset
stty columns 200 rows 200
```


## Fuzzing
### Fuzzing files
```bash
wfuzz -c -z file,/opt/SecList/Discovery/Web-Content/raft-large-files.txt http://10.11.12.13/FUZZ
```

### Fuzzing directories
```bash
wfuzz -c -z file,/opt/SecList/Discovery/Web-Content/raft-large-directories.txt http://10.11.12.13/FUZZ/
```

### Fuzzing files with extension
```bash
wfuzz -c -z file,/opt/SecList/Discovery/Web-Content/raft-large-files.txt http://10.11.12.13/FUZZ.php
```

### Fuzzing parameters
```bash
wfuzz -c -z file,/opt/SecList/Discovery/Web-Content/burp-parameter-names.txt http://10.11.12.13/target.php?FUZZ=../../../../../../../etc/passwd
```

## Enumeration
### enum4linux
```bash
enum4linux-ng -A $IP -oA outfile.txt
```

### Check for SUID files
```bash
find / -perm -u=s -type f 2>/dev/null
```

### Check for GUID files
```bash
find / -perm -g=s -type f 2>/dev/null
```