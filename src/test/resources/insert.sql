CREATE SEQUENCE TEST_RUN_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE TEST_CASE_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE STATUS_SEQ START WITH 1 INCREMENT BY 1;
CREATE SEQUENCE CONFIGURATION_SEQ START WITH 1 INCREMENT BY 1;

CREATE SCHEMA REF;
CREATE TABLE REF.STATUS (ID INTEGER NOT NULL, NAME VARCHAR(255), PRIMARY KEY (ID), CONSTRAINT UNIQUE_NAME UNIQUE (NAME) );
INSERT INTO REF.STATUS VALUES (nextval('STATUS_SEQ'), 'Created');
INSERT INTO REF.STATUS VALUES (nextval('STATUS_SEQ'), 'Queued');
INSERT INTO REF.STATUS VALUES (nextval('STATUS_SEQ'), 'Executed');

CREATE SCHEMA A;
CREATE TABLE A.CONFIGURATION (ID INTEGER NOT NULL, "KEY" BINARY(1000) NOT NULL, NAME VARCHAR(255), USERNAME VARCHAR(255), PASSWORD VARCHAR(255), PRIMARY KEY (ID), CONSTRAINT UNIQUE_NAME UNIQUE (NAME) );
CREATE TABLE A.TEST_RUN (ID INTEGER NOT NULL, CONFIGURATION_ID INTEGER, NAME VARCHAR(255), PRIMARY KEY (ID), CONSTRAINT FK_TESTRUN_CONFIGURATION FOREIGN KEY (CONFIGURATION_ID) REFERENCES A.CONFIGURATION (ID) ON DELETE NO ACTION ON UPDATE NO ACTION);
CREATE TABLE A.TEST_CASE (ID INTEGER NOT NULL, TEST_RUN_ID INTEGER, STATUS_ID INTEGER, NAME VARCHAR(255), PRIMARY KEY (ID), CONSTRAINT FK_TEST_CASE_TEST_RUN FOREIGN KEY (TEST_RUN_ID) REFERENCES A.TEST_RUN (ID) ON DELETE NO ACTION ON UPDATE NO ACTION, CONSTRAINT FK_TEST_CASE_STATUS FOREIGN KEY (STATUS_ID) REFERENCES REF.STATUS (ID) ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE SCHEMA B;
CREATE TABLE B.CONFIGURATION (ID INTEGER NOT NULL, "KEY" BINARY(1000) NOT NULL, NAME VARCHAR(255), USERNAME VARCHAR(255), PASSWORD VARCHAR(255), PRIMARY KEY (ID), CONSTRAINT UNIQUE_NAME UNIQUE (NAME) );
CREATE TABLE B.TEST_RUN (ID INTEGER NOT NULL, CONFIGURATION_ID INTEGER, NAME VARCHAR(255), PRIMARY KEY (ID), CONSTRAINT FK_TESTRUN_CONFIGURATION FOREIGN KEY (CONFIGURATION_ID) REFERENCES B.CONFIGURATION (ID) ON DELETE NO ACTION ON UPDATE NO ACTION);

CREATE SCHEMA C;
CREATE TABLE C.CONFIGURATION (ID INTEGER NOT NULL, "KEY" BINARY(1000) NOT NULL, NAME VARCHAR(255), USERNAME VARCHAR(255), PASSWORD VARCHAR(255), PRIMARY KEY (ID), CONSTRAINT UNIQUE_NAME UNIQUE (NAME) );
CREATE TABLE C.TEST_RUN (ID INTEGER NOT NULL, CONFIGURATION_ID INTEGER, NAME VARCHAR(255), PRIMARY KEY (ID), CONSTRAINT FK_TESTRUN_CONFIGURATION FOREIGN KEY (CONFIGURATION_ID) REFERENCES C.CONFIGURATION (ID) ON DELETE NO ACTION ON UPDATE NO ACTION);

