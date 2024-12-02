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
    echo "5. Automatisation"
    echo "6.                       Exit"
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

show_GainingAccessMenu() {
    # Efface l'écran et replace le curseur en haut
    tput clear
    tput cup 0 0
    echo "====================================="
    echo "    FRAMEWORK - Gaining Access    "
    echo "====================================="
    echo "1. FTP"
    echo "2. SSH"
    echo "3. Netcat"
    echo "4. "
    echo "5. "
    echo
    echo "6.                          main menu"
    echo
    echo "Choose an option then press ENTER."
}

show_AutomatisationMenu() {
    # Efface l'écran et replace le curseur en haut
    tput clear
    tput cup 0 0
    echo "====================================="
    echo "    FRAMEWORK - Automatisation    "
    echo "====================================="
    echo "1. Lancer script"
    echo "2.                          main menu"
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
            run_GainingAccessMenu
            ;;
        5)
            run_AutomatisationMenu
            ;;
        6)
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

handle_choice_GainingAccessMenu() {
    case $1 in
        1)
            command_FTP
            ;;
        2)
            command_SSH
            ;;
        3)
            command_NetCat
            ;;
        4)
            
            ;;
        5)
            
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

handle_choice_AutomatisationMenu() {
    case $1 in
        1)
            command_Automatisation
            ;;
        2)
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
    echo "hostname est un outil permetant d'obtenir des information sur un appareil."
    echo "Le '-I' permet d'obtenir l'adresse IP de l'appareil."
    echo
    echo "Command ouput: "
    echo -e "${red}$(hostname -I)${white}"
    echo
    echo "Subnet mask:"
    echo "Executed command: '$ ifconfig'"
    echo "L'outil ifconfig permet d'afficher des informations"
    echo "sur les interfaces réseau actives, de configurer leurs "
    echo "adresses IP, de modifier les paramètres de"
    echo "l'interface, de gérer les interfaces réseaux"
    echo "physiques ou virtuelles, et de résoudre certains"
    echo "problèmes de connexion réseau."
    echo
    echo "Ici nous allons extraire uniquement le subnet mask du réseau:"
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
    echo "La commande hostname est utilisée pour afficher" 
    echo "ou définir le nom d'hôte d'un système"
    echo
    echo "Executed command: '$ hostname'"
    echo
    echo "Command ouput: "
    echo -e "${red}$(hostname)${white}"
    echo
    read -p "[ENTER]"
}

command_ping() {
    # Clear the screen and set the cursor position
    tput clear
    tput cup 0 0
    
    # Display the framework header
    echo "================================================"
    echo "    FRAMEWORK - Scanning network - ping    "
    echo "================================================"
    echo
    
    # Introduction to the ping command
    echo "ping:"
    echo "La commande ping permet de tester la connectivité entre"
    echo "votre appareil et un autre hôte sur le réseau."
    echo "Elle envoie des requêtes ICMP à l'adresse spécifiée et"
    echo "attend des réponses pour mesurer la latence et vérifier"
    echo "la connectivité réseau."
    echo
    
    # Prompt for IP address input
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    
    # Display the executed ping command
    echo "Executed command: '$ ping $ip_appareil'"
    echo
    
    # Run the ping command and display its output
    echo "Command output: "
    echo -e "${red}$(ping $ip_appareil)${white}"
    echo
    
    # Wait for user input to continue
    read -p "[ENTER]"
}


