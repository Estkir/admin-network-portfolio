# Incident — Perte de connectivité inter-VLAN

## 🚨 Symptôme
Les machines du VLAN 10 ne peuvent plus joindre le VLAN 30.

## 🔍 Diagnostic
- Ping gateway OK
- Ping serveur KO
- Vérification trunk → VLAN 30 absent

## 🛠️ Cause racine
Port trunk mal configuré sur le switch.

## ✅ Résolution
Ajout VLAN 30 au trunk.

## 📌 Prévention
Validation trunk après chaque modification.
