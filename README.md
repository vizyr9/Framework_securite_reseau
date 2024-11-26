# Notes sécurité des réseaux


# Pour voir son ip: 
``$sudo ifconfig``

# Pour scanner les appareils actifs sur le réseau:
``$sudo fping -s -g ip_deb ip_fin --alive -q``

# Pour scanner un appareil:
``$sudo nmap -sS ip_appareil``

# Pour scanner les différents services d'un appareil

## Telnet

``$telnet <ip_addr> <port>``\
puis hit Esc et Enter
-> affiche la banniere

## netcat (nc)
``$nc <ip_addr> <port>``\
``$GET /index.html``

## nmap (best)
``$nmap -sV -script=banner <ip_addr>``






