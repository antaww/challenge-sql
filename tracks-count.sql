SELECT g.Name, COUNT(t.TrackId) AS NumberOfTracks
FROM genres g
INNER JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.Name;