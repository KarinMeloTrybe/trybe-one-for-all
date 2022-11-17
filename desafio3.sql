SELECT c1.user_name  AS usuario, COUNT(c2.music_id) AS qt_de_musicas_ouvidas, ROUND(SUM((c3.duration_musics)/60), 2) AS total_minutos FROM SpotifyClone.user AS c1
INNER JOIN SpotifyClone.history AS c2
ON c1.user_id = c2.user_id 
INNER JOIN SpotifyClone.musics AS c3
ON c2.music_id = c3.music_id 
GROUP BY c1.user_name
ORDER BY c1.user_name ASC