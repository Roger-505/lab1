#!/bin/bash

get_permissions_verbose(){
        local permission="$1"

        user_permissions="${permission:1:3}"
        group_permissions="${permission:4:3}"
        other_permissions="${permission:7:3}"

        read_permissions(){
		local each_permission="$1"
                local read_permission=""

                if [ "${each_permission:0:1}" == "r" ]
                        then
                        read_permission+=" lectura"
                fi
                if [ "${each_permission:1:1}" == "w" ]
			then
                        read_permission+=" escritura"
                fi
                if [ "${each_permission:2:1}" == "e" ]
                        then
                        read_permission+=" ejecucion"
                fi
                echo "$read_permission"
        }
        echo "Usuario:$(read_permissions "$user_permissions")"
        echo "Grupo:$(read_permissions "$group_permissions")"
        echo "Otros:$(read_permissions "$other_permissions")"

}


if [ $# -ne 1 ]
	then
	echo "Uso: $0 <path_archivo>"
	exit 1
fi

file_path="$1"

if [ ! -e $file_path ]
	then
	echo "No existe el archivo: $file_path"
	exit 1
else
	file_permissions="$(stat -c "%A" "$file_path")"
	get_permissions_verbose "$file_permissions"
fi
exit 0
