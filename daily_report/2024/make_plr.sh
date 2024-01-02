#!/bin/bash

# previous date file
p_file_name=`date -d '1 days ago' '+%m%d.md'`

# current date
year=`date '+%Y'`
month=`date '+%m'`
day=`date '+%d'`

# day of the week
dotw_num=`date '+%w'`
if [ $dotw_num -eq 0 ]; then
  dotw='日'
elif [ $dotw_num -eq 1 ]; then
  dotw='月'
elif [ $dotw_num -eq 2 ]; then
  dotw='火'
elif [ $dotw_num -eq 3 ]; then
  dotw='水'
elif [ $dotw_num -eq 4 ]; then
  dotw='木'
elif [ $dotw_num -eq 5 ]; then
  dotw='金'
elif [ $dotw_num -eq 6 ]; then
  dotw='土'
fi

# search previous file
col_num=`sed -n "/## 明日の目標/=" $p_file_name`
col_num=`expr $col_num + 1`
next_target=`tail -n +$col_num $p_file_name`

# output
file_name="$month$day.md"
if [ ! -e $file_name ]; then
  touch $file_name
  echo "# $year/$month/$day($dotw)\n" > $file_name
  echo "## 今日の目標" >> $file_name
  echo "$next_target\n" >> $file_name
  echo "## 学習時間\n" >> $file_name
  echo "## 目標振り返り\n" >> $file_name
  echo "## 解決できたこと\n" >> $file_name
  echo "## 気になる点\n" >> $file_name
  echo "## 感想\n" >> $file_name
  echo "## 明日の目標" >> $file_name
fi