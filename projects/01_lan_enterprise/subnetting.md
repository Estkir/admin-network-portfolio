# Subnetting

## Objectif
Découper le réseau `192.168.10.0/24` en 4 sous-réseaux égaux et documenter la méthode utilisée.

---

## Étape 1 — Analyse du besoin
- Réseau initial : /24 → 256 adresses
- Besoin : 4 sous-réseaux → 2 bits supplémentaires (`2² = 4`)
- Nouveau masque : `/26` → `255.255.255.192`

---

## Étape 2 — Taille des sous-réseaux
- Un /26 contient 64 adresses
- Incrément dans le dernier octet : 64

---

## Étape 3 — Résultat

| Sous-réseau | Adresse réseau | Broadcast | Plage d’hôtes utilisables |
|------------|----------------|-----------|---------------------------|
| SR1 | 192.168.10.0/26 | 192.168.10.63 | 192.168.10.1 – 192.168.10.62 |
| SR2 | 192.168.10.64/26 | 192.168.10.127 | 192.168.10.65 – 192.168.10.126 |
| SR3 | 192.168.10.128/26 | 192.168.10.191 | 192.168.10.129 – 192.168.10.190 |
| SR4 | 192.168.10.192/26 | 192.168.10.255 | 192.168.10.193 – 192.168.10.254 |

---

## Méthode générale utilisée
1. Identifier le nombre de sous-réseaux requis
2. Ajouter les bits nécessaires au masque CIDR
3. Calculer la taille des blocs (`2^(32 - masque)`)
4. Appliquer l’incrément pour trouver réseaux et broadcasts
5. Vérifier les plages d’hôtes

---

## Validation
- Chaque sous-réseau dispose de 62 hôtes utilisables
- Aucun chevauchement
- L’ensemble couvre entièrement le /24 initial

---

## Conclusion
Ce découpage est adapté à une PME segmentée en 4 zones réseau distinctes, avec une gestion claire des adresses IP et une évolutivité raisonnable.
