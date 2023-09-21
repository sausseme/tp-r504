#!/bin/bash

# Vérifier si le nombre d'arguments est égal à 0, 1 ou 2
if [ $# == 0 ]; then
    n1=5
    n2=$((n1 + 10))
elif [ $# == 1 ]; then
    n1=$1
    n2=$((n1 + 10))
elif [ $# == 2 ]; then
    n1=$1
    n2=$2
else
    echo "Usage: $0 [n1] [n2]"
    exit 1
fi

# Afficher les nombres entre n1 et n2
for ((i = n1; i <= n2; i++)); do
    echo "$i"
done