command_fping() {
    # Clear the screen and set the cursor position
    tput clear
    tput cup 0 0
    
    # Display the framework header
    echo "================================================"
    echo "    FRAMEWORK - Scanning network - fping    "
    echo "================================================"
    echo
    
    # Introduction to the fping command
    echo "fping:"
    echo "La commande fping est utilisée sur les systèmes Unix/Linux"
    echo "pour envoyer des requêtes ICMP (ping) à plusieurs hôtes simultanément."
    echo "Elle permet de tester la connectivité réseau de manière plus rapide"
    echo "et efficace qu'avec la commande ping traditionnelle."
    echo "En envoyant des requêtes à plusieurs adresses IP en parallèle,"
    echo "fping réduit le temps nécessaire pour tester un grand nombre d'hôtes."
    echo
    
    # Prompt for IP address input
    echo "Rentrer une adresse ip:"
    read -p ">> " IP_ADDR
    
    # Get the netmask using ifconfig and extract the first result
    NETMASK=$(ifconfig | grep -w 'netmask' | head -n 1 | awk '{print $4}')
    
    # Display the IP and netmask
    echo "Private IP: $IP_ADDR"
    echo "Netmask: $NETMASK"
    
    # Split the IP address and netmask into their individual octets
    IFS=. read -r i1 i2 i3 i4 <<< "$IP_ADDR"
    IFS=. read -r m1 m2 m3 m4 <<< "$NETMASK"
    
    # Calculate the network base and broadcast address
    network_base="$((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$((i4 & m4))"
    broadcast="$((i1 | (255 - m1))).$((i2 | (255 - m2))).$((i3 | (255 - m3))).$((i4 | (255 - m4)))"
    
    # Display the network range
    echo "Network range: $network_base - $broadcast"
    
    # Display the executed command for reference
    echo "Executed command: '$ sudo fping -s -g "$network_base" "$broadcast" --alive -q'"
    echo
    
    # Run the fping command and display its output
    echo "Command output: "
    echo -e "${red}$(sudo fping -s -g "$network_base" "$broadcast" --alive -q)${white}"
    echo
    
    # Wait for user input to continue
    read -p "[ENTER]"
}


command_nmap() {
    # Clear the screen and set the cursor position
    tput clear
    tput cup 0 0
    
    # Display the framework header
    echo "================================================"
    echo "    FRAMEWORK - Scanning network - nmap    "
    echo "================================================"
    echo
    
    # Introduction to the nmap command
    echo "nmap:"
    echo "La commande nmap permet de scanner un réseau pour détecter"
    echo "les hôtes actifs et les ports ouverts sur un appareil."
    echo "L'option '-sS' réalise un scan SYN, qui envoie un paquet SYN"
    echo "et attend une réponse sans établir une connexion complète."
    echo "Cela permet de détecter les ports ouverts tout en étant"
    echo "discret, car il ne termine pas le processus de connexion TCP."
    echo
    
    # Prompt for IP address input
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    
    # Display the executed nmap command
    echo "Executed command: '$ sudo nmap -sS $ip_appareil'"
    echo
    
    # Run the nmap command and display its output
    echo "Command output: "
    echo -e "${red}$(sudo nmap -sS $ip_appareil)${white}"
    echo
    
    # Wait for user input to continue
    read -p "[ENTER]"
}


command_traceroute() {
    # Clear the screen and set the cursor position
    tput clear
    tput cup 0 0
    
    # Display the framework header
    echo "================================================"
    echo "    FRAMEWORK - Scanning network - traceroute    "
    echo "================================================"
    echo
    
    # Introduction to the traceroute command
    echo "traceroute:"
    echo "La commande traceroute permet de déterminer le chemin"
    echo "qu'un paquet prend pour atteindre un hôte distant."
    echo "Elle affiche les différents routeurs ou sauts (hops)"
    echo "qu'un paquet traverse entre l'hôte local et la cible."
    echo "Cela permet de diagnostiquer les problèmes de réseau,"
    echo "comme les points de congestion ou les échecs de transmission."
    echo
    
    # Prompt for IP address input
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    
    # Display the executed traceroute command
    echo "Executed command: '$ traceroute $ip_appareil'"
    echo
    
    # Run the traceroute command and display its output
    echo "Command output: "
    echo -e "${red}$(traceroute $ip_appareil)${white}"
    echo
    
    # Wait for user input to continue
    read -p "[ENTER]"
}


