SQL> CREATE TABLE USER(   USER_ID   INT              NOT NULL AUTO_INCREMENT,   USER_NAME VARCHAR (20)     NOT NULL,   PASSWORD  VARCHAR (20)     NOT NULL,       PRIMARY KEY (USER_ID));
CREATE TABLE  PROJECT(PROJECT_ID INT NOT NULL,PROJECT_NAME VARCHAR(50),PROJECT_DESCRIPTION VARCHAR(200),USER_ID   INT,PRIMARY KEY(PROJECT_ID),FOREIGN KEY(USER_ID) REFERENCES USER(USER_ID)--CONSTRAINT fk_user FOREIGN KEY (PROJECT_ID)--REFERENCES USER(USER_ID)  ON DELETE CASCADE  ON UPDATE CASCADE);
CREATE TABLE PROJECT_DETAIL(PROJECT_DETAIL_ID INT NOT NULL,TEAM_SIZE INT NULL,PROJECT_DURATION VARCHAR(20),PROJECT_START_DATE DATE,PROJECT_END_DATE DATE,PROJECT_TOOLS_USED VARCHAR(50),PROJECT_TEAM_MEMBER_ID VARCHAR(50),PROJECT_ID INT,PRIMARY KEY(PROJECT_DETAIL_ID),FOREIGN KEY(PROJECT_ID)REFERENCES PROJECT(PROJECT_ID) --CONSTRAINT fk_project FOREIGN KEY (PROJECT_DETAIL_ID)--REFERENCES PROJECT(PROJECT_ID)  ON DELETE CASCADE  ON UPDATE CASCADE  );  
CREATE TABLE EMPLOYEE(EMPLOYEE_ID INT NOT NULL,EMPLOYEE_NAME VARCHAR(50),EMPLOYEE_EXPERIENCE VARCHAR(10),EMAIL_ID VARCHAR(50),PHONE_NUMBER INT(15),TECHNOLOGY VARCHAR(100),PROJECT_DETAIL_ID INT,PRIMARY KEY(EMPLOYEE_ID),FOREIGN KEY(PROJECT_DETAIL_ID)REFERENCES PROJECT_DETAIL(PROJECT_DETAIL_ID) --CONSTRAINT fk_employee FOREIGN KEY (EMPLOYEE_ID)--REFERENCES PROJECT_DETAIL(PROJECT_DETAIL_ID)  ON DELETE CASCADE  ON UPDATE CASCADE  );
CREATE TABLE TECHNOLOGY(TECHNOLOGY_ID INT NOT NULL,TECHNOLOGY_NAME VARCHAR(100),PRIMARY KEY(TECHNOLOGY_ID));
CREATE TABLE TECHNOLOGY_DETAILS(TECHNOLOGY_DETAIL_ID INT NOT NULL,TECHNOLOGY_QUESTION VARCHAR,TECHNOLOGY_ANSWER VARCHAR,TECHNOLOGY_ID INT,PRIMARY KEY(TECHNOLOGY_DETAIL_ID),FOREIGN KEY(TECHNOLOGY_ID)REFERENCES TECHNOLOGY(TECHNOLOGY_ID) --CONSTRAINT fk_technology FOREIGN KEY (TECHNOLOGY_DETAIL_ID)--REFERENCES TECHNOLOGY(TECHNOLOGY_ID)  ON DELETE CASCADE  ON UPDATE CASCADE  );  
