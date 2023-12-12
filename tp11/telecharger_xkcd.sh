#!/bin/bash

if [ $# -eq 0 ]; then
    echo "Usage: $0 <numero_strip>"
    exit 1
fi

strip_number=$1
url="http://xkcd.com/$strip_number/"

# Télécharger la page
page_content=$(wget -qO- "$url")

# Extraire l'URL de l'image
image_url=$(echo "$page_content" | grep -oP 'meta property="og:image" content="\K[^"]+')

# Télécharger l'image
wget "$image_url" -O xkcd_strip.png

# Afficher l'image
xdg-open xkcd_strip.png
