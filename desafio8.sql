SELECT c1.artist_name AS artista, c2.album_name AS album FROM SpotifyClone.artist AS c1
INNER JOIN SpotifyClone.albuns AS c2
ON c1.artist_id = c2.artist_id 
WHERE c1.artist_name IN ('Elis Regina')
GROUP BY c1.artist_name, c2.album_name  
ORDER BY album ASC
