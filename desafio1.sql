DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.artist(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
    UNIQUE INDEX `nome_UNIQUE` (`name` ASC) VISIBLE
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.album(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `album` VARCHAR(100) NOT NULL,
    `release_year` INT UNSIGNED NOT NULL,
    `artist_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
    UNIQUE INDEX `album_UNIQUE` (`album` ASC) VISIBLE,
    INDEX `fk_album_artista1_idx` (`artist_id` ASC) VISIBLE,
    CONSTRAINT `fk_album_artista1`
      FOREIGN KEY (`artist_id`)
      REFERENCES `SpotifyClone`.`artist` (`id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.music(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(250) NOT NULL,
    `duration` INT UNSIGNED NOT NULL,
    `album_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `nome_UNIQUE` (`name` ASC) VISIBLE,
    INDEX `fk_musicas_album1_idx` (`album_id` ASC) VISIBLE,
    CONSTRAINT `fk_musicas_album1`
      FOREIGN KEY (`album_id`)
      REFERENCES `SpotifyClone`.`album` (`id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.subscription(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `plans` VARCHAR(45) NOT NULL,
    `price` DECIMAL(4,2) UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
    UNIQUE INDEX `plano_UNIQUE` (`plans` ASC) VISIBLE
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
    `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
    `user` VARCHAR(250) NOT NULL,
    `age` INT UNSIGNED NOT NULL,
    `subscription_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
    INDEX `fk_usuario_plano_assinatura_idx` (`subscription_id` ASC) VISIBLE,
    UNIQUE INDEX `user_UNIQUE` (`user` ASC) VISIBLE,
    CONSTRAINT `fk_usuario_plano_assinatura`
      FOREIGN KEY (`subscription_id`)
      REFERENCES `SpotifyClone`.`subscription` (`id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.history(
    `musicas_id` INT UNSIGNED NOT NULL,
    `user_id` INT UNSIGNED NOT NULL,
    `reproduction_date` DATETIME NOT NULL,
    PRIMARY KEY (`musicas_id`, `user_id`),
    INDEX `fk_musicas_has_usuario_usuario1_idx` (`user_id` ASC) VISIBLE,
    INDEX `fk_musicas_has_usuario_musicas1_idx` (`musicas_id` ASC) VISIBLE,
    CONSTRAINT `fk_musicas_has_usuario_musicas1`
      FOREIGN KEY (`musicas_id`)
      REFERENCES `SpotifyClone`.`music` (`id`),
    CONSTRAINT `fk_musicas_has_usuario_usuario1`
      FOREIGN KEY (`user_id`)
      REFERENCES `SpotifyClone`.`user` (`id`)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.following(
    `user_id` INT UNSIGNED NOT NULL,
    `artist_id` INT UNSIGNED NOT NULL,
    PRIMARY KEY (`user_id`, `artist_id`),
    INDEX `fk_user_has_artist_artist1_idx` (`artist_id` ASC) VISIBLE,
    INDEX `fk_user_has_artist_user1_idx` (`user_id` ASC) VISIBLE,
    CONSTRAINT `fk_user_has_artist_user1`
      FOREIGN KEY (`user_id`)
      REFERENCES `SpotifyClone`.`user` (`id`),
    CONSTRAINT `fk_user_has_artist_artist1`
      FOREIGN KEY (`artist_id`)
      REFERENCES `SpotifyClone`.`artist` (`id`)
  ) engine = InnoDB;

  -- INSERT INTO SpotifyClone.tabela1 (coluna1, coluna2)
  -- VALUES
  --   ('exemplo de dados 1', 'exemplo de dados A'),
  --   ('exemplo de dados 2', 'exemplo de dados B'),
  --   ('exemplo de dados 3', 'exemplo de dados C');

  -- INSERT INTO SpotifyClone.tabela2 (coluna1, coluna2)
  -- VALUES
  --   ('exemplo de dados 1', 'exemplo de dados X'),
  --   ('exemplo de dados 2', 'exemplo de dados Y');

  INSERT INTO SpotifyClone.subscription ( plans, price)
VALUES ('gratuito', 0.00),
('familiar', 7.99),
('universitário', 5.99),
('pessoal', 6.99);

INSERT INTO SpotifyClone.user (user, age, subscription_id)
VALUES ('Barbara Liskov', 82, 1),
('Robert Cecil Martin', 58, 1),
('Ada Lovelace', 37, 2),
('Martin Fowler', 46, 2),
('Sandi Metiz', 58, 2),
('Paulo Freire', 19, 3),
('Bell Hooks', 26, 3),
('Christopher Alexander', 85, 4),
('Judith Butler', 45, 4),
('Jorge Amado', 58, 4);

INSERT INTO SpotifyClone.artist (name)
VALUES ('Beyoncé'), ('Queen'), ('Elis Regina'), ('Baco Exu do Blues'), ('Blind Guardian'),
('Nina Simone');

INSERT INTO SpotifyClone.album (album, release_year, artist_id)
VALUES ('Renaissance', 2022, 1),
('Jazz', 1978, 2),
('Hot Space', 1982, 2),
('Falso Brilhante', 1998, 3),
('Vento de Maio', 2001, 3),
('QVVJFA?', 2003, 4),
('Somewhere Far Beyond', 2007, 5),
('I Put A Spell On You', 2012, 6);

INSERT INTO SpotifyClone.music (name, duration, album_id)
VALUES ('BREAK MY SOUL', 279, 1),
("VIRGO'S", 369, 1),
("ALIEN SUPERSTAR", 116, 1),
("Don’t Stop Me Now", 203, 2),
("Under Pressure", 152, 3),
("Como Nossos Pais", 105, 4),
("O Medo de Amar é o Medo de Ser Livre", 207, 5),
("Samba em Paris", 267, 6),
("The Bard’s Song", 244, 7),
("Feeling Good", 100, 8);

INSERT INTO SpotifyClone.following (user_id, artist_id)
VALUES (1, 1), (1, 2), (1, 3),
(2, 1), (2, 3), (3, 2), (4, 4), (5, 5), (5, 6),
(6, 6), (6, 1), (7, 6), (9, 3), (10, 2);

INSERT INTO SpotifyClone.history ( musicas_id, user_id, reproduction_date)
VALUES (1, 8, "2022-02-28 10:45:55"), (1, 2, "2020-05-02 05:30:35"), (1, 10, "2020-03-06 11:22:33"),
(2, 10, "2022-08-05 08:05:17"), (2, 7, "2020-01-02 07:40:33"),
(3, 10, "2020-11-13 16:55:13"), (3, 7, "2020-12-05 18:38:30"),
(4, 8, "2021-08-15 17:10:10"),
(5, 8, "2022-01-09 01:44:33"), (5, 5, "2020-08-06 15:23:43"),
(6, 7, "2017-01-24 00:31:17"), (6, 1, "2017-10-12 12:35:20"),
(7, 4, "2011-12-15 22:30:49"),
(8, 4, "2012-03-17 14:56:41"),
(9, 9, "2022-02-24 21:14:22"),
(10, 3, "2015-12-13 08:30:22");