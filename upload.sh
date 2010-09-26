#!/bin/sh

echo -n "ftp passwd: "
stty -echo
read password
stty echo

lftp  -c "open novel.evilcoder.org; login `whoami` ${password}; mirror -vR deploy public_html" 
