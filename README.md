# README du framework securite des reseaux informatiques

## TODO
- Commenter le WHOIS
- uniformiser les commentaires de chaque fonction

## Manuel d'utilisation

### Exécution du script
Pour lancer l'outil il suffit d'exécuter la commande\
``$ bash ./framework.sh``

Le framework fonctionne avec des sous menus. Pour choisir l'option voulue, il suffit de saisir le chiffre dans le terminal.

- Mettre le dossier "Vulnerability database" au même niveau que le fichier script.sh

### Débug d'installation

Il est possible qu'un problème d'encodage soit présent lors d'une exécution sur WSL (Windows). Pour le régler, il suffit d'utiliser la commande ``$ dos2unix framework.sh``. 

### Commandes implémentées

#### Footprint

- ip address
- whois
- hostname

#### Scanning networks

- ping
- fping
- nmap
- traceroute


#### Enumeration

- telnet
- netcat
- nmap (operating system detection)
- nmap (banner grabing)
- nmap (user accounts enumeration)

#### Gaining access

- FTP
- SSH
- Netcat

#### Automatisation

- Script d'automatisation