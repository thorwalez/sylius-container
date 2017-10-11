#!/usr/bin/env bash

    IFS=$(echo -en "\n\b")
    path="./data/dumps"
    type="sql"

    list=$(ls $path | egrep -i "\.$type$");

    for FILE in $(ls $path | egrep -i "\.$type$"); do
       #FILE=$(echo "${FILE}" | sed 's/ /\\ /g')
       data=$(echo "${FILE}" | sed "s/.$type//g")
#       echo "Pfad=$path;Datei=$data;Typ=$type" ##hier ersetzen mit dem, was Du vorhast
       if [ $# -eq 0 ]; then
        mysql -uroot -proot < "$path/$data.$type"
       else
        mysql -uroot -proot $1 < "$path/$data.$type"
       fi
       mv "$path/$data.$type" "$path/$data.bak"
    done