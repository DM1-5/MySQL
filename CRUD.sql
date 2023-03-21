
DROP TABLE StaffPropCount;

CREATE TABLE StaffPropCount (
	staffNo VARCHAR(5),
	fname VARCHAR(20),
	lname VARCHAR(25),
	propCount INTEGER
);

INSERT INTO StaffPropCount 
(
	SELECT s.staffNo, fname, lname, COUNT(*)
	FROM Staff s, PropertyForRent p
	WHERE s.staffNo = p.staffNo
	GROUP BY staffNo, fname, lname
)
	UNION
(
	SELECT staffNo, fname, lname, 0
	FROM Staff s
	WHERE NOT EXISTS (
	SELECT * 
	FROM PropertyForRent p
	WHERE p.staffNo = s.staffNo)
);

SELECT * 
FROM StaffPropCount;

DELETE FROM StaffPropCount
WHERE (propCount = 0);

SELECT * 
FROM StaffPropCount;

UPDATE StaffPropCount
SET lname = 'hijadeputa'
WHERE propCount = 2;

SELECT * 
FROM StaffPropCount;