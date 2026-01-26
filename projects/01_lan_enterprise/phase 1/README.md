# Phase1 – LAN S1 VyOS Lab

## Objectif
- Créer un LAN simple avec VyOS et VPCS
- Ajouter un second sous-réseau (LAN2)
- Tester routage inter-LAN
- Capturer le trafic ICMP avec Wireshark

## Topologie
LAN1 (192.168.10.0/24) : PC1, PC2 → Switch1 → VyOS eth0
LAN2 (192.168.20.0/24) : PC3, PC4 → Switch2 → VyOS eth3

## Instructions
1. Ouvrir topology.gns3 dans GNS3
2. Démarrer VyOS et les PC
3. Configurer VyOS :

```bash
configure
set interfaces ethernet eth0 address 192.168.10.1/24
set interfaces ethernet eth3 address 192.168.20.1/24
commit
save
exit
