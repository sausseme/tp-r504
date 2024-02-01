#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <chemin_absolu>"
    exit 1
fi

path=$1

IFS="/" read -ra tab <<< "$path"

path_valid=true
current_path="/"

for tab in "${tab[@]}"; do
    current_path="$current_path$tab/"
    if [ ! -d "$current_path" ]; then
        path_valid=false
        echo "Chemin invalide, le dossier $tab n'existe pas dans $current_path"
        break
    fi
done

if [ "$path_valid" = true ]; then
    echo "Chemin valide"
fi
