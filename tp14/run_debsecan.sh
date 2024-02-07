#!/bin/bash

# Exécuter debsecan pour rechercher les vulnérabilités
sudo debsecan --suite=$(lsb_release --codename --short)
