# Projet 01 — Réseau LAN PME Multi-VLAN

## 🎯 Objectif
Concevoir et déployer un réseau interne pour une PME de 50 utilisateurs avec segmentation réseau,
DHCP centralisé et résolution DNS interne.

## 🏗️ Architecture

- 3 VLANs :
  - VLAN 10 — Utilisateurs
  - VLAN 20 — Administration
  - VLAN 30 — Serveurs
- Routage inter-VLAN via routeur
- Serveur DHCP/DNS centralisé

(Diagramme GNS3 à insérer dans /diagrams/topology.png)

## 🔧 Technologies
- GNS3
- Switch L2
- Routeur VyOS
- isc-dhcp-server
- bind9 / dnsmasq

## ⚙️ Implémentation

### 1️⃣ VLAN & switching
- Création VLANs 10, 20, 30
- Ports access affectés par VLAN
- Lien trunk vers le routeur

### 2️⃣ Routage inter-VLAN
- Sous-interfaces :
  - eth0.10 → 192.168.10.1/24
  - eth0.20 → 192.168.20.1/24
  - eth0.30 → 192.168.30.1/24

### 3️⃣ DHCP
- 3 scopes DHCP
- DHCP relay sur le routeur

### 4️⃣ DNS
- Domaine interne : entreprise.local
- Enregistrements : srv1, pc1, pc2

## ✅ Tests

| Test | Résultat |
|------|----------|
| Ping intra-VLAN | OK |
| Ping inter-VLAN | OK |
| DHCP automatique | OK |
| Résolution DNS | OK |

## 🧪 Incidents simulés

- VLAN trunk mal configuré → trafic inter-VLAN cassé
- DHCP relay absent → pas d’attribution IP

Voir dossiers /incidents/

## 🔐 Sécurité
- Segmentation par VLAN
- Pas de communication Users → Admin par défaut

## 📌 Apprentissages
- Importance du tagging VLAN
- Diagnostic rapide via tables ARP et routage
- Méthodologie OSI pour le dépannage