command_telnet() {
    # Clear the screen and set the cursor position
    tput clear
    tput cup 0 0
    
    # Display the framework header
    echo "================================================"
    echo "    FRAMEWORK - Enumeration - telnet    "
    echo "================================================"
    echo
    
    # Introduction to the telnet command
    echo "telnet:"
    echo "La commande telnet permet de se connecter à un appareil"
    echo "sur un réseau en utilisant le protocole Telnet."
    echo "Elle permet de se connecter à un port spécifique sur"
    echo "un hôte distant et d'interagir avec les services"
    echo "qui y sont disponibles. Cette commande est souvent utilisée"
    echo "pour tester les connexions à des services comme des serveurs"
    echo "ou des équipements réseau."
    echo
    
    # Prompt for IP address input
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    
    # Prompt for port input
    echo "Entrer un port:"
    read -p ">> " port
    echo
    
    # Display the executed telnet command
    echo "Executing: 'telnet $ip_appareil $port'"
    echo
    
    # Run the telnet command and simulate ESC + ENTER
    echo "Command output: "
    { echo -e "\e"; echo -e "\n"; } | telnet "$ip_appareil" "$port"
    echo
    
    # Wait for user input to continue
    read -p "[ENTER]"
}


command_nc() {
    # Clear the screen and set the cursor position
    tput clear
    tput cup 0 0
    
    # Display the framework header
    echo "================================================"
    echo "    FRAMEWORK - Enumeration - Netcat    "
    echo "================================================"
    echo
    
    # Introduction to the netcat command
    echo "Netcat:"
    echo "La commande netcat (nc) est un outil de réseau puissant,"
    echo "utilisé pour lire ou écrire sur des connexions réseau"
    echo "via le protocole TCP ou UDP. Elle permet de tester"
    echo "la connectivité entre un appareil local et un hôte distant"
    echo "en se connectant à un port spécifique."
    echo "Netcat peut aussi être utilisé pour ouvrir des ports,"
    echo "scanner des hôtes, ou encore pour des transferts de données."
    echo
    
    # Prompt for IP address input
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    
    # Prompt for port input
    echo "Entrer un port:"
    read -p ">> " port
    echo
    
    # Display the executed netcat command
    echo "Executing: 'nc $ip_appareil $port'"
    echo
    
    # Run the netcat command and display its output
    echo "Command output: "
    echo -e "${red}$(nc $ip_appareil $port)${white}"
    echo
    
    # Wait for user input to continue
    read -p "[ENTER]"
}


