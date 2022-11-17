SELECT c1.artist_name AS artista, c2.album_name AS album, COUNT(c3.user_id) AS seguidores FROM SpotifyClone.artist AS c1
INNER JOIN SpotifyClone.albuns AS c2
ON c1.artist_id = c2.artist_id 
INNER JOIN SpotifyClone.artist_followers AS c3
ON c2.artist_id = c3.artist_id 
GROUP BY c1.artist_name, c2.album_name  
ORDER BY seguidores  DESC, c1.artist_name  ASC, c2.album_name ASC