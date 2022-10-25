SELECT U.user As "usuario",
  COUNT(H.user_id) AS "qt_de_musicas_ouvidas",
  ROUND(SUM(M.duration / 60), 2)  AS total_minutos
FROM SpotifyClone.user AS U
INNER JOIN
  SpotifyClone.history AS H ON U.id = H.user_id
INNER JOIN
  SpotifyClone.music AS M ON M.id = H.musicas_id
GROUP BY U.user
ORDER BY U.user;