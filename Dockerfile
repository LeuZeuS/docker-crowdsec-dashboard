# Utiliser l'image officielle de Metabase comme base
FROM metabase/metabase:latest

# Créer un répertoire pour les données de Metabase
RUN mkdir -p /data

# Copier le fichier de configuration et les dashboards préconfigurés
COPY metabase.db /data/metabase.db

# Définir les permissions appropriées
RUN chown -R metabase:metabase /data

# Définir la variable d'environnement pour le fichier de base de données
ENV MB_DB_FILE /data/metabase.db

# Exposer le port 3000
EXPOSE 3000

# Définir le point d'entrée de l'application
ENTRYPOINT ["java", "-jar", "/app/metabase.jar"]
