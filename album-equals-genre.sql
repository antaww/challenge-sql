SELECT *
FROM tracks
WHERE GenreId IN (
    SELECT GenreId FROM genres WHERE Name IN (
      SELECT Title
      FROM albums
      WHERE (SELECT GenreId FROM genres WHERE Name = albums.Title)
    )
);

