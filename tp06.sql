SET SQL_SAFE_UPDATE = 0;

--A
DELETE FROM compo
WHERE id_bon IN (
    SELECT id
    FROM bon
    WHERE MONTH(date_cmde) = 4 AND YEAR(date_cmde) = 2019
);

--B
DELETE FROM bon
WHERE MONTH(date_cmde) = 4 AND YEAR(date_cmde) = 2019