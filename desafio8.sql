SELECT AR.name AS artista, AL.album AS album
FROM SpotifyClone.artist AS AR
INNER JOIN SpotifyClone.album AS AL
ON AR.id = AL.artist_id
HAVING AR.name = 'Elis Regina';