DROP TABLE treatment_event;
DROP TABLE translation;
DROP TABLE state;
DROP TABLE location;
DROP TABLE admission;
DROP TABLE patient;

CREATE TABLE patient (patientId VARCHAR(255) PRIMARY KEY, patientName VARCHAR(255) NOT NULL, firstSurname VARCHAR(255) NOT NULL, secondSurname VARCHAR(255), healthCardIdentifier VARCHAR(255));

CREATE TABLE admission (admissionId VARCHAR(255) PRIMARY KEY, hospitalCareType ENUM('quirurgic', 'urgencies') NOT NULL, startDate DATETIME NOT NULL, finalDate DATETIME, patientId VARCHAR(255) NOT NULL, FOREIGN KEY (patientId) REFERENCES patient(patientId));

CREATE TABLE location (locationId VARCHAR(255) PRIMARY KEY, locationName VARCHAR(255) NOT NULL);

CREATE TABLE state (stateId VARCHAR(255) PRIMARY KEY, stateType  ENUM('personalitzat', 'generic') NOT NULL, locationId VARCHAR(255), FOREIGN KEY (locationId) REFERENCES location(locationId));

CREATE TABLE translation (translationId VARCHAR(255) PRIMARY KEY, translatedText VARCHAR(255) NOT NULL, translationIdiom  ENUM('ca', 'es', 'en', 'any') NOT NULL, stateId VARCHAR(255) NOT NULL, FOREIGN KEY (stateId) REFERENCES state(stateId));

CREATE TABLE treatment_event (eventId VARCHAR(255) PRIMARY KEY, startTime DATETIME, stateId VARCHAR(255) NOT NULL, admissionId VARCHAR(255) NOT NULL, FOREIGN KEY (stateId) REFERENCES state(stateId), FOREIGN KEY (admissionId) REFERENCES admission(admissionId));
