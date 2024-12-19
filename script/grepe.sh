
grep "Exception: " "$1" | awk -F "Exception: " '{print $2}' | sort | uniq -c
