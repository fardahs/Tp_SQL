-- Affiche la société, adresse et ville de résidence pour tous les tiers de l’entreprise.
SELECT SOCIETE, ADRESSE, VILLE FROM clients
UNION
SELECT SOCIETE, ADRESSE, VILLE FROM fournisseurs;

-- Affiche toutes les commandes qui comportent en même temps des produits de catégorie 1 du
-- fournisseur 1 et des produits de catégorie 2 du fournisseur 2.
SELECT CODE_CATEGORIE AS Categorie, NO_FOURNISSEUR AS Fournisseur, details_commandes.NO_COMMANDE AS Commande
FROM produits
JOIN details_commandes
WHERE (CODE_CATEGORIE  = 1 AND NO_FOURNISSEUR = 1)

AND EXISTS (
SELECT CODE_CATEGORIE AS Categorie, NO_FOURNISSEUR AS Fournisseur, details_commandes.NO_COMMANDE AS Commande
FROM produits
JOIN details_commandes
WHERE (CODE_CATEGORIE  = 2 AND NO_FOURNISSEUR = 2)
AND CODE_CATEGORIE = CODE_CATEGORIE AND NO_FOURNISSEUR = NO_FOURNISSEUR);

-- Affiche la liste des produits que les clients parisiens ne commandent pas.