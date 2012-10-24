CREATE TABLE professors(
  ssn char(11) PRIMARY KEY
);

CREATE TABLE semesters(
  sid varchar(255) PRIMARY KEY
);

CREATE TABLE courses(
  cid varchar(255) PRIMARY KEY
);

CREATE TABLE teaches (
  cid varchar(255),
  sid varchar(255),
  ssn char(11),
  PRIMARY KEY pk(cid, sid, ssn),
  FOREIGN KEY (sid) REFERENCES semesters (sid),
  FOREIGN KEY (cid) REFERENCES courses (cid),
  FOREIGN KEY (ssn) REFERENCES professors (ssn)
);