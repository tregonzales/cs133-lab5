--EXERCISE 4)1.

BEGIN TRANSACTION;

SELECT C.id
FROM DrivesThere DT, Car C
WHERE DT.lpn = C.lpn AND DT.day = '2017-11-20' AND C.id NOT IN (
											SELECT C2.id
											FROM DrivesBack DB, Car C2
											WHERE DB.day = '2017-11-20' AND DB.lpn = C2.lpn
																						);

SELECT C.id
FROM DrivesBack DB, Car C
WHERE DB.lpn = C.lpn AND DB.day = '2017-11-20' AND C.id NOT IN (
											SELECT C2.id
											FROM DrivesThere DT, Car C2
											WHERE DT.day = '2017-11-20' AND DT.lpn = C2.lpn
																			);
END TRANSACTION;

-- 2.
BEGIN TRANSACTION;

SELECT id
FROM RidesThere RT
WHERE RT.day = '2017-11-20' AND RT.id NOT IN (
											SELECT id
											FROM RidesBack RB
											WHERE RB.day = '2017-11-20'
																	);
END TRANSACTION;


-- 3.

BEGIN TRANSACTION;

SELECT C.lpn, C.capacity, COUNT(RT.id) AS passengers
FROM DrivesThere DT LEFT JOIN RidesThere RT ON DT.lpn = RT.lpn, Car C
WHERE DT.day = '2017-11-20' AND C.lpn = DT.lpn 
GROUP BY DT.lpn
HAVING passengers < 1 OR passengers > C.capacity-1;

END TRANSACTION;


--Exercise 5
--1 The keller problem. 

BEGIN TRANSACTION;

SELECT C.lpn, RT.t, COUNT(RT.id) AS passengers
FROM RidesThere RT, Car C
WHERE RT.day = '2017-11-20' AND C.lpn = RT.lpn 
GROUP BY RT.lpn
HAVING passengers < C.capacity-1 AND RT.t > (
											SELECT RT2.t
											FROM RidesThere RT2, Person P
											WHERE RT2.id = P.id AND RT2.day = '2017-11-20' AND P.id=3
											);

END TRANSACTION;

--2. 

BEGIN TRANSACTION;

DELETE FROM RidesThere
WHERE RidesThere.id IN (
						SELECT id 
						FROM Person
						WHERE RidesThere.id = 3 
						);

DELETE FROM RidesBack
WHERE RidesBack.id IN (
						SELECT id 
						FROM Person
						WHERE RidesBack.id = 3 
						);

INSERT INTO DrivesThere (lpn, day, t) VALUES ('3333333', '2017-11-20', '06:00');
INSERT INTO DrivesBack (lpn, day, t) VALUES ('3333333', '2017-11-20', '22:00');

END TRANSACTION;

--Exercise 6
--1.

BEGIN TRANSACTION;

SELECT P.name as driver, C.mm as car, DT.t as Going, DB.t as Leaving
FROM DrivesThere DT, DrivesBack DB, Car C, Person P
WHERE DT.lpn = DB.lpn AND C.lpn = DT.lpn AND C.lpn = DB.lpn AND C.id = P.id AND P.name = 'Bob';

SELECT PC1.name as driver1, C1.mm as car1, RT.t as going, PC2.name as driver2, C2.mm as car2, RB.t as leaving
FROM RidesThere RT, RidesBack RB, Car C1, Car C2, Person PC1, Person PC2, Person P1, Person P2
WHERE C1.lpn = RT.lpn AND C2.lpn = RB.lpn AND C1.id = PC1.id AND C2.id = PC2.id AND RT.id = P1.id AND RB.id = P2.id
AND P1.name = 'Bob' AND P2.name = 'Bob';

END TRANSACTION;


--2.
SELECT P.name as driver, Count(DT.day) as daysDriving
FROM DrivesThere DT, Car C, Person P
WHERE DT.lpn = C.lpn AND C.id = P.id
GROUP BY C.id;








