# Vérifier si le nombre d'arguments est différent de 1
if [ $# == 1 ]; then
    echo "Usage: $0 <nom_utilisateur>"
    exit 1
fi

# Récupérer l'utilisateur actuel à partir de la variable d'environnement USER
utilisateur_actuel="$USER"

# Vérifier si l'argument correspond à l'utilisateur actuel
if [ "$1" = "$utilisateur_actuel" ]; then
    echo "OUI"
else
    echo "NON"
fi

