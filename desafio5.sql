SELECT c1.music_name AS cancao, COUNT(c2.user_id) AS reproducoes FROM SpotifyClone.musics AS c1
INNER JOIN SpotifyClone.history AS c2
ON c1.music_id = c2.music_id 
GROUP BY c1.music_name 
ORDER BY reproducoes  DESC, c1.music_name  ASC
LIMIT 2
