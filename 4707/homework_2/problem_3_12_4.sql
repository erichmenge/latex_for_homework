CREATE TABLE courses(
  cid varchar(255) PRIMARY KEY
);

CREATE TABLE professors(
  ssn char(11) PRIMARY KEY,
  cid varchar(255),
  semester varchar(255),
  FOREIGN KEY (cid) REFERENCES courses (cid)
);