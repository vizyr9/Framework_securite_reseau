#Script d'automatisation des seances de TP en securite des reseaux informatiques en entreprise

#fonctions
function calcul_ip_add ()
{
    ip=$1; mask=$2

    IFS=. read -r i1 i2 i3 i4 <<< "$ip"
    IFS=. read -r m1 m2 m3 m4 <<< "$mask"

    # echo "network:   $((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$((i4 & m4))"
    # echo "broadcast: $((i1 & m1 | 255-m1)).$((i2 & m2 | 255-m2)).$((i3 & m3 | 255-m3)).$((i4 & m4 | 255-m4))"
    IP1="$((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$(((i4 & m4)+1))"
    IP2="$((i1 & m1 | 255-m1)).$((i2 & m2 | 255-m2)).$((i3 & m3 | 255-m3)).$(((i4 & m4 | 255-m4)-1))"
    # echo "$((i1 & m1)).$((i2 & m2)).$((i3 & m3)).$(((i4 & m4)+1))" #first ip
    # echo "$((i1 & m1 | 255-m1)).$((i2 & m2 | 255-m2)).$((i3 & m3 | 255-m3)).$(((i4 & m4 | 255-m4)-1))" #last ip
    echo $IP1 $IP2
}

function search_local_vulnerabilities() {
    local software=$1
    local vulnerability_dir="Vulnerability_database"
    local found=0

    echo "Recherche des vulnérabilités pour : $software"

    # Parcours de tous les fichiers JSON de la base de données
    for json_file in "$vulnerability_dir"/*.json; do
        # Recherche dans le fichier avec jq
        results=$(jq -r --arg software "$software" '
            .CVE_Items[] |
            select(.cve.description.description_data[].value | test($software; "i")) |
            "\(.cve.CVE_data_meta.ID): \(.cve.description.description_data[0].value)"
        ' "$json_file")

        if [[ -n "$results" ]]; then
            echo "Fichier: $(basename "$json_file")"
            echo "$results"
            found=1
        fi
    done

    if [[ $found -eq 0 ]]; then
        echo "Aucune vulnérabilité trouvée pour $software."
    fi
}






#recuperation de l'ip et du masque reseau
IP_USER=$(ifconfig wlp1s0 | grep 'inet ' | cut -d: -f2 | awk '{ print $2}')
SUBNET_MASK=$(ifconfig wlp1s0 | grep 'inet ' | cut -d: -f2 | awk '{ print $4}')

if [[ -z "$IP_USER" || -z "$SUBNET_MASK" ]]; then
    # Si les commandes précédentes échouent (IP_USER ou SUBNET_MASK vide), essayez avec eth0
    IP_USER=$(ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{ print $2}')
    SUBNET_MASK=$(ifconfig eth0 | grep 'inet ' | cut -d: -f2 | awk '{ print $4}')
fi

echo "Adresse IP de l'utilisateur sur le reseau: $IP_USER"
echo "Masque réseau: $SUBNET_MASK"
read -r IP_UP IP_LOW <<< "$(calcul_ip_add $IP_USER $SUBNET_MASK)"
echo "Adresse IP min à scanner: $IP_UP"
echo "Adresse IP max à scanner: $IP_LOW"
echo ""
echo ""

# scan du reseau
NMAP_SCAN=$(sudo fping -s -g $IP_UP $IP_LOW --alive -q)

echo "Adresses IP actives sur le reseau: $NMAP_SCAN"
echo ""
echo ""

# parcours des ip trouvees et scan des ports
declare -A BANNER_RESULTS #pour stocker les resultats des scans


for ip in $NMAP_SCAN; do

    if [[ $ip =~ \.1$ || $ip =~ \.255$ ]]; then
        # echo "Ignore l'adresse IP: $ip (terminant par .1 ou .255)"
        continue
    fi

    echo "Scanne l'adresse IP: $ip"
    # BANNER_SCAN=$(nmap -sV -script=banner $ip) #version avec tout le resultat 
    BANNER_SCAN=$(nmap -sV --script=banner $ip | grep -i "open" | \
              awk '/^[0-9]+\/[a-z]+/ {
                port=$1;
                state=$2;
                service=$3;
                software="";
                version="";
                for (i=4; i<=NF; i++) software = software " " $i;
                print "Port: " port ", Service: " service ", Software:" software
              }')


    # Stockage de la bannière dans le tableau associatif, associée à l'adresse IP
    BANNER_RESULTS[$ip]="$BANNER_SCAN"
done










for ip in "${!BANNER_RESULTS[@]}"; do
    echo ""
    echo ""
    echo "Résultat pour IP $ip :"
    echo "${BANNER_RESULTS[$ip]}"

    # Extraire chaque ligne du résultat et rechercher les vulnérabilités
    while read -r line; do
        software=$(echo "$line" | grep -oP 'Software:.*' | cut -d: -f2 | xargs)
        if [[ -n "$software" ]]; then
            search_local_vulnerabilities "$software"
        else
            echo "Aucun logiciel/service détecté pour $ip."
        fi
    done <<< "${BANNER_RESULTS[$ip]}"
done