# Phase 1 — LAN Simple

## Objectif
Construire un LAN simple avec :
- 2 PC VPCS
- 1 Switch
- 1 Routeur VyOS

## Topologie
PC1 ─┐
     ├── Switch ─── VyOS (eth0 192.168.10.1)
PC2 ─┘

## Tests réalisés
- Ping PC1 → PC2 : OK
- Ping PC1 → VyOS : OK
- Ping PC2 → VyOS : OK
- Capture ARP + ICMP sous Wireshark

## Résultat
LAN fonctionnel. Les deux PC communiquent entre eux et avec VyOS.
