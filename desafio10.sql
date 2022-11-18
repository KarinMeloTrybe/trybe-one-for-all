SELECT c1.music_name AS nome, COUNT(c2.music_id) AS reproducoes FROM SpotifyClone.musics AS c1
INNER JOIN SpotifyClone.history AS c2
ON c1.music_id = c2.music_id 
INNER JOIN SpotifyClone.user AS c3
ON c2.user_id  = c3.user_id 
WHERE id_service = 1 OR id_service = 4
GROUP BY c2.history_reproductions,  c1.music_name
ORDER BY c1.music_name ASC
