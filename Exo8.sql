-- Affichez tous les produits pour lesquels la quantité en stock est inférieur à la moyenne des quantités en stock.
SELECT * FROM produits p
WHERE UNITES_STOCK < ( 
	SELECT AVG(p2.UNITES_STOCK) 
	FROM produits p2
);

-- Affichez toutes les commandes pour lesquelles les frais de ports dépassent la moyenne des frais de ports pour ce client.
SELECT * FROM commandes c
JOIN clients cl
ON c.CODE_CLIENT = cl.CODE_CLIENT
WHERE c.PORT > (
SELECT AVG(c2.PORT) FROM commandes c2
JOIN clients cl2
ON c2.CODE_CLIENT = cl2.CODE_CLIENT
WHERE cl2.CODE_CLIENT = cl.CODE_CLIENT
);

-- Affichez les produits pour lesquels la quantité en stock est supérieure à la quantité en stock de chacun des produits de
-- catégorie 3.
SELECT * FROM produits p
WHERE UNITES_STOCK > (
SELECT MAX(p2.UNITES_STOCK) FROM produits p2
WHERE p2.CODE_CATEGORIE = 3
);

-- Affichez les produits, fournisseurs et unités en stock pour les produits qui ont un stock inférieur à la moyenne des stocks
-- des produits pour le même fournisseur.
SELECT p.NOM_PRODUIT AS Produit, p.NO_FOURNISSEUR AS Fournisseur, p.UNITES_STOCK
FROM produits p
WHERE UNITES_STOCK < (
SELECT AVG(p2.UNITES_STOCK) FROM produits p2
WHERE p2.NO_FOURNISSEUR = p.NO_FOURNISSEUR);

-- Affichez les employés avec leur salaire et le % par rapport au total de la masse salariale par fonction.
SELECT NOM, SALAIRE, ROUND(SALAIRE/e.masse*100) AS Pourcentage
FROM employes, 
(SELECT SUM(SALAIRE) AS masse, FONCTION
FROM employes 
GROUP BY FONCTION) e
WHERE employes.FONCTION = e.FONCTION;
