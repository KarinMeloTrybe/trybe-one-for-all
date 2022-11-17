SELECT c1.user_name  AS usuario, IF(YEAR(MAX(c2.date_reproduction))>= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario FROM SpotifyClone.user AS c1
INNER JOIN SpotifyClone.history AS c2
ON c1.user_id = c2.user_id 
GROUP BY c1.user_name 
ORDER BY c1.user_name ASC
