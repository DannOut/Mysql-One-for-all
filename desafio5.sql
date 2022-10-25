SELECT M.name AS cancao, COUNT(H.musicas_id) AS reproducoes
FROM SpotifyClone.music AS M
INNER JOIN SpotifyClone.history AS H
ON H.musicas_id = M.id
GROUP BY cancao
ORDER BY reproducoes DESC, cancao ASC
LIMIT 2;