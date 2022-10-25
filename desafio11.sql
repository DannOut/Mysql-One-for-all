SELECT name AS nome_musica, CASE
	WHEN music.id = 9 THEN REPLACE(music.name, "Bard", "QA")
    WHEN music.id = 7 THEN REPLACE(music.name, "Amar", "Code Review")
    WHEN music.id = 6 THEN REPLACE(music.name, "Pais", "Pull Requests")
    WHEN music.id = 1 THEN REPLACE(music.name, "SOUL" , "CODE")
    WHEN music.id = 3 THEN REPLACE(music.name, "SUPERSTAR", "SUPERDEV")
	ELSE music.name
END AS novo_nome
FROM SpotifyClone.music
WHERE music.id IN (9, 7, 6, 1, 3)
ORDER BY music.name DESC
;