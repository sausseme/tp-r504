#!/bin/bash
strip_number=$1

url="http://xkcd.com/$strip_number/"

page_content=$(wget -qO- "$url")

image_url=$(echo "$page_content" | grep -oP 'meta property="og:image" content="\K[^"]+')

IFS="\"" read -ra fields <<< "$image_url"

image_url="${fields[0]}"

wget "$image_url" -O xkcd_strip.png
xdg-open xkcd_strip.png