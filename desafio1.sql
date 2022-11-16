DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.service(
      plan_name VARCHAR(20) NOT NULL,
      id_service INT AUTO_INCREMENT PRIMARY KEY,
      value_plan DECIMAL(5, 2) NOT NULL
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      user_name VARCHAR(100) NOT NULL,
      user_id INT AUTO_INCREMENT PRIMARY KEY,
      user_age INT NOT NULL,
      signature_date DATE NOT NULL,
      id_service INT NOT NULL,
      FOREIGN KEY (id_service) REFERENCES SpotifyClone.service (id_service)
  ) engine = InnoDB; 

  CREATE TABLE SpotifyClone.artist(
    artist_id INT AUTO_INCREMENT PRIMARY KEY,
    artist_name VARCHAR(100) NOT NULL
  ) engine = InnoDB;


  CREATE TABLE SpotifyClone.albuns(
     album_id INT AUTO_INCREMENT PRIMARY KEY,
     album_name VARCHAR(45) NOT NULL,
     artist_id INT NOT NULL,
     date_create YEAR NOT NULL,
     FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id)
  ) engine = InnoDB;

 CREATE TABLE SpotifyClone.musics(
    music_id INT AUTO_INCREMENT PRIMARY KEY,
    music_name VARCHAR(45) NOT NULL,
    duration_musics INT NOT NULL,
    artist_id INT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id),
    FOREIGN KEY (album_id) REFERENCES SpotifyClone.albuns (album_id)
  ) engine = InnoDB;

 CREATE TABLE SpotifyClone.history(
      history_reproductions VARCHAR(20),
      user_id INT NOT NULL,
      music_id INT NOT NULL,
      date_reproduction DATETIME NOT NULL,
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user (user_id),
      FOREIGN KEY (music_id) REFERENCES SpotifyClone.musics (music_id),
      PRIMARY KEY (user_id, music_id)
  ) engine = InnoDB;

   CREATE TABLE SpotifyClone.artist_followers(
      user_id INT,
      artist_id INT,
      FOREIGN KEY (user_id) REFERENCES SpotifyClone.user (user_id),
      FOREIGN KEY (artist_id) REFERENCES SpotifyClone.artist (artist_id),
      PRIMARY KEY (user_id, artist_id)
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.service (plan_name, value_plan)
  VALUES
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('pessoal', 6.99);

  INSERT INTO SpotifyClone.user(user_name, user_age, id_service, signature_date)
  VALUES
    ('Barbara Liskov', 82, 01, '2019-10-20'),
    ('Robert Cecil Martin', 58, 01, '2017-01-06'),
    ('Ada Lovelace', 37, 02, '2017-12-30'),
    ('Martin Fowler', 46, 02, '2017-01-17'),
    ('Sandi Metz', 58, 02, '2018-04-29'),
    ('Paulo Freire', 19, 03, '2018-02-14'),
    ('Bell Hooks', 26, 03, '2018-01-05'),
    ('Christopher Alexander', 85, 04, '2019-06-05'),
    ('Judith Butler', 45, 04, '2020-05-13'),
    ('Jorge Amado', 58, 04, '2017-02-17'); 

INSERT INTO SpotifyClone.artist (artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');


  INSERT INTO SpotifyClone.albuns (album_name, artist_id, date_create)
  VALUES
    ('Renaissance', 1, 2022),
    ('Jazz', 2, 1978),
    ('Hot Space', 2, 1982),
    ('Falso Brilhante', 3, 1998),
    ('Vento de Maio', 3, 2001),
    ('QVVJFA?', 4, 2003),
    ('Somewhere Far Beyond', 5, 2007),
    ('I Put A Spell On You', 6, 2012);

     INSERT INTO SpotifyClone.musics (music_name, artist_id, album_id, duration_musics)
  VALUES
    ('BREAK MY SOUL', 1, 1, 279),
    ('VIRGO’S GROOVE', 1, 1, 369),
    ('ALIEN SUPERSTAR', 1, 1, 116),
    ('Don’t Stop Me Now', 2, 2, 203),
    ('Under Pressure', 2, 3, 152),
    ('Como Nossos Pais', 3, 4, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 3, 5, 207),
    ('Samba em Paris', 4, 6, 267),
    ('The Bard’s Song', 5, 7, 244),
    ('Feeling Good', 6, 8, 100);

     INSERT INTO SpotifyClone.history (user_id, music_id, date_reproduction)
  VALUES
    (1, 8, '2022-02-28 10:45:55'),
    (1, 2, '2020-05-02 05:30:35'),
    (1, 10, '2020-03-06 11:22:33'),
    (2, 10, '2022-08-05 08:05:17'),
    (2, 7, '2020-01-02 07:40:33'),
    (3, 10, '2020-11-13 16:55:13'),
    (3, 2, '2020-12-05 18:38:30'),
    (4, 8, '2021-08-15 17:10:10'),
    (5, 8, '2022-01-09 01:44:33'),
    (5, 5, '2020-08-06 15:23:43'),
    (6, 7, '2017-01-24 00:31:17'),
    (6, 1, '2017-10-12 12:35:20'),
    (7, 4, '2011-12-15 22:30:49'),
    (8, 4, '2012-03-17 14:56:41'),
    (9, 9, '2022-02-24 21:14:22'),
    (10, 3, '2015-12-13 08:30:22');

     INSERT INTO SpotifyClone.artist_followers (user_id, artist_id)
  VALUES
    (01, 01),
    (01, 02),
    (01, 03),
    (02, 01),
    (02, 03),
    (03, 02),
    (04, 04),
    (05, 05),
    (05, 06),
    (06, 06),
    (06, 01),
    (07, 06),
    (09, 03),
    (10, 02); 