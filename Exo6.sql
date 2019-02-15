-- Requête qui permet d’afficher la masse salariale(somme des salaires) des employés par fonction.
SELECT SUM(SALAIRE) AS Nombre, FONCTION AS Fonction FROM employes GROUP BY FONCTION; 

-- Affichez le numéro de commande de celles qui comportent plus de 5 références de produit.
SELECT NO_COMMANDE as Numéro, COUNT(REF_PRODUIT) AS Reférence
FROM details_commandes
GROUP BY NO_COMMANDE
HAVING COUNT(REF_PRODUIT) > 5;

-- Afficher la valeur des produits en stock et la valeur des produits commandés par fournisseur, pour les
-- fournisseurs qui ont un numéro compris entre 3 et 6.
SELECT NO_FOURNISSEUR, ifnull(SUM(UNITES_STOCK),0) AS Valeur_Stock, ifnull(SUM(UNITES_COMMANDEES),0) AS Valeur_commande
FROM produits
WHERE NO_FOURNISSEUR BETWEEN 3 AND 6
GROUP BY NO_FOURNISSEUR;


-- Afficher le nom et prénom des employés ayant fait plus de 100 commandes
SELECT employes.NOM AS Nom, employes.PRENOM AS Prenom, COUNT(NO_COMMANDE) AS Total
from commandes
JOIN employes
ON commandes.NO_EMPLOYE = employes.NO_EMPLOYE
GROUP BY employes.NOM
HAVING COUNT(NO_COMMANDE) > 100;


-- Afficher la société qui a fait plus de 30 commandes
SELECT clients.SOCIETE AS Societe, COUNT(NO_COMMANDE) AS Total
from commandes
JOIN clients
ON commandes.CODE_CLIENT = clients.CODE_CLIENT
GROUP BY clients.SOCIETE
HAVING COUNT(NO_COMMANDE) > 30; 