# Phase1 – LAN S1 avec VyOS

## LAN1
PC1: 192.168.10.10/24, GW 192.168.10.1
PC2: 192.168.10.11/24, GW 192.168.10.1

## LAN2
PC3: 192.168.20.10/24, GW 192.168.20.1
PC4: 192.168.20.11/24, GW 192.168.20.1

## VyOS
eth0: 192.168.10.1/24  # LAN1
eth3: 192.168.20.1/24  # LAN2

# Routage inter-LAN
# Les deux sous-réseaux communiquent automatiquement via VyOS
