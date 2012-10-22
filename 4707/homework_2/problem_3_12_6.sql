CREATE TABLE team(
  tid varchar(255) PRIMARY KEY
);

CREATE TABLE professors(
  ssn varchar(255) PRIMARY KEY
);

CREATE TABLE courses(
  cid varchar(255) PRIMARY KEY
);

CREATE TABLE professors_teams(
  ssn varchar(255),
  tid varchar(255),
  PRIMARY KEY pk(ssn, tid),
  FOREIGN KEY (ssn) REFERENCES professors (ssn),
  FOREIGN KEY (tid) REFERENCES team (tid)
);

CREATE TABLE teaches(
  tid varchar(255),
  semester varchar(255),
  cid varchar(255)
  PRIMARY KEY teaches_pk(tid,cid),
  FOREIGN KEY(tid) REFERENCES team(tid),
  FOREIGN KEY(cid) REFERENCES course(cid)
);
