SELECT g.Name, ROUND(AVG(t.Milliseconds),8) AS AverageDuration
FROM genres g
JOIN tracks t ON t.GenreId = g.GenreId
GROUP BY g.Name
ORDER BY AverageDuration DESC;

