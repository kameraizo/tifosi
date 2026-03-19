
-- TIFOSI - Script de création du schéma

CREATE DATABASE IF NOT EXISTS tifosi;
USE tifosi;

CREATE USER IF NOT EXISTS 'tifosi'@'localhost' IDENTIFIED BY 'tifosi123';
GRANT ALL PRIVILEGES ON tifosi.* TO 'tifosi'@'localhost';
FLUSH PRIVILEGES;

-- Suppression des tables dans l'ordre inverse de création
DROP TABLE IF EXISTS menu_boisson;
DROP TABLE IF EXISTS menu_foccacia;
DROP TABLE IF EXISTS client_menu;
DROP TABLE IF EXISTS foccacia_ingredient;
DROP TABLE IF EXISTS menu;
DROP TABLE IF EXISTS boisson;
DROP TABLE IF EXISTS foccacia;
DROP TABLE IF EXISTS client;
DROP TABLE IF EXISTS marque;
DROP TABLE IF EXISTS ingredient;

-- stock les ingredients dispo pour les foccacias
CREATE TABLE ingredient (
    id_ingredient INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id_ingredient)
);


-- stock les marques de boissons
CREATE TABLE marque (
    id_marque INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (id_marque)
);


-- stock les clients sur le site avec leurs infos
CREATE TABLE client (
    id_client INT  NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    code_postal INT NOT NULL,
    PRIMARY KEY (id_client)
);


-- stock les foccacias
CREATE TABLE foccacia (
    id_foccacia INT  NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_foccacia)
);


-- stock les boissons
CREATE TABLE boisson (
    id_boisson INT  NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    id_marque INT NOT NULL,
    PRIMARY KEY (id_boisson),
    FOREIGN KEY (id_marque) REFERENCES marque(id_marque)
);


-- stock les menus 
CREATE TABLE menu (
    id_menu INT  NOT NULL AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL UNIQUE,
    prix DECIMAL(5,2) NOT NULL,
    PRIMARY KEY (id_menu)
);

-- relations entre les tables foccacia et ingredient
-- contient la quantite d'ingredient dans la foccacia
CREATE TABLE foccacia_ingredient (
    id_foccacia INT NOT NULL,
    id_ingredient INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_foccacia, id_ingredient),
    FOREIGN KEY (id_foccacia) REFERENCES foccacia(id_foccacia),
    FOREIGN KEY (id_ingredient) REFERENCES ingredient(id_ingredient)
);


-- relations entre les client, menu
-- contient le client et le menu et la date de l'achat
CREATE TABLE client_menu (
    id_client INT NOT NULL,
    id_menu INT NOT NULL,
    date_achat DATE NOT NULL,
    PRIMARY KEY (id_client, id_menu),
    FOREIGN KEY (id_client) REFERENCES client(id_client),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu)
);


-- relations entre les menu et foccacia
-- contient le menu et la foccacia
CREATE TABLE menu_foccacia ( 
    id_menu INT NOT NULL,
    id_foccacia INT NOT NULL,
    PRIMARY KEY (id_menu, id_foccacia),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_foccacia) REFERENCES foccacia(id_foccacia)
);


-- relations entre les menu et boissons
-- contient le menu et la boisson
CREATE TABLE menu_boisson (
    id_menu INT NOT NULL,
    id_boisson INT NOT NULL,
    PRIMARY KEY (id_menu, id_boisson),
    FOREIGN KEY (id_menu) REFERENCES menu(id_menu),
    FOREIGN KEY (id_boisson) REFERENCES boisson(id_boisson)
);