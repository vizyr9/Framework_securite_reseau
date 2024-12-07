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
    echo "6. Exit"
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
    echo "5. Main menu"
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
    echo "5. main menu"
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
    echo "6. main menu"
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
    echo "4. Metasploit-vsftpd"
    echo "5. Metasploit-ssh"
    echo "6. Metasploit-samba"
    echo "7. Metasploit-java-rmi"
    echo "8. main menu"
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
    echo "2. main menu"
    echo
    echo "Choose an option then press ENTER."
}
