#!/bin/bash

if [ $(id -u) == 0 ]; then

    echo -e "\nMenú\n"
    echo -e "1 - update - Actualizar lista de paquetes disponibles."
    echo -e "2 - upgrade - Instala la lista de paquetes disponibles."
    echo -e "3 - update y upgrade - Actualiza lista e instala paquetes."
    echo -e "4 - full-upgrade - Actualizar el sistema eliminando/instalando/actualizando paquetes."
    echo -e "5 - Salir\n"

    read -p "Opción: " opcion

    if [ $opcion == 1 ]; then
    
        apt update
        echo -e "\n[+] UPDATE COMPLETADO\n"

        read -p "¿Quieres hacer el upgrade? (s/n): " hacerupgrade

        if [ $hacerupgrade == 's' ]; then

            apt upgrade -y
            echo -e "\n[+] UPGRADE COMPLETADO\n"

        else

            echo -e "\nSaliendo...\n"
            exit 1

        fi

    elif [ $opcion == 2 ]; then

        apt upgrade
        echo -e "\nInstalada la lista de paquetes.\n"
        echo -e "\n[+] UPGRADE COMPLETADO\n"

    elif [ $opcion == 3 ]; then

        apt update
        apt upgrade -y
        echo -e "\n[+] UPDATE / UPGRADE COMPLETADO\n"

    elif [ $opcion == 4 ]; then

        echo -e "\nSe recomienda hacer una copia de seguridad antes de hacer FULL-UPGRADE\n"
        read -p "Continuar? (s/n): " continuarfullupgrade
 
        if [ $continuarfullupgrade == 's' ]; then

            apt full-upgrade -y
            echo -e "\n[+] FULL-UPGRADE COMPLETADO\n"

        else

            echo -e "\nSaliendo...\n"
            exit 1

        fi

    elif [ $opcion == 5 ]; then        

        echo -e "\nSaliendo...\n"

    fi

        
else

    echo -e "\n[+] Tienes que ser root para actualizar el sistema.\n"

fi
