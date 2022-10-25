SELECT MUS.name AS nome, COUNT(HIS.musicas_id) AS reproducoes
FROM SpotifyClone.music AS MUS
INNER JOIN SpotifyClone.history AS HIS
ON MUS.id = HIS.musicas_id
INNER JOIN SpotifyClone.user AS USR
ON HIS.user_id = USR.id
INNER JOIN SpotifyClone.subscription AS SUB
ON USR.subscription_id = SUB.id
WHERE SUB.id IN (1, 4)
GROUP BY HIS.musicas_id
ORDER BY nome ASC
;