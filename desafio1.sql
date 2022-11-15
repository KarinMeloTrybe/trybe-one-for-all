DROP DATABASE IF EXISTS SpotifyClone;

  CREATE SCHEMA IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.service(
      plan_name VARCHAR(20),
      id_service TINYINT AUTO_INCREMENT PRIMARY KEY,
      value_plan TINYINT
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.artist(
    artist_id TINYINT AUTO_INCREMENT PRIMARY KEY,
      artist_name VARCHAR(20)
  ) engine = InnoDB;

  CREATE TABLE SpotifyClone.user(
      user_name VARCHAR(45),
      user_id TINYINT AUTO_INCREMENT PRIMARY KEY,
      user_age TINYINT,
      id_service TINYINT,
      CONSTRAINT FOREIGN KEY (id_service) REFERENCES service (id_service)
  ) engine = InnoDB; 

  CREATE TABLE SpotifyClone.albuns(
     album_id TINYINT AUTO_INCREMENT PRIMARY KEY,
     album_name VARCHAR(45)
     artist_id TINYINT,
     CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
     date_create DATE,
  ) engine = InnoDB;

 CREATE TABLE SpotifyClone.musics(
      music_id TINYINT AUTO_INCREMENT PRIMARY KEY,
      music_name VARCHAR(20),
      artist_id TINYINT,
     CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
    album_id TINYINT,
     CONSTRAINT FOREIGN KEY (album_id) REFERENCES albuns (album_id)
    duration_musics TINYINT,
  ) engine = InnoDB;

 CREATE TABLE SpotifyClone.history(
      PRIMARY KEY (user_id, music_id),
      history_reproductions VARCHAR(20),
      user_id TINYINT,
      CONSTRAINT FOREIGN KEY (user_id) REFERENCES user (user_id),
      date_reproduction DATE,
      music_id TINYINT,
      CONSTRAINT FOREIGN KEY (music_id) REFERENCES musics (music_id)
  ) engine = InnoDB;

   CREATE TABLE SpotifyClone.artist_followers(
     PRIMARY KEY (user_id, artist_id),
      user_id TINYINT,
      CONSTRAINT FOREIGN KEY (user_id) REFERENCES user (user_id),
      artist_id TINYINT,
      CONSTRAINT FOREIGN KEY (artist_id) REFERENCES artist (artist_id)
  ) engine = InnoDB;


  INSERT INTO SpotifyClone.service (plan_name, value_plan)
  VALUES
    ('gratuito', 0.00),
    ('gratuito', 0.00),
    ('familiar', 7.99),
    ('familiar', 7.99),
    ('familiar', 7.99),
    ('universitário', 5.99),
    ('universitário', 5.99),
    ('pessoal', 6.99),
    ('pessoal', 6.99),
    ('pessoal', 6.99);

INSERT INTO SpotifyClone.artist(artist_name)
  VALUES
    ('Beyoncé'),
    ('Queen'),
    ('Elis Regina'),
    ('Baco Exu do Blues'),
    ('Blind Guardian'),
    ('Nina Simone');

  INSERT INTO SpotifyClone.user(user_name, user_age, id_service)
  VALUES
    ('Barbara Liskov', 82, 1),
     ('Robert Cecil Martin', 58, 1),
      ('Ada Lovelace', 37, 2),
        ('Martin Fowler', 46, 2),
       ('Sandi Metz', 58, 2),
       ('Paulo Freire', 19, 3),
       ('Bell Hooks', 26, 3),
        ('Christopher Alexander', 85, 4),
         ('Judith Butler', 45, 4),
         ('Jorge Amado', 58, 4);

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
    ('Don’t Stop Me Now', 2, 203),
    ('Under Pressure', 2, 152),
    ('Como Nossos Pais', 3, 105),
    ('O Medo de Amar é o Medo de Ser Livre', 3, 207),
    ('Samba em Paris', 4, 267),
    ('The Bard’s Song', 5, 244),
    ('Feeling Good', 6, 100);

     INSERT INTO SpotifyClone.history (user_id, music_id, date_reproduction)
  VALUES
    (1, 8, 2022-02-28 10:45:55),
    (1, 2, 2020-05-02 05:30:35),
    (1, 10, 2020-03-06 11:22:33),
    (2, 10, 2022-08-05 08:05:17),
    (2, 7, 2020-01-02 07:40:33),
    (3, 10, 2020-11-13 16:55:13),
    (3, 2, 2020-12-05 18:38:30),
    (4, 8, 2021-08-15 17:10:10),
    (5, 8, 2022-01-09 01:44:33),
    (5, 5, 2020-08-06 15:23:43),
    (6, 7, 2017-01-24 00:31:17),
    (6, 1, 2017-10-12 12:35:20),
    (7, 4, 2011-12-15 22:30:49),
    (8, 4, 2012-03-17 14:56:41),
    (9, 9, 2022-02-24 21:14:22),
    (10, 3, 2015-12-13 08:30:22);

     INSERT INTO SpotifyClone.artist_followers (user_id, artist_id)
  VALUES
    (1, 1),
    (1, 2),
    (1, 3),
    (2, 1),
    (2, 3),
    (3, 2),
    (4, 4),
    (5, 5),
    (5, 6),
    (7, 6),
    (9, 1);