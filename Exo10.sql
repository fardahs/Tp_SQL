-- Créez une table pays avec 2 champs : code pays (4 caractères, clé primaire), nom pays (40 caractères maximum)
CREATE TABLE pays(
CODE_PAYS CHAR(4) NOT NULL PRIMARY KEY,
NOM_PAYS VARCHAR(40)
);

-- Ajoutez une colonne courriel (75 caractères possibles) à la table CLIENTS. Puis modifiez la pour passer à 60 caractères.
-- Pour finir, supprimez cette colonne.
ALTER TABLE clients ADD (COURRIEL VARCHAR(75));
ALTER TABLE clients MODIFY COURRIEL VARCHAR(60);
ALTER TABLE clients DROP COURRIEL;

-- Créez une vue qui affiche le nom de la société, l’adresse, le téléphone et la ville des clients qui habitent à Toulouse,
-- Strasbourg, Nantes ou Marseille.
CREATE VIEW vue_clients AS SELECT SOCIETE, ADRESSE,TELEPHONE,VILLE FROM clients
WHERE VILLE IN("Toulouse","Strasbourg","Nantes","Marseille");

SELECT * FROM vue_clients;