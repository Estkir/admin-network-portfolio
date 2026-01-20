# ===== CONFIG =====
$GitHubUser = "Estkir" 
$RepoName = "admin-network-portfolio"
$GitEmail = "estebankirmser@gmail.com" 
$GitUser = "Esteban"

# ===== CONFIGURATION GIT =====
git config --global user.name $GitUser
git config --global user.email $GitEmail

# ===== CREATION DE LA STRUCTURE =====
# Dossiers principaux et sous-dossiers
$dirs = @(
    "projects/01_lan_enterprise/diagrams",
    "projects/01_lan_enterprise/configs",
    "projects/01_lan_enterprise/tests",
    "projects/01_lan_enterprise/incidents",
    "projects/02_multi_site_wan",
    "projects/03_network_security",
    "projects/04_network_operations",
    "templates",
    "assets"
)

foreach ($d in $dirs) {
    New-Item -ItemType Directory -Path $d -Force
}

# Fichiers README et templates
New-Item -ItemType File -Path "README.md" -Force
New-Item -ItemType File -Path "projects/01_lan_enterprise/README.md" -Force
New-Item -ItemType File -Path "templates/project_readme_template.md" -Force
New-Item -ItemType File -Path "templates/incident_report_template.md" -Force
New-Item -ItemType File -Path "templates/runbook_template.md" -Force

# Ajout des .gitkeep dans les dossiers vides
foreach ($d in $dirs) {
    New-Item -ItemType File -Path "$d/.gitkeep" -Force
}

# ===== INITIALISATION GIT =====
git init
git branch -M main

# ===== AJOUT DU REMOTE =====
git remote add origin https://github.com/$GitHubUser/$RepoName.git

# ===== AJOUT, COMMIT ET PUSH =====
git add .
git commit -m "Initial portfolio structure with all folders"
git push -u origin main
