#!/bin/bash

echo -e "\n"
read -p "Introduce IP: " getIP

echo -e "\nHaciendo ping a IP: $getIP"

ttl=$(ping -c 1 $getIP | grep "ttl" | awk '{print $6}' | tr -d 'ttl' | tr -d '=')

if [ $ttl -gt 100 ] && [ $ttl -lt 170 ]; then
    echo -e "\n[+] TTL: $ttl"
    echo -e "\nEl sistema operativo es Windows\n"
elif [ $ttl -gt 60 ] && [ $ttl -lt 100 ]; then
    echo -e "\n[+] TTL: $ttl"
    echo -e "\nEl sistema operativo es Linux\n"
else
    echo -e "\n[+] TTL: $ttl"
    echo -e "\nNo se reconoce al sistema operativo\n"
fi
