CREATE DATABASE IF NOT EXISTS ufo_sightings;
CREATE DATABASE IF NOT EXISTS test;
USE ufo_sightings;
source docker-entrypoint-initdb.d/ufo-database.sql