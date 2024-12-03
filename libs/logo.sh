#!/bin/bash


show_logo() {
    # Définir les couleurs
    RED='\033[0;31m'
    GREEN='\033[0;32m'
    YELLOW='\033[0;33m'
    CYAN='\033[0;36m'
    RESET='\033[0m'

    tput clear
    tput cup 0 0
    # Affichage du PC, serveur et routeur
    echo -e "$CYAN       _______        $GREEN       _______        $YELLOW       _______       "
    echo -e "$CYAN      |       |       $GREEN      |       |       $YELLOW      |       |   \ \   "
    echo -e "$CYAN      |  PC   |       $GREEN      | SERVER|       $YELLOW      | ROUTER|  ) | |   "
    echo -e "$CYAN      |_______|       $GREEN      |_______|       $YELLOW      |_______|   / / "

    # Affichage des barres verticales et de la ligne du bas
    echo -e "$RESET          █                     █                     █        "
    echo -e "$RESET  )=======+=====================+=====================+       "
    #!/bin/bash

    # Définir la couleur "orange" simulée
    ORANGE='\033[38;5;214m'  # Couleur orange approximative
    RESET='\033[0m'

    # Affichage du texte en orange
    echo ""
    #!/bin/bash

    # Définir la couleur "orange" simulée
    ORANGE='\033[38;5;214m'  # Couleur orange approximative
    RESET='\033[0m'

    # Définir le texte
    TEXT="PENTESTING    FRAMEWORK"
    WIDTH=${#TEXT}  # Largeur du texte

    # Affichage du cadre plein avec le caractère █ autour du texte
    echo -e "${ORANGE}/███████████████████████████████████████████████████████████████████\\"
    echo -e "█                                                                   █"
    echo -e "█                     PENTESTING    FRAMEWORK                       █"
    echo -e "█                                                                   █"
    echo -e "\███████████████████████████████████████████████████████████████████/${RESET}"
    echo ""
}