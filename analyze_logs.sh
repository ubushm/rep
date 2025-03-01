#!/bin/bash
{
echo -e "Отчет о логе веб-сервера\n========================"
awk 'BEGIN {count=0} {count++} END {print "Общее количество запросов: ", count}' access.log
ips=$(awk '{ print $1 }' access.log | sort -u | wc -l)
echo "Количество уникальных IP-адресов: $ips" 
echo "Количество запросов по методам:"
awk '{ print $6 }' access.log | sed 's/"//g' | sort | uniq -c 
url=$(awk '{ print $7 }' access.log | sort | uniq -c | sort -nr | head -n 1)
echo "Самый популярный URL: $url"
} > report.txt
echo "Отчет сохранен в файл report.txt"
