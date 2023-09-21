#!/bin/bash

# Vérifier si un argument a été fourni
if [ "$1" = 1 ]; then
    echo "fournir un argument"
    exit 1
fi

# Récupérer la première lettre fournie en argument
lettre="$1"

# Vérifier si le répertoire /etc existe
if [ ! -d "/etc" ]; then
    echo "Le répertoire /etc n'existe pas."
    exit 1
fi

for fichier in /etc/$lettre*; do
    # Vérifier si le fichier existe
    if [ -e "$fichier" ]; then
        # Utiliser la commande 'file' pour afficher le type de fichier
        type_fichier=$(file -b "$fichier")
        echo "Fichier: $fichier - Type: $type_fichier"
    fi
done


