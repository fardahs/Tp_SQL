-- Trier les employés par nom de salarié en ordre décroissant.
SELECT NOM FROM employes ORDER BY NOM DESC;

-- Trier les clients par pays.
SELECT * FROM clients ORDER BY PAYS ASC;

-- Trier les clients par pays et par ville.
SELECT * FROM clients ORDER BY PAYS, VILLE ASC;