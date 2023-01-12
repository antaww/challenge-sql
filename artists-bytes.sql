SELECT a2.Name AS ArtistName, a.Title AS AlbumName, t.Name AS TrackName,
       ROUND(t.Bytes/1000000.0,2) || ' MB' AS MegaBytes
FROM albums AS a
INNER JOIN artists a2 on a.ArtistId = a2.ArtistId
INNER JOIN tracks t on a.AlbumId = t.AlbumId
WHERE a.Title = 'American Idiot';