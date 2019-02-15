-- Affiche le nom de la société et le pays des clients qui habitent à Toulouse.
SELECT SOCIETE, PAYS FROM clients WHERE VILLE="Toulouse";

-- Affiche le nom, prénom et fonction des employés dirigés par l’employé numéro 2.
SELECT NOM, PRENOM, FONCTION FROM employes WHERE REND_COMPTE = 2;

-- Affiche le nom, prénom et fonction des employés qui ne sont pas des représentants.
SELECT NOM, PRENOM, FONCTION FROM employes WHERE FONCTION != "Représentant(e)";

-- Affiche le nom, prénom et fonction des employés qui ont un salaire inférieur à 3500.
SELECT NOM, PRENOM, FONCTION FROM employes WHERE SALAIRE < 3500;

-- Affiche le nom de la société, la ville et le pays des clients qui n’ont pas de fax.
SELECT SOCIETE, VILLE, PAYS FROM clients WHERE FAX IS NULL; 

-- Affiche le nom, prénom et la fonction des employés qui n’ont pas de supérieur.
SELECT NOM, PRENOM, FONCTION FROM employes WHERE REND_COMPTE IS NULL;