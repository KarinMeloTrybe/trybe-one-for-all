SELECT COUNT(c1.music_id) AS quantidade_musicas_no_historico FROM SpotifyClone.history AS c1
INNER JOIN SpotifyClone.user AS c2
ON c1.user_id = c2.user_id 
WHERE c2.user_name IN ('Barbara Liskov')