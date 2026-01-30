# Incident 1 — VLAN trunk mal configuré

🚨 **Symptôme**  
Les machines des VLAN 20 et VLAN 30 ne peuvent plus joindre leur passerelle VyOS et le serveur interne.  
- PC2 (VLAN20) ping 192.168.20.1 KO  
- PC3 (VLAN30) ping 192.168.30.1 KO  

---

🔍 **Diagnostic**  
- PC1 (VLAN10) ping gateway 192.168.10.1 → OK  
- PC2 (VLAN20) ping gateway 192.168.20.1 → KO  
- PC3 (VLAN30) ping gateway 192.168.30.1 → KO  
- Vérification sur le switch Arista : port trunk vers VyOS n’autorise que le VLAN10, VLAN20 et VLAN30 absents du trunk.

---

🛠️ **Cause racine**  
Port trunk mal configuré sur le switch → seuls certains VLANs passent sur le trunk.  
- VyOS ne reçoit pas le trafic des VLAN bloqués  
- DHCP ne délivre plus d’adresses aux VLAN affectés  
- Trafic inter-VLAN impossible pour ces VLANs

---

✅ **Résolution**  
- Sur le switch Arista :

```bash
interface Ethernet4
   switchport mode trunk
   switchport trunk allowed vlan 10,20,30
