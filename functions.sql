USE busDB;
DROP PROCEDURE IF EXISTS ASSIGNMENT_a;
DROP PROCEDURE IF EXISTS ASSIGNMENT_b;
DROP PROCEDURE IF EXISTS ASSIGNMENT_c;
DROP PROCEDURE IF EXISTS ASSIGNMENT_d;

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

DELIMITER //
CREATE PROCEDURE ASSIGNMENT_c(IN Bus_Stop_Name TEXT, IN Route_Name VARCHAR(11))
BEGIN
SELECT DISTINCT
    ST.arrival_time, ST.departure_time,ST.trip_id
FROM
    busDB.stopTimes ST
WHERE
    ST.trip_id IN (SELECT distinct T.trip_id
        FROM
            busDB.trips T
        WHERE
            T.trip_headsign = Bus_Stop_Name
                AND T.route_id =Route_Name
                GROUP BY T.service_id)
                AND ST.stop_sequence=1;
END;//




DELIMITER //
CREATE PROCEDURE ASSIGNMENT_d(IN Bus_Stop_Name TEXT)
BEGIN




END;//