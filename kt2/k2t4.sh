find /bin -type f -print0 | xargs -0 head -n 1 | grep '^#!' | awk '{print $2}' | sort | uniq -c | sort -nr | head -n 1
