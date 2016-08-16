DROP TABLE IF EXISTS news;
CREATE TABLE news (
  id    INT(11)      NOT NULL AUTO_INCREMENT,
  title VARCHAR(128) NOT NULL,
  slug  VARCHAR(128) NOT NULL,
  text  TEXT         NOT NULL,
  PRIMARY KEY (id),
  KEY slug (slug)
);

DROP TABLE IF EXISTS chat;
CREATE TABLE chat (
  id    INT(11)      NOT NULL AUTO_INCREMENT,
  sender VARCHAR(128) NOT NULL,
  text  TEXT         NOT NULL,
  PRIMARY KEY (id)
);