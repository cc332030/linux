#!/bin/bash

# $(NF) 最后一个字符，$(NF-1) 倒数第二个字符
grep "Exception: " "$1" | awk -F "Exception: " '{print $(NF)}' | sort | uniq -c
