-- Afficher les commandes d'avant le 01/08/2017 qui ont une somme sup à 11000 et qui
-- contiennent des produits des fournisseurs français.
SELECT c.NO_COMMANDE, c.DATE_COMMANDE, SUM(dc.PRIX_UNITAIRE)
FROM commandes c
JOIN details_commandes dc
ON  dc.NO_COMMANDE = c.NO_COMMANDE
JOIN produits p
ON  p.REF_PRODUIT = dc.REF_PRODUIT
JOIN fournisseurs f
ON f.NO_FOURNISSEUR = p.NO_FOURNISSEUR
WHERE c.DATE_COMMANDE < "2017-08-01" AND f.PAYS = "FRANCE"
GROUP BY dc.NO_COMMANDE
HAVING SUM(dc.PRIX_UNITAIRE * dc.QUANTITE) > 11000;

-- Afficher la liste des fournisseurs qui nous fournissent plus de 4 produits différents.
SELECT f.SOCIETE FROM produits
NATURAL JOIN fournisseurs f
GROUP BY f.SOCIETE
HAVING COUNT(produits.REF_PRODUIT) > 4; 

-- Afficher pour les clients brésiliens le montant total de commandes ainsi que le
-- pourcentage sur les ventes totales. (Afficher aussi les ventes totales)
/* SELECT cl.SOCIETE, Total.Vente AS Vente, 
ROUND(dc.PRIX_UNITAIRE / SUM(dc.PRIX_UNITAIRE * dc.QUANTITE) *100) AS Pourcentages
FROM commandes c,details_commandes dc,clients cl,
(SELECT SUM(dc1.PRIX_UNITAIRE * dc1.QUANTITE) AS Vente 
FROM details_commandes dc1
 ) Total
WHERE dc.NO_COMMANDE = c.NO_COMMANDE AND
AND cl.CODE_CLIENT = c.CODE_CLIENT
AND cl.PAYS = "Brésil"; 
