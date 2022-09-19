
# grep 查找文件内容

grep -r 'content' /

# 上下文
grep -C 5 foo file  显示file文件中匹配foo字串那行以及上下5行
grep -B 5 foo file  显示foo及前5行
grep -A 5 foo file  显示foo及后5行

# 去重
grep -A 10 "java.lang.NullPointerException" logback/error.log | uniq -c > exception.log

# 去重 计数
grep "Exception: " logback/error.log | sort | uniq -c

# 模糊查询 .代表任意字符，*代表次数
grep "LogAspect start: .*, cost: " log4j/debug.log

# {min,max}，min 最小出现次数，max 最大出现次数，'{'和'}'需要转义
grep "LogAspect start: .*, cost: [0-9]\{4,\}" log4j/debug.log


# 文件模糊查询，时间排序后查找
ls -tr log4j/debug.log* | xargs -I {} zgrep {} >> test.log
