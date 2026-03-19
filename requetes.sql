-- TIFOSI - Script des requêtes de test


USE tifosi;

-- Requêtes 1: liste des foccacias par ordre alphabétique
-- Resultat attendu: 8 foccacias par ordre alphabétique
SELECT nom FROM foccacia ORDER BY nom ASC;
-- Resultat obtneu: 8 foccacias par ordre alphabétique
-- Ecart: 0


-- Requêtes 2: nombres total d'ingredients
-- Resultats attendu: 25
SELECT count(*) AS total FROM ingredient;
-- Resultat obtenu: 25
--

-- Requêtes 3: prix moyen des foccacias
-- Resultat attendu: prix moyen des foccacias
SELECT AVG(prix) AS moyenne FROM foccacia;
-- Resultat obtenu: 10.375000
-- Ecart: 0


-- Requêtes 4: liste des boissons par marque
-- Resultat attendu: 12 boissons trier par marque
SELECT b.nom, m.nom AS marque
FROM boisson b
JOIN marque m ON b.id_marque = m.id_marque
ORDER BY b.nom ASC;
-- Resultat obtenu: 12 boissons trier par marque
-- Ecart: 0


-- Requêtes 5: liste des ingredients d'une foccacia (Raclaccia)
-- Resultat attendu: 7 ingredients + quantité
SELECT ingredient.nom, foccacia_ingredient.quantite
FROM foccacia_ingredient
JOIN ingredient ON foccacia_ingredient.id_ingredient = ingredient.id_ingredient
JOIN foccacia ON foccacia_ingredient.id_foccacia = foccacia.id_foccacia
WHERE foccacia.nom = 'Raclaccia';
-- Resultat obtenu: 7 ingredients + quantité
-- Ecart: 0


-- Requêtes 6: liste des foccacias par nombre d'ingredients
-- Resultat attendu: 8 foccacias par nombre d'ingredients
SELECT foccacia.nom, COUNT(ingredient.id_ingredient) AS nb_ingredients
FROM foccacia
JOIN foccacia_ingredient ON foccacia.id_foccacia = foccacia_ingredient.id_foccacia
JOIN ingredient ON foccacia_ingredient.id_ingredient = ingredient.id_ingredient
GROUP BY foccacia.nom;
-- Resultat obtenu: 8 foccacias par nombre d'ingredients
-- Ecart: 0


-- requête 7: foccacia avec le plus grand nombre d'ingredients
-- Resultat attendu: foccacia avec le plus grand nombre d'ingredients
SELECT foccacia.nom, COUNT(ingredient.id_ingredient) AS nb_ingredients
FROM foccacia
JOIN foccacia_ingredient ON foccacia.id_foccacia = foccacia_ingredient.id_foccacia
JOIN ingredient ON foccacia_ingredient.id_ingredient = ingredient.id_ingredient
GROUP BY foccacia.nom
ORDER BY nb_ingredients DESC
LIMIT 1;
-- Resultat obtenu: Paysanne 12 ingredients 
-- Ecart: 0


-- requête 8: liste des foccacias contenant l'ingredient Ail
-- Resultat attendu: 4 foccacias contenant l'ingredient Ail
SELECT foccacia.nom
FROM foccacia
JOIN foccacia_ingredient ON foccacia.id_foccacia = foccacia_ingredient.id_foccacia
JOIN ingredient ON foccacia_ingredient.id_ingredient = ingredient.id_ingredient
WHERE ingredient.nom = 'Ail';
-- Resultat obtenu: 4 foccacias contenant l'ingredient Ail
-- Ecart: 0

-- requête 9: liste des ingredients n'appartenant a aucune foccacias
--- Resultat attendu: 2 ingredients n'appartenant a aucune foccacias
SELECT ingredient.nom
FROM ingredient
LEFT JOIN foccacia_ingredient ON ingredient.id_ingredient = foccacia_ingredient.id_ingredient
WHERE foccacia_ingredient.id_ingredient IS NULL;
-- Resultat obtenu: 2 ingredients n'appartenant a aucune foccacias
-- Ecart: 0


-- requête 10: liste des foccacias ne contenant aucun Champignon
-- Resultat attendu: 2 foccacias ne contenant aucun Champignon
SELECT foccacia.nom
FROM foccacia
LEFT JOIN foccacia_ingredient ON foccacia.id_foccacia = foccacia_ingredient.id_foccacia 
AND foccacia_ingredient.id_ingredient = (SELECT id_ingredient FROM ingredient WHERE nom = 'Champignon')
WHERE foccacia_ingredient.id_foccacia IS NULL;
-- Resultat obtenu: 2 foccacias ne contenant aucun Champignon
-- Ecart: 0



