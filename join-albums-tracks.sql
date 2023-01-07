SELECT
    a.Title AS AlbumName,
    t.Name AS TrackName,
    t.Milliseconds
FROM
    albums a
        INNER JOIN
    tracks t ON a.AlbumId = t.AlbumId
ORDER BY Milliseconds
LIMIT 50;