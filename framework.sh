#!/bin/bash

#codes couleur pour l'affichage. Mettre un 1 avant le point virgule met en gras le texte
red='\033[1;31m'
white='\033[0;37m'



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
    echo
    echo "5.                       Exit"
    echo
    echo "Choose an option then press ENTER."
}

show_footprintMenu() {
    # Efface l'écran et replace le curseur en haut
    tput clear
    tput cup 0 0
    echo "============================="
    echo "    FRAMEWORK - Footprint    "
    echo "============================="
    echo "1. IP Addresses"
    echo "2. whois"
    echo "3. hostname"
    echo
    echo "4.                  Main menu"
    echo
    echo "Choose an option then press ENTER."
}



show_scanningNetworksMenu() {
    # Efface l'écran et replace le curseur en haut
    tput clear
    tput cup 0 0
    echo "====================================="
    echo "    FRAMEWORK - Scanning networks    "
    echo "====================================="
    echo "1. ping"
    echo "2. fping"
    echo "3. nmap"
    echo "4. traceroute"
    echo
    echo "5.                          main menu"
    echo
    echo "Choose an option then press ENTER."
}

show_EnumerationMenu() {
    # Efface l'écran et replace le curseur en haut
    tput clear
    tput cup 0 0
    echo "====================================="
    echo "    FRAMEWORK - Enumeration    "
    echo "====================================="
    echo "1. telnet"
    echo "2. nc"
    echo "3. operating system detection nmap"
    echo "4. banner grabing avec nmap"
    echo "5. Enumerating user accounts through Nmap"
    echo
    echo "6.                          main menu"
    echo
    echo "Choose an option then press ENTER."
}

# Fonction pour exécuter les choix
handle_choice_mainMenu() {
    tput clear
    case $1 in
        1)
            run_footprintMenu
            ;;
        2)
            run_scanningNetworksMenu
            ;;
        3)
            run_EnumerationMenu
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
            command_ipaddress
            ;;
        2)
            command_whois
            ;;
        3)
            command_hostname
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

handle_choice_scanningNetworksMenu() {
    case $1 in
        1)
            command_ping
            ;;
        2)
            command_fping
            ;;
        3)
            command_nmap
            ;;
        4)
            command_traceroute
            ;;
        5)
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

handle_choice_EnumerationMenu() {
    case $1 in
        1)
            command_telnet
            ;;
        2)
            command_nc
            ;;
        3)
            command_Onmap
            ;;
        4)
            command_BSnmap
            ;;
        5)
            command_ennum_nmap
            ;;
        6)
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


command_ipaddress() {
    tput clear
    tput cup 0 0
    echo "=================================================="
    echo "    FRAMEWORK - Foot print - IP address    "
    echo "=================================================="
    echo
    echo "IP Address:"
    echo "Executed command: '$ hostname -I'"
    echo "Command ouput: "
    echo -e "${red}$(hostname -I)${white}"
    echo
    echo "Subnet mask:"
    echo "Executed command: '$ ifconfig'"
    echo "Extract of the command ouput: "
    echo -e "${red}$(ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{ print $4}')${white}"
    echo
    read -p "[ENTER]"
}


command_whois() {
    tput clear
    tput cup 0 0
    echo "============================================="
    echo "    FRAMEWORK - Foot print - whois    "
    echo "============================================="
    echo
    echo "whois:"
    read -p "Input domain name: " domainName
    echo "Executed command: '$ whois $domainName'"
    echo
    echo "Command ouput: "
    echo -e "${red}$(whois $domainName)${white}"
    echo
    read -p "[ENTER]"
}

command_hostname() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Foot print - hostname    "
    echo "================================================"
    echo
    echo "hostname:"
    echo "Executed command: '$ hostname'"
    echo
    echo "Command ouput: "
    echo -e "${red}$(hostname)${white}"
    echo
    read -p "[ENTER]"
}

command_ping() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Scanning network - ping    "
    echo "================================================"
    echo
    echo "ping:"
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    echo "Executed command: '$ ping $ip_appareil'"
    echo
    echo "Command output: "
    echo -e "${red}$(ping $ip_appareil)${white}"
    echo
    read -p "[ENTER]"
}

