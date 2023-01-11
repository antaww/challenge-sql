SELECT
g.Name AS GenreName,
AVG(t.Milliseconds) AS AverageDuration
FROM
genres g
INNER JOIN
tracks t ON g.GenreId = t.GenreId
GROUP BY g.Name
ORDER BY AverageDuration DESC;