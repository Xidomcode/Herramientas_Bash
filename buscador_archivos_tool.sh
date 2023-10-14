#!/bin/bash

echo -e "\n"
read -p "Introduce una palabra para buscar: " palabra
echo -e "\nDonde quieres buscar el archivo?\n"

ls -l /

echo -e "\n"
read -p "Introduce / o la ruta que quieras: " ruta
echo -e "\n"

if [[ $ruta == *"/"* ]]; then
    resultado=$(find $ruta | grep $palabra 2>/dev/null)
    echo -e "$resultado"

    if [ -z "$resultado" ]; then        # con -z valido si la variable resultado está vacía. 
        echo -e "No hay resultados"
    fi

else
    resultado=$(find /$ruta | grep $palabra 2>/dev/null)
    echo -e "$resultado"
    
    if [ -z "$resultado" ]; then
        echo -e "No hay resultados"
    fi
fi

echo -e "\n"

exit 1
