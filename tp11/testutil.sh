#!/bin/bash

while true; do
    PS3="Faites votre choix : "
    options=("Vérifier l’existence d’un utilisateur" "Connaître l’UID d’un utilisateur" "Quitter")
    select choice in "${options[@]}"; do
        case $REPLY in
            1)
                read -p "Entrez le nom de l'utilisateur à vérifier : " username
                if id "$username" >/dev/null 2>&1; then
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
            3)
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
