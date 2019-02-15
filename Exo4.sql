-- Affiche le nom, prénom, fonction et salaire des employés qui ont un salaire compris entre 2500 et 3500
SELECT NOM, PRENOM, FONCTION FROM employes WHERE SALAIRE BETWEEN 2500 AND 3500;

-- Affiche le nom du produit, le nom du fournisseur, le nom de la
-- catégorie et les quantités de produits qui ne sont pas d’une des catégories 1, 3, 5 et 7.
SELECT NOM_PRODUIT as Produit , SOCIETE as Fournisseur, CODE_CATEGORIE as Categorie, QUANTITE  
FROM produits
NATURAL JOIN fournisseurs
NATURAL JOIN categories
WHERE produits.CODE_CATEGORIE != 1 AND produits.CODE_CATEGORIE != 3 AND produits.CODE_CATEGORIE != 5 
									AND produits.CODE_CATEGORIE != 7;

-- Affichez le nom du produit, le nom du fournisseur, le nom de la
-- catégorie et les quantités des produits qui ont le numéro fournisseur
-- entre 1 et 3 ou un code catégorie entre 1 et 3, et pour lesquelles les
-- quantités sont données en boîtes ou en cartons.
SELECT NOM_PRODUIT as Produit , SOCIETE as Fournisseur, CODE_CATEGORIE as Categorie, QUANTITE  
FROM produits
NATURAL JOIN fournisseurs
NATURAL JOIN categories
WHERE ((produits.NO_FOURNISSEUR BETWEEN 1 AND 3) OR (produits.CODE_CATEGORIE BETWEEN 1 AND 3)) 
AND (QUANTITE LIKE '%boites%' OR QUANTITE LIKE '%cartons%');

-- Rrequête permet d’afficher le nom des employés qui ont effectué 
-- au moins une vente pour un client parisien.
SELECT employes.NOM AS Nom FROM commandes
NATURAL JOIN clients
NATURAL JOIN employes
WHERE clients.VILLE = "Paris";

-- Affiche le nom des produits et le nom des fournisseurs pour les produits des catégories 1, 4 et 7.
SELECT NOM_PRODUIT as Produits, SOCIETE as Fournisseurs FROM produits
NATURAL JOIN fournisseurs
WHERE produits.CODE_CATEGORIE IN(1,4,7);

-- Affiche la liste des employés ainsi que le nom de leur supérieur hiérarchique.
SELECT employes.NOM, s.NOM AS Supérieur FROM employes
JOIN employes s
WHERE employes.REND_COMPTE = s.NO_EMPLOYE;


