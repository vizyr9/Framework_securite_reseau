#!/bin/bash

#codes couleur pour l'affichage. Mettre un 1 avant le point virgule met en gras le texte
red='\033[1;31m'
white='\033[0;37m'



source ./libs/framework_menus.sh
source ./libs/framework_choiceHandlers.sh
source ./libs/framework_commands.sh



run_mainMenu() {
    while true; do
        show_mainMenu
        read -p "Entrez votre choix: " choice
        handle_choice_mainMenu "$choice"
    done
}

run_footprintMenu() {
    while true; do
        show_footprintMenu
        read -p "Entrez votre choix: " choice
        handle_choice_footprintMenu "$choice"
        # Capture le code de retour de la fonction
        if [ $? -eq 255 ]; then # -1 est représenté comme 255 en Bash
            break
        fi
    done
}

run_scanningNetworksMenu() {
    while true; do
        show_scanningNetworksMenu
        read -p "Entrez votre choix: " choice
        handle_choice_scanningNetworksMenu "$choice"
        # Capture le code de retour de la fonction
        if [ $? -eq 255 ]; then # -1 est représenté comme 255 en Bash
            break
        fi
    done
}




run_EnumerationMenu() {
    while true; do
        show_EnumerationMenu
        read -p "Entrez votre choix: " choice
        handle_choice_EnumerationMenu "$choice"
        # Capture le code de retour de la fonction
        if [ $? -eq 255 ]; then # -1 est représenté comme 255 en Bash
            break
        fi
    done
}


run_GainingAccessMenu() {
    while true; do
        show_GainingAccessMenu
        read -p "Entrez votre choix: " choice
        handle_choice_GainingAccessMenu "$choice"
        # Capture le code de retour de la fonction
        if [ $? -eq 255 ]; then # -1 est représenté comme 255 en Bash
            break
        fi
    done
}

run_AutomatisationMenu() {
    while true; do
        show_AutomatisationMenu
        read -p "Entrez votre choix: " choice
        handle_choice_AutomatisationMenu "$choice"
        # Capture le code de retour de la fonction
        if [ $? -eq 255 ]; then # -1 est représenté comme 255 en Bash
            break
        fi
    done
}

# Boucle principale
run_mainMenu