# VyOS Router — Phase1

## Configuration LAN

configure
set interfaces ethernet eth0 address 192.168.10.1/24
commit
save
exit

# VyOS
eth0: 192.168.10.1/24
eth3: 192.168.20.1/24
# Routage inter-LAN automatique

## Remarques
- eth0 connectée au switch
- Passezelle pour les PC : 192.168.10.1
- Ping vers PC1 et PC2 fonctionnel
