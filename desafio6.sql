SELECT MIN(c1.value_plan) AS faturamento_minimo, MAX(c1.value_plan) AS faturamento_maximo, ROUND(AVG(c1.value_plan), 2) AS faturamento_medio, ROUND(SUM(c1.value_plan), 2) AS faturamento_total FROM SpotifyClone.service  AS c1
INNER JOIN SpotifyClone.user AS c2
ON c1.id_service  = c2.id_service 				