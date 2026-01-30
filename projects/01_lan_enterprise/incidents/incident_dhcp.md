# Incident 2 — DHCP relay absent

🚨 **Symptôme**  
Les machines d’un VLAN ne reçoivent plus d’adresses IP via DHCP.  
- PC2 (VLAN20) et PC3 (VLAN30) restent avec une IP APIPA (169.254.x.x) ou aucune IP.  
- Les PCs ne peuvent plus joindre la passerelle ni communiquer avec le serveur interne.

---

🔍 **Diagnostic**  
- Ping vers la passerelle VyOS KO pour VLAN affecté  
- Vérification VLAN sur switch → port access correct  
- Vérification subinterface VyOS → VLAN configuré  
- Vérification du DHCP → serveur actif sur VyOS mais aucun bail distribué  
- Observation : pas de relay ou relay mal configuré pour le VLAN → le DHCP broadcast du VLAN ne parvient pas au serveur.

---

🛠️ **Cause racine**  
- Le **DHCP relay n’est pas activé** pour le VLAN ou la subinterface sur VyOS  
- Le DHCP broadcast ne traverse pas le VLAN isolé → les PCs ne peuvent pas obtenir d’IP

---

✅ **Résolution**  
- Sur VyOS, activer le DHCP relay ou vérifier le DHCP serveur sur la subinterface correspondante :

```bash
# Exemple pour VLAN20
set service dhcp-server shared-network-name VLAN20 subnet 192.168.20.0/24 subnet-id 20
# Assurer que la subinterface VLAN20 est up
show interfaces

