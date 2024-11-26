#!/bin/bash

# Fonction pour afficher le menu principal
show_mainMenu() {
    # Efface l'écran et replace le curseur en haut
    tput clear
    tput cup 0 0
    echo "============================="
    echo "    FRAMEWORK - MAIN MENU    "
    echo "============================="
    echo "1. Footprint"
    echo "2. Scanning networks"
    echo "3. Enumeration"
    echo "4. Gaining access"
    echo "5. Exit"
    echo
    echo "Choose an option then press ENTER."
}

show_footprintMenu() {
    # Efface l'écran et replace le curseur en haut
    tput clear
    tput cup 0 0
    echo "============================="
    echo "    FRAMEWORK - FOOTPRINT    "
    echo "============================="
    echo "1. IP Addresses"
    echo "2. whois"
    echo "3. hostname"
    echo "4. Main menu"
    echo
    echo "Choose an option then press ENTER."
}

# Fonction pour exécuter les choix
handle_choice_mainMenu() {
    tput clear
    case $1 in
        1)
            tput cup 0 0
            echo "Vous avez choisi l'Option 1."
            run_footprintMenu
            ;;
        2)
            tput cup 0 0
            echo "Vous avez choisi l'Option 2."
            ;;
        3)
            tput cup 0 0
            echo "Vous avez choisi l'Option 3."
            ;;
        4)
            tput cup 0 0
            echo "Vous avez choisi l'Option 4."
            ;;
        5)
            tput cup 0 0
            echo "Au revoir!"
            exit 0
            ;;
        *)
            tput cup 0 0
            echo "Choix invalide. Veuillez réessayer."
            ;;
    esac
}

handle_choice_footprintMenu() {
    case $1 in
        1)
            tput cup 0 0
            echo "Vous avez choisi l'Option footprint 1."
            ;;
        2)
            tput cup 0 0
            echo "Vous avez choisi l'Option footprint 2."
            ;;
        3)
            tput cup 0 0
            echo "Vous avez choisi l'Option footprint 3."
            ;;
        4)
            tput cup 0 0
            echo "Retour au main menu."
            return -1 # Retourne -1 à l'appelant
            ;;
        *)
            tput cup 0 0
            echo "Choix invalide. Veuillez réessayer."
            ;;
    esac
    return 0 # Retourne 0 par défaut si aucune condition spécifique n'est remplie
}

run_mainMenu() {
    while true; do
        show_mainMenu
        read -p "Entrez votre choix [1-5]: " choice
        handle_choice_mainMenu "$choice"
    done
}

run_footprintMenu() {
    while true; do
        show_footprintMenu
        read -p "Entrez votre choix [1-4]: " choice
        handle_choice_footprintMenu "$choice"
        # Capture le code de retour de la fonction
        if [ $? -eq 255 ]; then # -1 est représenté comme 255 en Bash
            break
        fi
    done
}

# Boucle principale
run_mainMenu
