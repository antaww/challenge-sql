SELECT ar.Name as Name, COUNT(al.AlbumId) AS NbAlbums,
CASE
   WHEN COUNT(al.AlbumId) = 1 THEN 'Unproductive'
   WHEN COUNT(al.AlbumId) >= 10 THEN 'Very Productive'
   WHEN COUNT(al.AlbumId) > 1 THEN 'Productive'
END AS IsProductive
FROM artists ar
INNER JOIN albums al ON ar.ArtistId = al.ArtistId
GROUP BY ar.ArtistId
LIMIT 100;