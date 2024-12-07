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
            exit 0
            ;;
        *)
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
        5)
            return -1 # Retourne -1 à l'appelant
            ;;
        *)
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
            return -1
            ;;
        *)
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
            return -1 # Retourne -1 à l'appelant
            ;;
        *)
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
            metasploit_vsftpd_exploit
            ;;
        5)
            attaque_ssh_metasploit
            ;;
        6)
            samba_usermap_exploit
            ;;
        7)
            java_rmi_exploit
            ;;
            
        8)
            return -1 # Retourne -1 à l'appelant
            ;;
        *)
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
            return -1 # Retourne -1 à l'appelant
            ;;
        *)
            ;;
    esac
    return 0 # Retourne 0 par défaut si aucune condition spécifique n'est remplie
}
