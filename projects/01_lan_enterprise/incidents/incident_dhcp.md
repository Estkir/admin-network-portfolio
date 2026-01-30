# Incident 2 — DHCP relay absent / DHCP non distribué sur VLAN

## 🚨 Symptôme
Le PC2 ne reçoit pas d’adresse IP correcte pour son VLAN prévu (VLAN20).  
- IP reçue : 192.168.30.101/24 (VLAN30) au lieu de 192.168.20.x  
- Passerelle VLAN20 (192.168.20.1) non atteinte via DHCP  
- DHCP pour VLAN20 KO  
- Communication avec la gateway VLAN30 fonctionne car PC2 a reçu une IP sur ce VLAN

---

## 🔍 Diagnostic
- Vérification IP sur PC2 :

```text
PC2> show ip

NAME        : PC2[1]
IP/MASK     : 192.168.30.101/24
GATEWAY     : 192.168.30.1
DNS         : 8.8.8.8
DHCP SERVER : 192.168.30.1
DHCP LEASE  : 86392, 86400/43200/75600
MAC         : 00:50:79:66:68:01
LPORT       : 20030
RHOST:PORT  : 127.0.0.1:20031
MTU         : 1500

---

🛠️ **Cause racine**  
- DHCP relay absent ou mal configuré sur VyOS pour VLAN20
- Les requêtes DHCP broadcast du VLAN20 n’atteignent pas le serveur → PC reçoit IP d’un autre VLAN (VLAN30)

---

✅ **Résolution**  

- Vérifier ou activer le DHCP relay pour VLAN20 sur VyOS
- Sur PC2, renouveler l’IP via DHCP
- Tester la connectivité
