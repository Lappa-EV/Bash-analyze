#!/bin/bash

# Подсчет общего количества запросов
total_requests=$(wc -l < access.log)

# Подсчет уникальных IP-адресов с использованием awk
unique_ips=$(awk '{print $1}' access.log | sort | uniq | wc -l)

# Подсчет количества запросов по методам (GET, POST и т.д.) с использованием awk
method_count=$(awk '{print $6}' access.log | tr -d '"' | sort | uniq -c)

# Поиск самого популярного URL с использованием awk
popular_url=$(awk -F' ' '{print $7}' access.log | sort | uniq -c | sort -nr | head -n 1)

# Создание отчета
{
 echo "Отчёт о логе веб-сервера"
 echo "======================="
 echo "Общее количество запросов: $total_requests" 
 echo "Количество уникальных IP-адресов: $unique_ips"
 echo -e "Количество запросов по методам:\n$method_count"
 echo "Самый популярный URL: $popular_url"
} > report.txt

echo "Отчет сохранен в файл report.txt"
