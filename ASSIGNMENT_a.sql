USE busDB;
DROP PROCEDURE IF EXISTS ASSIGNMENT_a;

DELIMITER //
CREATE PROCEDURE ASSIGNMENT_a(IN Bus_Stop_Name TEXT)
BEGIN
SELECT DISTINCT
    trip_headsign
FROM
    busDB.trips T
WHERE
    T.trip_id IN (SELECT DISTINCT
            trip_id
        FROM
            busDB.stopTimes ST
        WHERE
            ST.stop_id IN (SELECT DISTINCT
                    stop_id
                FROM
                    busDB.stops S
                WHERE
                    S.name_stop = Bus_Stop_Name));
END;//


