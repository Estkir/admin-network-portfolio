# Subnetting

## Objectif
Découper le réseau en 3 sous-réseaux VLAN distincts et documenter la méthode utilisée pour la topologie GNS3.

---

## Étape 1 — Analyse du besoin
- Besoin : 3 VLANs pour isoler les PC :
  - VLAN10 : PC1
  - VLAN20 : PC2
  - VLAN30 : PC3
- Chaque VLAN doit disposer d’un sous-réseau /24 (suffisant pour démonstration et extensible).

---

## Étape 2 — Taille des sous-réseaux
- Un /24 contient 256 adresses
- Plage utilisable pour les hôtes : 192 adresses (192.168.X.1 → 192.168.X.254)
- Gateway VyOS : 192.168.X.1
- DHCP attribue de 192.168.X.100 à 192.168.X.200

---

## Étape 3 — Résultat

| VLAN  | Adresse réseau  | Broadcast     | Plage d’hôtes DHCP       | Passerelle |
|-------|----------------|---------------|--------------------------|------------|
| VLAN10 | 192.168.10.0/24 | 192.168.10.255 | 192.168.10.100 – 192.168.10.200 | 192.168.10.1 |
| VLAN20 | 192.168.20.0/24 | 192.168.20.255 | 192.168.20.100 – 192.168.20.200 | 192.168.20.1 |
| VLAN30 | 192.168.30.0/24 | 192.168.30.255 | 192.168.30.100 – 192.168.30.200 | 192.168.30.1 |

---

## Méthode générale utilisée
1. Identifier le nombre de VLAN requis et leur isolation
2. Choisir un masque adapté (/24) pour chaque VLAN
3. Déterminer la plage IP pour les hôtes (avec buffer pour DHCP)
4. Assigner la passerelle VyOS sur l’adresse `.1`
5. Vérifier les plages et s’assurer qu’il n’y a pas de chevauchement

---

## Validation
- Chaque VLAN dispose de 101 adresses utilisables pour les hôtes
- Aucun chevauchement entre VLANs
- Le réseau est segmenté proprement pour la topologie GNS3

---

## Conclusion
Ce découpage est adapté pour une topologie VLAN de démonstration avec 3 PC, permettant d’illustrer :
- Le routage inter-VLAN via VyOS
- La distribution DHCP par VLAN
- La gestion d’adresses IP propre et évolutive
