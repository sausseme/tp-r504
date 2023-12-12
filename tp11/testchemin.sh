#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <chemin_absolu>"
    exit 1
fi

path=$1

if [ -e "$path" ]; then
    echo "Chemin valide"
else
    echo "Chemin invalide, le dossier $(basename "$path") n'existe pas dans $(dirname "$path")"
fi
