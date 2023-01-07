SELECT DISTINCT tracks.Name AS TrackName, playlists.Name AS PlaylistName
FROM tracks
JOIN playlist_track ON tracks.TrackId = playlist_track.TrackId
JOIN playlists ON playlist_track.PlaylistId = playlists.PlaylistId
WHERE playlists.Name = 'TV Shows'
LIMIT 100 OFFSET 0;
