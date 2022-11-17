SELECT COUNT(DISTINCT c1.music_id) AS cancoes, COUNT(DISTINCT c2.artist_id) AS artistas, COUNT(DISTINCT c3.album_id) AS albuns FROM SpotifyClone.musics AS c1
INNER JOIN SpotifyClone.artist AS c2 
ON c1.artist_id = c2.artist_id 
INNER JOIN SpotifyClone.albuns AS c3
ON c2.artist_id = c3.artist_id 