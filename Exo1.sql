-- Affiche tous les employés de la société
SELECT * FROM employes;

-- Affiche toutes les catégories de produits
SELECT * FROM categories;

-- Affiche les noms, prénoms et date de naissance, et la commission. 0 s'il n'y a pas de commission 
SELECT NOM,PRENOM, DATE_NAISSANCE,IFNULL(COMMISSION, 0) FROM employes;

-- Affiche la liste des fonctions des employés de la société
SELECT FONCTION FROM la300.employes;

-- Affiche la liste des pays de nos clients
SELECT PAYS FROM la300.clients;

-- Affiche la liste des localités dans lesquelles il existe au moins un client.
SELECT DISTINCT VILLE  FROM clients;

-- Affiche les produits commercialisés et la valeur de stock par produit ( prix unitaire *quantité en stock)
SELECT NOM_PRODUIT, (UNITES_STOCK * PRIX_UNITAIRE) AS Valeur_stock FROM produits;

-- Affiche le nom, le prénom, l’âge et l’ancienneté des employés, dans la société.
SELECT NOM, PRENOM,  (YEAR(now()) - year(DATE_NAISSANCE))  AS Age, (YEAR(now()) - year(DATE_EMBAUCHE)) AS Anciennete FROM employes ;

-- Format
SELECT NOM, "gagne" as "a un", (SALAIRE*12) as "gain annuel", "par an" as "sur 12 mois" FROM employes;
