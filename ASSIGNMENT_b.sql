USE busDB;
DROP PROCEDURE IF EXISTS ASSIGNMENT_b;
DELIMITER //
CREATE PROCEDURE ASSIGNMENT_b(IN Time_Range_1 TIME, IN Time_Range_2 TIME)
BEGIN
SELECT DISTINCT
    T.trip_headsign
FROM
    busDB.trips T
WHERE
    T.trip_id IN (SELECT DISTINCT
            ST.trip_id
        FROM
            busDB.stopTimes ST
        WHERE
            Time_Range_1 <= ST.arrival_time
                AND Time_Range_2 >= ST.departure_time);
END;//
