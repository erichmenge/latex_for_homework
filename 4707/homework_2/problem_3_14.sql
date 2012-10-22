CREATE TABLE employees(
  ssn char(11) PRIMARY KEY,
  salary integer,
  phone char(13)
);

CREATE TABLE dna(
  dname varchar(255) PRIMARY KEY,
  budget integer
);

CREATE TABLE children(
  name varchar(255) PRIMARY KEY,
  age integer
);

CREATE TABLE employees_manage_dna(
  dname varchar(255) PRIMARY KEY,
  ssn char(11),
  FOREIGN KEY(dname) REFERENCES dna(dname),
  FOREIGN KEY(ssn) REFERENCES employees(ssn)
);

CREATE TABLE employees_work_dna(
  dname varchar(255),
  ssn char(11),
  PRIMARY KEY ewd_pk(ssn, dname),
  FOREIGN KEY(ssn) REFERENCES employees(ssn),
  FOREIGN KEY(dname) REFERENCES dna(dname)
);

CREATE TABLE employees_have_children(
  name varchar(255),
  ssn char(11),
  PRIMARY KEY ehc_pk(name, ssn),
  FOREIGN KEY(ssn) REFERENCES employees(ssn) ON DELETE CASCADE,
  FOREIGN KEY(name) REFERENCES children(name) ON DELETE CASCADE
);
