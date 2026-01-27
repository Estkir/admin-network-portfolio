# Lab Report – Phase 2 : VLANs avec VyOS et Debian switch

## 1. Objectif
Mettre en place deux VLANs séparés sur un switch Debian, avec VyOS comme routeur trunk, et des PCs assignés à chaque VLAN.  
Vérifier :
- Le routage inter-VLAN depuis VyOS
- L’isolation entre VLANs
- La connectivité interne VLAN

---

## 2. Matériel / Logiciel
- GNS3
- VyOS (routeur)
- Debian Qemu (switch VLAN-aware)
- VPCS (PC1 à PC4)

## 3. Configuration

### 3.1 Debian switch (bridge + VLANs)

```bash
# Création bridge VLAN-aware
ip link add br0 type bridge vlan_filtering 1
ip link set br0 up

# Ajouter les interfaces au bridge
ip link set ens3 master br0
ip link set ens4 master br0
ip link set ens5 master br0
ip link set ens6 master br0
ip link set ens7 master br0

# Activer interfaces
ip link set ens3 up
ip link set ens4 up
ip link set ens5 up
ip link set ens6 up
ip link set ens7 up

# Configurer VLANs
bridge vlan add dev ens3 vid 10
bridge vlan add dev ens3 vid 20

bridge vlan add dev ens4 vid 10 pvid untagged
bridge vlan add dev ens5 vid 10 pvid untagged
bridge vlan add dev ens6 vid 20 pvid untagged
bridge vlan add dev ens7 vid 20 pvid untagged
