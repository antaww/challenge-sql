DELETE FROM tracks
WHERE AlbumId = (SELECT albums.AlbumId FROM albums WHERE Title = 'Facelift');