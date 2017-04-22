INSERT INTO Person (id, name) VALUES (1, "Beth");
INSERT INTO Person (id, name) VALUES (2, "Dodds");
INSERT INTO Person (id, name) VALUES (3, "Bob");
INSERT INTO Person (id, name) VALUES (4, "The Stone");
INSERT INTO Person (id, name) VALUES (5, "Z");
INSERT INTO Person (id, name) VALUES (6, "Kate");
INSERT INTO Person (id, name) VALUES (7, "Ben");

INSERT INTO Car (lpn, mm, capacity, id) VALUES ("0000000", "ford fiesta", 5, 2);
INSERT INTO Car (lpn, mm, capacity, id) VALUES ("1111111", "toyota prius", 5, 6);
INSERT INTO Car (lpn, mm, capacity, id) VALUES ("2222222", "gmc big ass van", 7, 4);
INSERT INTO Car (lpn, mm, capacity, id) VALUES ("3333333", "64 impala", 5, 3);
INSERT INTO Car (lpn, mm, capacity, id) VALUES ("4444444", "Beths car", 5, 1);

--beth and stone are driving
INSERT INTO DrivesThere (lpn, day, t) VALUES ("4444444", 2017-11-20, "06:00");
INSERT INTO DrivesThere (lpn, day, t) VALUES ("2222222", 2017-11-20, "07:00");

INSERT INTO DrivesBack (lpn, day, t) VALUES ("4444444", 2017-11-20, "16:00");
INSERT INTO DrivesBack (lpn, day, t) VALUES ("1111111", 2017-11-20, "23:00");

--rides there
--whose in beths car
INSERT INTO RidesThere (id, lpn, day, t) VALUES (6, "4444444", 2017-11-20, "06:00");
INSERT INTO RidesThere (id, lpn, day, t) VALUES (7, "4444444", 2017-11-20, "06:00");
INSERT INTO RidesThere (id, lpn, day, t) VALUES (2, "4444444", 2017-11-20, "06:00");

--whose in stones car
INSERT INTO RidesThere (id, lpn, day, t) VALUES (5, "2222222", 2017-11-20, "05:00");
INSERT INTO RidesThere (id, lpn, day, t) VALUES (3, "2222222", 2017-11-20, "05:00");

--rides back
--whose in beths car
INSERT INTO RidesBack (id, lpn, day, t) VALUES (6, "4444444", 2017-11-20, "16:00");
INSERT INTO RidesBack (id, lpn, day, t) VALUES (7, "4444444", 2017-11-20, "16:00");
INSERT INTO RidesBack (id, lpn, day, t) VALUES (2, "4444444", 2017-11-20, "16:00");

--whose in stones car
INSERT INTO RidesBack (id, lpn, day, t) VALUES (5, "2222222", 2017-11-20, "23:00");
INSERT INTO RidesBack (id, lpn, day, t) VALUES (3, "2222222", 2017-11-20, "23:00");