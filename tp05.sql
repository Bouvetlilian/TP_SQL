SET SQL_SAFE_UPDATES = 0;
-- A
UPDATE article 
SET designation = LOWER(designation)
WHERE id = 2;

--B
UPDATE article
SET designation = UPPER(designation)
WHERE prix > 10;

--C
UPDATE article
SET article.prix = article.prix * 0.9
WHERE article.id NOT IN (SELECT id_art FROM compo);

--D
UPDATE compo 
SET qte = qte * 2
WHERE id_bon IN (SELECT id 
                FROM bon 
                WHERE bon.id_fou = 1
);

--E
UPDATE article
SET designation =
    CONCAT(
        SUBSTRING_INDEX(designation, '(', 1),
        SUBSTRING_INDEX(SUBSTRING_INDEX(designation, ')', - 1), '(', -1),
    )
WHERE designation LIKE '%(%';


