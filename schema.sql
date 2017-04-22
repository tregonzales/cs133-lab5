drop table if exists Person;
drop table if exists Car;
drop table if exists DrivesThere;
drop table if exists DrivesBack;
drop table if exists RidesThere;
drop table if exists RidesBack;

.header on
.mode column
PRAGMA foreign_keys = ON;

CREATE TABLE Person (
id INT,
name CHAR(20),
PRIMARY KEY(id)
); 

CREATE TABLE DrivesThere (
--id INT,
lpn CHAR(7),
day date,
t time,
PRIMARY KEY(lpn,day),
FOREIGN KEY (lpn) REFERENCES Car
);

CREATE TABLE DrivesBack (
--id INT,
lpn CHAR(7),
day date,
t time,
PRIMARY KEY(lpn,day),
FOREIGN KEY (lpn) REFERENCES Car
);

CREATE TABLE RidesThere (
id INT,
day date,
lpn CHAR(7),
t time,
PRIMARY KEY(id,day),
FOREIGN KEY (id) REFERENCES Person,
FOREIGN KEY (lpn) REFERENCES Car
);

CREATE TABLE RidesBack (
id INT,
day date,
lpn CHAR(7),
t time,
PRIMARY KEY(id,day),
FOREIGN KEY (id) REFERENCES Person,
FOREIGN KEY (lpn) REFERENCES Car
);

CREATE TABLE Car (
lpn CHAR(7),
mm CHAR(25),
capacity INT,
id INT,
PRIMARY KEY (lpn),
FOREIGN KEY (id) REFERENCES Person
); 


