CREATE TABLE professors(
  ssn char(11) PRIMARY KEY
);

CREATE TABLE courses(
  cid varchar(255) PRIMARY KEY
);

CREATE TABLE teaches (
  cid varchar(255),
  semester varchar(255),
  ssn char(11),
  PRIMARY KEY pk(cid, ssn),
  FOREIGN KEY (cid) REFERENCES courses (cid),
  FOREIGN KEY (ssn) REFERENCES professors (ssn)
);