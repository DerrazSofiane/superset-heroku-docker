# Superset sur Heroku avec Docker

Déploiement de base de Superset sur Heroku avec Docker (via `heroku.yml`).

## Pourquoi ?

J'ai essayé quelques-unes des ["installateurs en un clic" existants](https://github.com/RealScout/superset-on-heroku#realscout-superset-on-heroku) mais tous ont échoué. Je suis personnellement plus à l'aise avec les conteneurs, j'ai donc choisi cette méthode. 🤷

## Prérequis
- Docker
- Openssl
- Heroku

## Cloner ce dépôt

```sh
git clone https://github.com/DerrazSofiane/superset-heroku-docker.git
cd superset-heroku-docker
```

### Installation de MapBox (optionnel)
Créer un fichier .env avec la variable MAPBOX_API_KEY à l'intérieur. Ajouter la clé api de mapbox à la variable.

## Créer une application Heroku

Créez une application heroku avec [le fichier `heroku.yml`.](https://devcenter.heroku.com/articles/build-docker-images-heroku-yml#creating-your-app-from-setup).

```sh
heroku update beta
heroku plugins:install @heroku-cli/plugin-manifest
heroku create VOTRE_NOM_APP --manifest
git push heroku main
heroku config:set SECRET_KEY=$(openssl rand -hex 12)
```

## Initialiser Superset

Exécutez les étapes d'initialisation de Superset, y compris le chargement des données d'exemple si vous le souhaitez.

```sh
# démarrer une session shell
heroku run bash

# créer un utilisateur admin
superset fab create-admin \
  --username admin \
  --firstname Superset \
  --lastname Admin \
  --email admin@superset.com \
  --password password1

# migrer la base de données vers la dernière version
superset db upgrade

# facultatif : charger des exemples
superset load_examples

# mise en place des rôles
superset init
```

## Lancer l'application

```sh
heroku open
```

## Crédit

Ces étapes ont été élaborées à partir de plusieurs sources, principalement :

* Image Docker officielle - [https://hub.docker.com/r/apache/superset](https://hub.docker.com/r/apache/superset)
* Configuration du déploiement vers Heroku - [https://github.com/RealScout/superset-on-heroku#realscout-superset-on-heroku](https://github.com/RealScout/superset-on-heroku#realscout-superset-on-heroku)
