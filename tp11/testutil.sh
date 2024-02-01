#!/bin/bash

while true; do
    PS3="Faites votre choix : "
    options=("1- Vérifier l’existence d’un utilisateur" "2- Connaître l’UID d’un utilisateur" "q- Quitter")
    select choice in "${options[@]}"; do
        case $REPLY in
            1)
                read -p "Entrez le nom de l'utilisateur à vérifier : " username
                if grep -q "$username:" /etc/passwd; then
                    echo "L'utilisateur existe."
                else
                    echo "L'utilisateur n'existe pas."
                fi
                break
                ;;
            2)
                read -p "Entrez le nom de l'utilisateur pour connaître son UID : " username
                uid=$(id -u "$username" 2>/dev/null)
                if [ -n "$uid" ]; then
                    echo "L'UID de l'utilisateur $username est $uid."
                else
                    echo "L'utilisateur n'existe pas."
                fi
                break
                ;;
            q)
                echo "Au revoir!"
                exit 0
                ;;
            *)
                echo "Choix invalide. Veuillez réessayer."
                break
                ;;
        esac
    done
done