command_Onmap() {
    # Clear the screen and set the cursor position
    tput clear
    tput cup 0 0
    
    # Display the framework header
    echo "================================================================="
    echo "    FRAMEWORK - Enumeration - Operating system detection nmap    "
    echo "================================================================="
    echo
    
    # Introduction to the nmap OS detection command
    echo "Operating system detection nmap:"
    echo "La commande nmap avec l'option '-O' permet de détecter"
    echo "le système d'exploitation d'un hôte distant en analysant"
    echo "les réponses aux paquets envoyés par nmap. Cette méthode"
    echo "est appelée 'fingerprinting' et utilise des signatures"
    echo "caractéristiques des systèmes d'exploitation."
    echo
    echo "L'option '-oG' génère un rapport de type grepable pour"
    echo "faciliter l'analyse des résultats."
    echo
    
    # Prompt for IP address input
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    echo
    
    # Display the executed nmap command
    echo "Executing: 'sudo nmap -O $ip_appareil -oG -'"
    echo
    
    # Run the nmap OS detection command and display its output
    echo "Command output: "
    echo -e "${red}$(sudo nmap -O $ip_appareil -oG -)${white}"
    echo
    
    # Wait for user input to continue
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

command_FTP() {
    # Efface l'écran
    tput clear
    tput cup 0 0
    
    # Affichage de l'en-tête
    echo "======================================================================="
    echo "    FRAMEWORK - Gaining Access - FTP   "
    echo "======================================================================="
    echo
    echo "FTP:"
    
    # Demande la liste des mots de passe
    echo "Entrer une liste de mots de passe (chemin du fichier ou 'nouveau' pour créer) :"
    read -p ">> " password_list
    if [[ "$password_list" == "nouveau" ]]; then
        echo "Entrez les mots de passe, un par ligne. Tapez 'FIN' pour terminer :"
        password_list="mdp.txt"
        > "$password_list" # Vide/crée le fichier
        while true; do
            read -p "> " password
            [[ "$password" == "FIN" ]] && break
            echo "$password" >> "$password_list"
        done
        echo "Fichier de mots de passe créé : $password_list"
    fi

    # Demande la liste des utilisateurs
    echo "Entrer une liste d'utilisateurs (chemin du fichier ou 'nouveau' pour créer) :"
    read -p ">> " user_list
    if [[ "$user_list" == "nouveau" ]]; then
        echo "Entrez les noms d'utilisateur, un par ligne. Tapez 'FIN' pour terminer :"
        user_list="users.txt"
        > "$user_list" # Vide/crée le fichier
        while true; do
            read -p "> " user
            [[ "$user" == "FIN" ]] && break
            echo "$user" >> "$user_list"
        done
        echo "Fichier d'utilisateurs créé : $user_list"
    fi
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    # Exécution de la commande
    echo
    echo "Executing: 'hydra -L /usernames.txt -P /passwords.txt $ip_appareil ftp -V'"
    echo
    echo "Command output: "
    echo -e "${red}$(hydra -L /usernames.txt -P /passwords.txt $ip_appareil ftp -V)${white}"
    # Pause avant de quitter
    echo
    read -p "[ENTRÉE]"
}

command_SSH() {
    # Efface l'écran
    tput clear
    tput cup 0 0
    
    # Affichage de l'en-tête
    echo "======================================================================="
    echo "    FRAMEWORK - Gaining Access - SSH   "
    echo "======================================================================="
    echo
    echo "SSH:"
    
    # Demande la liste des mots de passe
    echo "Entrer une liste de mots de passe (chemin du fichier ou 'nouveau' pour créer) :"
    read -p ">> " password_list
    if [[ "$password_list" == "nouveau" ]]; then
        echo "Entrez les mots de passe, un par ligne. Tapez 'FIN' pour terminer :"
        password_list="mdp.txt"
        > "$password_list" # Vide/crée le fichier
        while true; do
            read -p "> " password
            [[ "$password" == "FIN" ]] && break
            echo "$password" >> "$password_list"
        done
        echo "Fichier de mots de passe créé : $password_list"
    fi

    # Demande la liste des utilisateurs
    echo "Entrer une liste d'utilisateurs (chemin du fichier ou 'nouveau' pour créer) :"
    read -p ">> " user_list
    if [[ "$user_list" == "nouveau" ]]; then
        echo "Entrez les noms d'utilisateur, un par ligne. Tapez 'FIN' pour terminer :"
        user_list="users.txt"
        > "$user_list" # Vide/crée le fichier
        while true; do
            read -p "> " user
            [[ "$user" == "FIN" ]] && break
            echo "$user" >> "$user_list"
        done
        echo "Fichier d'utilisateurs créé : $user_list"
    fi
    echo "Entrer une adresse IP:"
    read -p ">> " ip_appareil
    # Exécution de la commande
    echo
    echo "Executing: 'hydra -L usernames.txt -P passwords.txt $ip_appareil ssh -V'"
    echo
    echo "Command output: "
    echo -e "${red}$(hydra -L usernames.txt -P passwords.txt $ip_appareil ssh -V)${white}"
    # Pause avant de quitter
    echo
    read -p "[ENTRÉE]"
}

command_NetCat() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Gaining Access - Netcat    "
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

command_NetCat() {
    tput clear
    tput cup 0 0
    echo "================================================"
    echo "    FRAMEWORK - Gaining Access - Netcat    "
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

command_Automatisation() {
    tput clear
    tput cup 0 0
    echo "====================================="
    echo "    FRAMEWORK - Automatisation    "
    echo "====================================="
    echo
    echo "Automatisation:"
    echo "Command output: "
    echo -e "${red}$(./script.sh)${white}"
    echo
    read -p "[ENTER]"
}

run_mainMenu() {
    while true; do
        show_mainMenu
        read -p "Entrez votre choix [1-6]: " choice
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

run_GainingAccessMenu() {
    while true; do
        show_GainingAccessMenu
        read -p "Entrez votre choix [1-5]: " choice
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
        read -p "Entrez votre choix [1-6]: " choice
        handle_choice_AutomatisationMenu "$choice"
        # Capture le code de retour de la fonction
        if [ $? -eq 255 ]; then # -1 est représenté comme 255 en Bash
            break
        fi
    done
}

# Boucle principale
run_mainMenu