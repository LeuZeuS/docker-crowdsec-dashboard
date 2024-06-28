#!/bin/sh

# Vérifier si le dashboard est déjà installé
if [ ! -f /etc/crowdsec/dashboard_installed ]; then
  echo "Dashboard non installé. Exécution de cscli dashboard setup."

  # Exécuter le setup avec les variables d'environnement et le secret
  cscli dashboard setup --password "$(cat /etc/crowdsec/secrets/password)" \
    --listen "${DASHBOARD_LISTEN:-127.0.0.1}" \
    --port "${DASHBOARD_PORT:-3000}"

  # Marquer le dashboard comme installé
  touch /etc/crowdsec/dashboard_installed
else
  echo "Dashboard déjà installé. Ignorer l'installation."
fi

# Démarrer le dashboard
cscli dashboard setup
