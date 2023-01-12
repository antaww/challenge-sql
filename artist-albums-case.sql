SELECT a.Name as Name, COUNT(al.AlbumId) AS NbAlbums,
CASE
   WHEN COUNT(al.AlbumId) = 1 THEN 'Unproductive'
   WHEN COUNT(al.AlbumId) >= 10 THEN 'Very Productive'
   WHEN COUNT(al.AlbumId) > 1 THEN 'Productive'
END AS IsProductive
FROM artists a
INNER JOIN albums al ON a.ArtistId = al.ArtistId
GROUP BY a.Name
LIMIT 100;
