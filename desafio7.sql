SELECT AR.name AS artista, AL.album AS album, COUNT(FO.user_id) AS seguidores
FROM SpotifyClone.artist AS AR
INNER JOIN SpotifyClone.album AS AL
ON AR.id = AL.artist_id
INNER JOIN SpotifyClone.following AS FO
ON FO.artist_id = AR.id
GROUP BY album
ORDER BY seguidores DESC, artista ASC, album ASC;