man bash | grep -o '\b[[:alpha:]]\{4,\}\b' | sort |
 uniq -c | sort -nrk1 | sed '3q' | awk '{print $2}'
