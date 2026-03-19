# tifosi
Base de données MySQL pour le restaurant Tifosi
L'objectif était de concevoir une base de données MySQL pour le restaurant 
de Street-Food italien Tifosi, à partir d'un modèle conceptuel fourni.

## Ce qu'il faut pour l'utiliser
- MySQL 8.0+
- MySQL Workbench

## Comment lancer le projet

Il faut exécuter les scripts dans cet ordre dans MySQL Workbench :

1. `schema.sql` — crée la base, l'utilisateur et toutes les tables
2. `data.sql` — remplit la base avec les données de test
3. `requetes.sql` — contient les 10 requêtes de vérification

## Ce que contient la base

6 tables principales pour stocker les focaccias, ingrédients, boissons, 
marques, menus et clients. Et 4 tables de jonction pour gérer les relations 
entre elles.

- MySQL
- MySQL Workbench
