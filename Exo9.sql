-- Insérez une nouvelle catégorie de produits nommée «fruits et légumes », en respectant les contraintes.
INSERT INTO categories (CODE_CATEGORIE,NOM_CATEGORIE, DESCRIPTION) VALUES (9,"fruits et légumes", "fruits, légumes");

-- Créez un nouveau fournisseur « Grandma » (no_fournisseur = 30) avec les mêmes coordonnées que le fournisseur «
-- Grandma Kellly’s Homestead ».
INSERT INTO fournisseurs (NO_FOURNISSEUR,SOCIETE, ADRESSE,VILLE,CODE_POSTAL,PAYS,TELEPHONE,FAX)
SELECT 30,"Grandma", ADRESSE,VILLE,CODE_POSTAL,PAYS,TELEPHONE,FAX FROM fournisseurs where NO_FOURNISSEUR = 3;

-- Attribuer les produits de « Grandma Kelly’s Homestead » au nouveau fournisseur créé (« Grandma »).
UPDATE produits
SET NO_FOURNISSEUR = 30
WHERE NO_FOURNISSEUR = 3;

-- Supprimez l’ancien fournisseur «Grandma Kelly’s Homestead» .
DELETE FROM fournisseurs where NO_FOURNISSEUR = 3;
