SELECT U.user AS usuario, 
	IF( MAX(YEAR(H.reproduction_date)) >= 2021, 'Usuário ativo', 'Usuário inativo') AS status_usuario
	FROM SpotifyClone.user AS U
	INNER JOIN SpotifyClone.history AS H
	ON H.user_id = U.id
GROUP BY usuario;