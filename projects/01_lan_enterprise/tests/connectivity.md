# Connectivity Tests

Ce document décrit tous les tests de connectivité pour le projet VLAN avec DHCP et DNS interne.

---

## VLAN10 — PC1

- **DHCP** : IP attribuée via VyOS → 192.168.10.100  
- **Passerelle** : 192.168.10.1  
- **DNS interne** : entreprise.local → résout srv1 et pc1  

**Tests réalisés :**

| Test                          | Commande          | Résultat attendu | Résultat obtenu |
|--------------------------------|-----------------|-----------------|----------------|
| Obtenir une IP via DHCP        | dhcp             | 192.168.10.100  | OK             |
| Ping passerelle VyOS           | ping 192.168.10.1| Réponse         | OK             |
| Résolution DNS interne         | ping srv1.entreprise.local | Réponse 192.168.10.50 | OK |
| Résolution DNS interne         | ping pc1.entreprise.local  | Réponse 192.168.10.100 | OK |

---

## VLAN20 — PC2

- **DHCP** : IP attribuée via VyOS → 192.168.20.100  
- **Passerelle** : 192.168.20.1  
- **DNS interne** : entreprise.local → résout pc2  

**Tests réalisés :**

| Test                          | Commande          | Résultat attendu | Résultat obtenu |
|--------------------------------|-----------------|-----------------|----------------|
| Obtenir une IP via DHCP        | dhcp             | 192.168.20.100  | OK             |
| Ping passerelle VyOS           | ping 192.168.20.1| Réponse         | OK             |
| Résolution DNS interne         | ping pc2.entreprise.local | Réponse 192.168.20.100 | OK |

---

## VLAN30 — PC3

- **DHCP** : IP attribuée via VyOS → 192.168.30.100  
- **Passerelle** : 192.168.30.1  
- **DNS interne** : entreprise.local → résout pc3  

**Tests réalisés :**

| Test                          | Commande          | Résultat attendu | Résultat obtenu |
|--------------------------------|-----------------|-----------------|----------------|
| Obtenir une IP via DHCP        | dhcp             | 192.168.30.100  | OK             |
| Ping passerelle VyOS           | ping 192.168.30.1| Réponse         | OK             |
| Résolution DNS interne         | ping pc3.entreprise.local | Réponse 192.168.30.100 | OK |

---

## Observations générales

- Les trois VLANs sont isolés et communiquent uniquement avec leur passerelle respective.  
- Le DHCP fonctionne correctement pour chaque VLAN et attribue les adresses dans la plage définie.  
- Le DNS interne résout correctement les noms des machines et du serveur interne.  
- La configuration du switch Arista (VLAN + trunk) permet de transporter les VLANs vers VyOS sans perte de connectivité.  

---

## Conclusion

La topologie VLAN sur GNS3 est opérationnelle avec :

1. DHCP distribuant les IPs automatiquement  
2. DNS interne résolvant les noms des machines  
3. Passerelle VyOS fonctionnelle pour chaque VLAN  

Cette documentation peut être jointe à un dépôt GitHub pour démontrer la compétence réseau et la mise en œuvre d’une infrastructure segmentée.
