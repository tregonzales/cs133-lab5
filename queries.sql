--EXERCISE 4)1.

BEGIN TRANSACTION;

SELECT C.id
FROM DrivesThere DT, Car C
WHERE DT.lpn = C.lpn AND DT.day = 2017-11-20 AND C.id NOT IN (
											SELECT C2.id
											FROM DrivesBack DB, Car C2
											WHERE DB.day = 2017-11-20 AND DB.lpn = C2.lpn
																						);

SELECT C.id
FROM DrivesBack DB, Car C
WHERE DB.lpn = C.lpn AND DB.day = 2017-11-20 AND C.id NOT IN (
											SELECT C2.id
											FROM DrivesThere DT, Car C2
											WHERE DT.day = 2017-11-20 AND DT.lpn = C2.lpn
																			);
END TRANSACTION;
/*
-- 2.
BEGIN TRANSACTION;

SELECT id
FROM RidesThere RT
WHERE RT.day = 2017-11-20 AND RT.id NOT IN (
											SELECT id
											FROM RidesBack RB
											WHERE RB.day = 2017-11-20
																	);
END TRANSACTION;

-- 3.
BEGIN TRANSACTION;

SELECT COUNT(RT.id) AS passengers
FROM RidesThere RT, Car C
WHERE RT.day = 2017-11-20 AND C.lpn = RT.lpn 
GROUP BY RT.lpn
HAVING passengers < 1 OR passengers > C.capacity-1;

END TRANSACTION;

--Exercise 5
--1 The keller problem.  
BEGIN TRANSACTION;

SELECT COUNT(RT.id) AS passengers
FROM RidesThere RT, Car C
WHERE RT.day = 2017-11-20 AND C.lpn = RT.lpn 
GROUP BY RT.lpn
HAVING passengers < C.capacity-1 AND RT.t > (
											SELECT RT2.t
											FROM RidesThere RT2, Person P
											WHERE RT2.id = P.id AND RT2.day = 2017-11-20 AND P.name='Bob'
											);

END TRANSACTION;

--2. 
BEGIN TRANSACTION;

DELETE FROM RidesThere
WHERE RidesThere.id IN (
						SELECT id 
						FROM Person
						WHERE RidesThere.id = Person.id AND Person.name = 'Bob'
						);

DELETE FROM RidesBack
WHERE RidesBack.id IN (
						SELECT id 
						FROM Person
						WHERE RidesBack.id = Person.id AND Person.name = 'Bob'
						);

INSERT INTO DrivesThere (lpn, day, t) VALUES ('3333333', 2017-11-20, '06:00');
INSERT INTO DrivesBack (lpn, day, t) VALUES ('3333333', 2017-11-20, '22:00');

END TRANSACTION;
*/