command_fping() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Scanning network - fping    "
    echo "================================================"
    echo
    echo "fping:"
    IP_ADDR=$(hostname -I | awk '{print $1}')
    NETMASK=$(ifconfig | grep -w 'netmask' | head -n 1 | awk '{print $4}')
    echo "Private IP: $IP_ADDR"
    echo "Netmask: $NETMASK"
    IFS=. read -r i1 i2 i3 i4 <<< "$IP_ADDR"
    IFS=. read -r m1 m2 m3 m4 <<< "$NETMASK"
    network_base="$((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$((i4 & m4))"
    broadcast="$((i1 | (255 - m1))).$((i2 | (255 - m2))).$((i3 | (255 - m3))).$((i4 | (255 - m4)))"
    echo "Network range: $network_base - $broadcast"
    echo "Executed command: '$ sudo fping -s -g "$network_base" "$broadcast" --alive -q"
    echo
    echo "Command ouput: "
    echo -e "${red}$(sudo fping -s -g "$network_base" "$broadcast" --alive -q)${white}"
    echo
    read -p "[ENTER]"
}

command_nmap() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Scanning network - nmap    "
    echo "================================================"
    echo
    echo "nmap:"
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    echo "Executed command: '$ sudo nmap -sS $ip_appareil'"
    echo
    echo "Command output: "
    echo -e "${red}$(sudo nmap -sS $ip_appareil)${white}"
    echo
    read -p "[ENTER]"
}

command_traceroute() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Scanning network - traceroute    "
    echo "================================================"
    echo
    echo "traceroute:"
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    echo "Executed command: '$ traceroute $ip_appareil'"
    echo
    echo "Command output: "
    echo -e "${red}$(traceroute $ip_appareil)${white}"
    echo
    read -p "[ENTER]"
}

command_telnet() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Enumeration - telnet    "
    echo "================================================"
    echo
    echo "telnet:"
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    echo "Entrer un port:"
    read -p ">> " port
    echo
    echo "Executing: 'telnet $ip_appareil $port'"
    echo
    echo "Command output: "
    # Exécution de la commande telnet et simulation des touches ESC + ENTER
    { echo -e "\e"; echo -e "\n"; } | telnet "$ip_appareil" "$port"
    echo
    read -p "[ENTER]"
}

command_nc() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Enumeration - Netcat    "
    echo "================================================"
    echo
    echo "Netcat:"
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    echo "Entrer un port:"
    read -p ">> " port
    echo
    echo "Executing: 'nc $ip_appareil $port'"
    echo
    echo "Command output: "
    echo -e "${red}$(nc $ip_appareil $port)${white}"
    echo
    read -p "[ENTER]"
}

command_Onmap() {
    tput clear
    tput cup 0 0
    echo "================================================================="
    echo "    FRAMEWORK - Enumeration - Operating system detection nmap    "
    echo "================================================================="
    echo
    echo "Operating system detection nmap:"
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    echo "Executing: 'sudo nmap -O $ip_appareil -oG -'"
    echo
    echo "Command output: "
    echo -e "${red}$(sudo nmap -O $ip_appareil -oG -)${white}"
    echo
    read -p "[ENTER]"
}

command_BSnmap() {
    tput clear
    tput cup 0 0
    echo "================================================================="
    echo "    FRAMEWORK - Enumeration - Banner Grabing avec nmap    "
    echo "================================================================="
    echo
    echo "Operating system detection nmap:"
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    echo "Executing: 'sudo nmap -sV -script=banner $ip_appareil'"
    echo
    echo "Command output: "
    echo -e "${red}$(sudo nmap -sV -script=banner $ip_appareil)${white}"
    echo
    read -p "[ENTER]"
}

command_ennum_nmap() {
    tput clear
    tput cup 0 0
    echo "======================================================================="
    echo "    FRAMEWORK - Enumeration - Enumerating user accounts through Nmap   "
    echo "======================================================================="
    echo
    echo "Enumerating user accounts through Nmap:"
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    echo "Entrer un port:" #généralement 445
    read -p ">> " port
    echo "Executing: 'sudo nmap –script smb-enum-users.nse –p $port $ip_appareil'" #445 est un port par defaut
    echo
    echo "Command output: "
    echo -e "${red}$(sudo nmap --script smb-enum-users.nse -p $port $ip_appareil)${white}"
    echo
    read -p "[ENTER]"
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

run_scanningNetworksMenu() {
    while true; do
        show_scanningNetworksMenu
        read -p "Entrez votre choix [1-5]: " choice
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
        read -p "Entrez votre choix [1-5]: " choice
        handle_choice_EnumerationMenu "$choice"
        # Capture le code de retour de la fonction
        if [ $? -eq 255 ]; then # -1 est représenté comme 255 en Bash
            break
        fi
    done
}

# Boucle principale
run_mainMenu