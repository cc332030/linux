#/bin/bash

# 扩展
#	-gt		大于
#	-lt		小于
#	-eq		等于
#	-ge		大于等于
#	-le		小于等于
#	-ne		不等于

for filename in 'ls'
do
	if [-d $filename]
		then b = 0
	else
		a = $(ls -l $filename | awk '{print $5}')
			if [$a -eq 0]
			then rm $filename
			fi
		fi
	fi
done