SELECT
    rs.DateAdded,
    rs.Queue_ID,
    IFNULL(TIME_FORMAT(c.DataInicioAtendimento, '%H:%i'), '') AS InicioAtendimento,
    IFNULL(TIME_FORMAT(c.DataFimAtendimento, '%H:%i'), '') AS FimAtendimento,
    SUM(rs.qteHs00) AS qteHs00,
    SUM(rs.qteHs01) AS qteHs01,
    SUM(rs.qteHs02) AS qteHs02,
    SUM(rs.qteHs03) AS qteHs03,
    SUM(rs.qteHs04) AS qteHs04,
    SUM(rs.qteHs05) AS qteHs05,
    SUM(rs.qteHs06) AS qteHs06,
    SUM(rs.qteHs07) AS qteHs07,
    SUM(rs.qteHs08) AS qteHs08,
    SUM(rs.qteHs09) AS qteHs09,
    SUM(rs.qteHs10) AS qteHs10,
    SUM(rs.qteHs11) AS qteHs11,
    SUM(rs.qteHs12) AS qteHs12,
    SUM(rs.qteHs13) AS qteHs13,
    SUM(rs.qteHs14) AS qteHs14,
    SUM(rs.qteHs15) AS qteHs15,
    SUM(rs.qteHs16) AS qteHs16,
    SUM(rs.qteHs17) AS qteHs17,
    SUM(rs.qteHs18) AS qteHs18,
    SUM(rs.qteHs19) AS qteHs19,
    SUM(rs.qteHs20) AS qteHs20,
    SUM(rs.qteHs21) AS qteHs21,
    SUM(rs.qteHs22) AS qteHs22,
    SUM(rs.qteHs23) AS qteHs23
FROM
(
    SELECT 
        DATE(q.DateAdded) AS DateAdded,
        q.Queue_ID,
        CASE WHEN HOUR(q.DateAdded) =  0 THEN 1 ELSE 0 END AS qteHs00,
        CASE WHEN HOUR(q.DateAdded) =  1 THEN 1 ELSE 0 END AS qteHs01,
        CASE WHEN HOUR(q.DateAdded) =  2 THEN 1 ELSE 0 END AS qteHs02,
        CASE WHEN HOUR(q.DateAdded) =  3 THEN 1 ELSE 0 END AS qteHs03,
        CASE WHEN HOUR(q.DateAdded) =  4 THEN 1 ELSE 0 END AS qteHs04,
        CASE WHEN HOUR(q.DateAdded) =  5 THEN 1 ELSE 0 END AS qteHs05,
        CASE WHEN HOUR(q.DateAdded) =  6 THEN 1 ELSE 0 END AS qteHs06,
        CASE WHEN HOUR(q.DateAdded) =  7 THEN 1 ELSE 0 END AS qteHs07,
        CASE WHEN HOUR(q.DateAdded) =  8 THEN 1 ELSE 0 END AS qteHs08,
        CASE WHEN HOUR(q.DateAdded) =  9 THEN 1 ELSE 0 END AS qteHs09,
        CASE WHEN HOUR(q.DateAdded) = 10 THEN 1 ELSE 0 END AS qteHs10,
        CASE WHEN HOUR(q.DateAdded) = 11 THEN 1 ELSE 0 END AS qteHs11,
        CASE WHEN HOUR(q.DateAdded) = 12 THEN 1 ELSE 0 END AS qteHs12,
        CASE WHEN HOUR(q.DateAdded) = 13 THEN 1 ELSE 0 END AS qteHs13,
        CASE WHEN HOUR(q.DateAdded) = 14 THEN 1 ELSE 0 END AS qteHs14,
        CASE WHEN HOUR(q.DateAdded) = 15 THEN 1 ELSE 0 END AS qteHs15,
        CASE WHEN HOUR(q.DateAdded) = 16 THEN 1 ELSE 0 END AS qteHs16,
        CASE WHEN HOUR(q.DateAdded) = 17 THEN 1 ELSE 0 END AS qteHs17,
        CASE WHEN HOUR(q.DateAdded) = 18 THEN 1 ELSE 0 END AS qteHs18,
        CASE WHEN HOUR(q.DateAdded) = 19 THEN 1 ELSE 0 END AS qteHs19,
        CASE WHEN HOUR(q.DateAdded) = 20 THEN 1 ELSE 0 END AS qteHs20,
        CASE WHEN HOUR(q.DateAdded) = 21 THEN 1 ELSE 0 END AS qteHs21,
        CASE WHEN HOUR(q.DateAdded) = 22 THEN 1 ELSE 0 END AS qteHs22,
        CASE WHEN HOUR(q.DateAdded) = 23 THEN 1 ELSE 0 END AS qteHs23
    FROM 
        chatqueue q
    WHERE 
        DATE(q.DateAdded) = '2024-09-02' -- Substitua pela data desejada ou use INTERVAL para intervalos
) AS rs
LEFT JOIN Campanha c ON c.Name = rs.Queue_ID
GROUP BY
    rs.DateAdded,
    rs.Queue_ID,
    c.DataInicioAtendimento,
    c.DataFimAtendimento
ORDER BY
    rs.DateAdded,
    rs.Queue_ID;
