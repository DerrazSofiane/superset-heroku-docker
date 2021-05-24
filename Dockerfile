FROM apache/superset
# Passer à l'utilisateur root pour installer les paquets requis
USER root
# Installer la bibliothèque Postgres pour se connecter à la base de données
RUN pip install psycopg2-binary
# Retourner sur l'utilisateur `superset`.
USER superset
# Ajouter une configuration
COPY superset_config.py .
