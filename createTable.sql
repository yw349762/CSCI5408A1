SET SQL_SAFE_UPDATES = 0;
DROP DATABASE  IF EXISTS busDB;
CREATE DATABASE IF NOT EXISTS busDB;
USE busDB;


CREATE TABLE stops(
stop_id INT NOT NULL UNIQUE,
name_stop TEXT,
lat DOUBLE,
log DOUBLE,
PRIMARY KEY (stop_id)
);

 
CREATE TABLE trips(
block_id VARCHAR(11),
route_id VARCHAR(11),
trip_headsign text,
service_id VARCHAR(255),
shape_id VARCHAR(11),
trip_id  VARCHAR(255) NOT NULL UNIQUE,
PRIMARY KEY (trip_id)
);

CREATE TABLE stopTimes(
trip_id  VARCHAR(255),
arrival_time TIME,
departure_time TIME,
stop_id INT,
stop_sequence INT,
FOREIGN KEY (trip_id)
        REFERENCES trips(trip_id),
FOREIGN KEY (stop_id)
        REFERENCES stops(stop_id)
);



