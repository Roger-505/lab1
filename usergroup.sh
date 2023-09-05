#!/bin/bash

if [ $# -ne 2 ]; then 
	echo "Uso: $0 <path_archivo>"
	exit 1
fi

pet_user="$1"
new_group="$2"

sudo useradd "$pet_user" 2>/dev/null

if [ $? -eq 9 ];then 
	echo "Ya existe el usuario: $pet_user"
fi

sudo groupadd "$new_group" 2>/dev/null

if [ $? -eq 9 ];then 
        echo "Ya existe el grupo: $new_group"
fi

exit 0
