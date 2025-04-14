USE compta;

--A
SELECT * FROM article;
--B
SELECT ref, designation FROM article WHERE prix > 2;
--C
SELECT * FROM article WHERE prix >= 2 AND prix <= 6.25;
--D
SELECT * FROM article WHERE prix BETWEEN 2 AND 6.25;
--E
SELECT a.*
FROM article a 
JOIN  fournisseur f on a.id_fou = f.id
WHERE (a.prix < 2 OR a.prix > 6.25)
AND f.nom = 'Française d''imports'
ORDER BY a.prix DESC;
--F
SELECT a.* 
FROM article a 
JOIN fournisseur f ON a.id_fou = f.id
WHERE f.nom = 'Française d''imports' OR f.nom = 'Dubois & Fils';
--G
SELECT a.*
FROM article a 
JOIN fournisseur f on a.id_fou = f.id
WHERE f.nom IN ('Française d''imports', 'Dubois & Fils');
--H
SELECT a.*
FROM article a 
JOIN fournisseur f on a.id_fou = f.id
WHERE f.nom NOT IN ('Française d''imports', 'Dubois & Fils');
--I
SELECT *
FROM bon
WHERE date_cmde BETWEEN '2019-02-01' AND '2019-04-30';

