USE compta;

SELECT * FROM article 
ORDER BY designation ASC;

SELECT * FROM article
ORDER BY prix DESC;

SELECT * FROM article
WHERE designation LIKE '%boulon%'
ORDER BY prix ASC;

SELECT * FROM article
WHERE designation LIKE '%sachet%';

SELECT * FROM article
WHERE LOWER(designation) LIKE LOWER('%sachet%');

SELECT a.*, f.nom AS nom_fournisseur
FROM article a 
JOIN fournisseur f ON a.id_fou = f.id
ORDER BY f.nom ASC, a.prix DESC;

SELECT a.*
FROM article a 
JOIN fournisseur f ON a.id_fou = f.id 
WHERE f.nom = 'Dubois & Fils';

SELECT AVG(a.prix) AS prix_moyen
FROM article a 
JOIN fournisseur f ON a.id_fou = f.id
WHERE f.nom = 'Dubois & Fils';

SELECT f.nom AS nom_fournisseur, AVG(a.prix) AS prix_moyen
FROM article a 
JOIN fournisseur f ON a.id_fou = f.id 
GROUP BY f.id, f.nom;

SELECT *
FROM bon
WHERE date_cmde BETWEEN '2019-03-01 00:00:00' AND '2019-04-05 12:00:00';

SELECT bon.id, article.designation,
FROM bon 
JOIN compo ON bon.id = compo.id_bon
JOIN article ON compo.id_art = article.id 
WHERE article.designation LIKE '%boulon%';

SELECT DISTINCT bon.*, fournisseur.nom AS nom_fournisseur
FROM bon 
JOIN compo ON bon.id = compo.id_bon
JOIN article ON compo.id_art = article.id
JOIN fournisseur on bon.id_fou = fournisseur.id
WHERE article.designation LIKE '%boulon%';

SELECT SUM(article.prix * compo.qte) AS prix_total
FROM bon
JOIN compo ON bon.id = compo.id_bon
JOIN article a ON compo.id_art = article.id
GROUP BY bon.id, bon.numero;

SELECT bon.numero, SUM(compo.qte) AS nombre_articles
FROM bon 
JOIN compo ON bon.id = compo.id_bon
JOIN article ON compo.id_art = article.id
GROUP BY bon.numero;

SELECT bon.numero, SUM(compo.qte) AS nombre_articles
FROM bon 
JOIN compo ON bon.id = compo.id_bon
GROUP BY bon.numero
HAVING SUM(compo.qte) > 25;

SELECT SUM(article.prix * compo.qte) AS cout_total_avril
FROM bon 
JOIN compo ON bon.id = compo.id_bon
JOIN article ON compo.id_art = article.id
WHERE MONTH(bon.date_cmde) = 4
