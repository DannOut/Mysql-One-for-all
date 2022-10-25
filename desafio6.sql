SELECT
	MIN(S.price) AS faturamento_minimo,
	MAX(S.price) AS faturamento_maximo,
	ROUND(AVG(S.price), 2) AS faturamento_medio,
	ROUND(SUM(S.price), 2) AS faturamento_total
FROM SpotifyClone.subscription AS S
INNER JOIN SpotifyClone.user AS U
ON U.subscription_id = S.id;