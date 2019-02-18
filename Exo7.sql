-- Affiche la société, adresse et ville de résidence pour tous les tiers de l’entreprise.
SELECT SOCIETE, ADRESSE, VILLE FROM clients
UNION
SELECT SOCIETE, ADRESSE, VILLE FROM fournisseurs;

-- Affiche toutes les commandes qui comportent en même temps des produits de catégorie 1 du
-- fournisseur 1 et des produits de catégorie 2 du fournisseur 2.
SELECT dc.NO_COMMANDE AS Commande 
FROM produits p1
JOIN details_commandes dc
ON p1.REF_PRODUIT = dc.REF_PRODUIT
WHERE (p1.CODE_CATEGORIE  = 1 AND p1.NO_FOURNISSEUR = 1) 
AND EXISTS (
SELECT dc2.NO_COMMANDE AS Commande
FROM produits p2
JOIN details_commandes dc2
ON p2.REF_PRODUIT = dc2.REF_PRODUIT
WHERE (CODE_CATEGORIE  = 2 AND NO_FOURNISSEUR = 2)
AND dc.NO_COMMANDE = dc2.NO_COMMANDE);

-- Affiche la liste des produits que les clients parisiens ne commandent pas.
SELECT dc.REF_PRODUIT AS Produit FROM details_commandes dc
JOIN commandes c
ON dc.NO_COMMANDE = c.NO_COMMANDE
JOIN clients cl
ON c.CODE_CLIENT = cl.CODE_CLIENT
WHERE cl.VILLE = "Paris"
AND NOT EXISTS(
SELECT dc2.REF_PRODUIT AS Produit FROM details_commandes dc2
JOIN commandes c2
ON dc2.NO_COMMANDE = c2.NO_COMMANDE
JOIN clients cl2
ON c2.CODE_CLIENT = cl2.CODE_CLIENT
WHERE cl2.VILLE = "Paris" AND c2.NO_COMMANDE IS NULL );