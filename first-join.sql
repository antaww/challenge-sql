SELECT
    albums.Title AS AlbumName,
    artists.Name AS ArtistName
FROM albums
         INNER JOIN artists ON
        albums.ArtistId = artists.ArtistId
LIMIT 100;
