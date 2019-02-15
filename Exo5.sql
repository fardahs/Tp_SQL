-- Affiche la somme des salaires et des commissions des employés.
SELECT SUM(SALAIRE) AS Salaires, SUM(COMMISSION) AS Commission FROM employes;

-- Affiche la moyenne des salaires et des commissions des employés.
SELECT AVG(SALAIRE) AS Salaires, AVG(COMMISSION) AS Commission FROM employes;

-- Affiche le salaire maximum et la plus petite commission des employés.
SELECT MAX(SALAIRE) AS Salaires, MIN(COMMISSION) AS Commission FROM employes;

-- Affiche le nombre distinct de fonction.
SELECT COUNT(distinct FONCTION) AS Fonction FROM employes;