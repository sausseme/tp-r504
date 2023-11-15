#!/bin/bash

server1="http://localhost:80/server1"
server2="http://localhost:80/server2"

count_server1=0
count_server2=0

for ((i=1; i<=500; i++)); do
a=$(curl -s http://localhost:83)

    if [ "$a" = "<h1>Hello 1</h1>" ] ; then
       ((compt1++))

    elif [ "$a" = "<h1>Hello 2</h1>" ]; then
	((compt2++))
    fi
done

echo "Nombre total de requêtes sur nginx1 : $compt1"
echo "Nombre total de requêtes sur nginx2 : $compt2"












