#!/bin/bash
# ran 'chmod +x' to make file executable

username=""
companyname=""
pin=""

for i in {1..3}; do
        if [ "$i" -eq 1 ]; then
                echo "Enter your Username: "
                read username
        elif [ "$i" -eq 2 ]; then
                echo "Enter your Company name: "
                read companyname
        else
                echo "Enter your PIN: "
                read pin
        fi
done

if [ "$username" = "John" ] && [ "$companyname" = "Tryhackme" ] && [ "$pin" = "7385" ]; then
        echo "Authentication Successful. You can now access your locker, John."
else
        echo "Authentication Denied!!"
fi