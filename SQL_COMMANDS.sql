
-- CREATE TABLES


CREATE TABLE prisoner (
  prisoner_id number(5),
  first_name varchar2(15),
  last_name varchar2(15),
  birth_place varchar2(20),
  date_of_birth date
  occupation varchar2(20),
  indictment varchar2(50),
  intake_date date,
  sentence_end_date date,
  cell_num number(4),
  security_level_id number(1)
);

CREATE TABLE properties_in_cells (
  property_name varchar2(25),
  prisoner_id number(5),
  description varchar2(50)
);

CREATE TABLE cell (
  cell_num number(4),
  last_shakedown_date date
);

CREATE TABLE visited_by (
  prisoner_id number(5),
  visitor_id number(6)
);

CREATE TABLE visitor (
   visitor_id number(4),
   first_name varchar2(20),
   last_name varchar2(20),
   phone_number number(11),
   relation_to_prisoner varchar2(20),
   visit_date date
);

CREATE TABLE enrolled_in (
  prisoner_id number(5),
  course_id number(2)
);

CREATE TABLE own_certificate_from (
  prisoner_id number(5),
  course_id number(2)
);

CREATE TABLE prisoner_labor (
  prisoner_id number(5),
  staff_id number(3)
);

CREATE TABLE staff (
  staff_id number(3),
  first_name varchar2(20),
  last_name varchar2(20),
  supervisor_id number(3),
  job_id number(2),
  salary number(8,2),
  hiredate date
);

CREATE TABLE programs_and_courses (
  course_id number(2),
  course_name varchar2(50),
  instructor_id number(3)
);

CREATE TABLE jobs (
  job_id number(2),
  job_description varchar(15)
);

CREATE TABLE infirmary (
  prescription_num number(5),
  prisoner_id number(5),
  related_doctor varchar2(40),
  drug_name varchar2(50),
  drug_usage_day number(2),
  disease_type varchar(20)
);

CREATE TABLE borrowed (
  prisoner_id number(5),
  ISBN number(13)
);

CREATE TABLE library (
  ISBN number(13),
  book_name varchar2(30),
  genre varchar(15)
);

CREATE TABLE security_level (
  security_level_no number(1),
  description char(6)
);





-- ADDING PRIMARY KEYS (CHECK DB SCHEMA TO UNDERSTAND BETTER)


ALTER TABLE prisoner ADD CONSTRAINT prisonerid_pk PRIMARY KEY (prisoner_id);

ALTER TABLE visitor ADD CONSTRAINT visitorid_pk PRIMARY KEY (visitor_id);

ALTER TABLE visited_by ADD CONSTRAINT visitorid_prisonerid_pk_PV PRIMARY KEY (visitor_id,prisoner_id);

ALTER TABLE own_certificate_from ADD CONSTRAINT prisonerid_pk_PP PRIMARY KEY (prisoner_id,course_id);

ALTER TABLE programs_and_courses ADD CONSTRAINT courseid PRIMARY KEY (course_id);

ALTER TABLE enrolled_in ADD CONSTRAINT prisonerid_courseid_pk PRIMARY KEY (prisoner_id,course_id);

ALTER TABLE infirmary ADD CONSTRAINT prescriptionnum_pk PRIMARY KEY (prescription_num); 

ALTER TABLE cell ADD CONSTRAINT cellid_pk PRIMARY KEY (cell_num);

ALTER TABLE staff ADD CONSTRAINT staffid_pk PRIMARY KEY (staff_id);

ALTER TABLE prisoner_labor ADD CONSTRAINT prisonerid_staffid_pk PRIMARY KEY (prisoner_id,staff_id);

ALTER TABLE jobs ADD CONSTRAINT jobid_pk PRIMARY KEY (job_id); 

ALTER TABLE borrowed ADD CONSTRAINT prisonerid_isbn_pk PRIMARY KEY (prisoner_id,ISBN);

ALTER TABLE security_level ADD CONSTRAINT seuritylevelno_pk PRIMARY KEY (security_level_no);

ALTER TABLE library ADD CONSTRAINT isbn_pk PRIMARY KEY (ISBN);




-- ADDING FOREIGN KEYS


ALTER TABLE prisoner ADD CONSTRAINT cellnum_fk FOREIGN KEY (cell_num) REFERENCES cell(cell_num);

ALTER TABLE prisoner ADD CONSTRAINT securitylevel_fk FOREIGN KEY (security_level_id) REFERENCES security_level(security_level_no);

ALTER TABLE programs_and_courses ADD CONSTRAINT instructorid_fk FOREIGN KEY (instructor_id) REFERENCES staff(staff_id); 

ALTER TABLE infirmary ADD CONSTRAINT prisonerid_fk FOREIGN KEY (prisoner_id) REFERENCES prisoner(prisoner_id);

ALTER TABLE staff ADD CONSTRAINT supervisorid_fk FOREIGN KEY (supervisor_id) REFERENCES staff(staff_id); 

ALTER TABLE staff ADD CONSTRAINT jobid_fk FOREIGN KEY (job_id) REFERENCES jobs(job_id); 




-- WEAK ENTITY SET

ALTER TABLE properties_in_cells ADD CONSTRAINT propertyname_prisonerid_PK PRIMARY KEY (property_name,prisoner_id);
ALTER TABLE properties_in_cells ADD CONSTRAINT prisonerid_weak_FK FOREIGN KEY (prisoner_id) REFERENCES prisoner ON DELETE CASCADE;




-- NOT NULL CONSTRAINTS

ALTER TABLE prisoner MODIFY (first_name NOT NULL);
ALTER TABLE prisoner MODIFY (last_name NOT NULL);
ALTER TABLE staff MODIFY (first_name NOT NULL);
ALTER TABLE staff MODIFY (last_name NOT NULL);




-- INSERT INTO STATEMENTS:

INSERT INTO cell (cell_num,last_shakedown_date) VALUES (1,'28/08/2021'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (2,'03/08/2021'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (3,'09/01/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (4,'28/05/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (35,'15/06/2021'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (6,'06/08/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (7,'16/07/2021'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (8,'03/04/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (9,'28/08/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (10,'16/11/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (11,'14/12/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (12,'26/11/2020');
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (13,'17/05/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (14,'10/09/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (15,'28/01/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (16,'24/04/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (17,'26/05/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (18,'19/06/2020'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (19,'21/02/2021'); 
INSERT INTO cell (cell_num,last_shakedown_date) VALUES (20,'23/02/2020');

INSERT INTO security_level (security_level_no,description) VALUES (1,'low');
INSERT INTO security_level (security_level_no,description) VALUES (2,'medium');
INSERT INTO security_level (security_level_no,description) VALUES (3,'high');

INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (49445,'Hop','West','08/11/1976','Nuremberg','decorator.','robery','21/06/2019','22/07/2027',1,1);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (51308,'Arthur','Mills','06/10/1977','Hasselt','driver','assault','17/02/2020','01/10/2049',2,1);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (24582,'Wesley','Mcfadden','10/12/1964','Mundare','cook','kidnaping','06/02/2020','07/01/2041',3,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (42448,'Honorato','Koch','09/09/1951','Schiltigheim','cook','car theft','18/03/2019','05/07/2024',4,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (79335,'Uriel','Pennington','05/04/1966','Beausejour','politican','tax evasion','20/03/2019','18/02/2035',35,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (13906,'Hammett','Gonzalez','08/01/1975','Oosterhout','bank manger','drug manufactoring','30/07/2019','21/06/2031',6,1);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (15908,'Emerson','Stewart','02/11/1973','Cochrane','bank manager','robery','19/03/2019','10/12/2034',7,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (90617,'Rudyard','Lee','21/01/1951','Skovorodino','bank manager','robery','02/03/2019','17/04/2046',8,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (64831,'Vernon','Evans','05/11/1966','Charsadda','bank manager','robery','18/05/2019','02/04/2025',9,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (2282,'Elvis','Kramer','20/09/1952','Sanluri','bank manager','robery','27/04/2019','17/04/2045',10,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (53522,'Neil','Small','01/02/1951','Petit-Thier','pilot.','assault','04/01/2020','02/05/2037',11,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (88221,'Lars','Hatfield','22/12/1963','Sahan','pilot','assault','17/12/2019','24/11/2026',12,2);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (2130,'Marvin','Barron','14/05/1971','Rigolet','pilot','assault','01/05/2019','07/03/2050',13,2);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (27211,'Nathaniel','Trevino','23/12/1967','Tira','farmer.','assault','13/12/2018','12/11/2042',14,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (99211,'Magee','Mckay','27/02/1974','Wageningen','computer engineer','tax evasion','31/03/2019','07/04/2036',15,3);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (12871,'Jeremy','Summers','21/05/1957','Saint-Urbain','softaware engineer.','tax evasion','26/06/2019','06/10/2037',16,2);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (8725,'Samson','Shepherd','25/07/1963','Wiener Neustadt','software engineer','tax evasionr','16/12/2019','07/02/2030',17,2);
INSERT INTO prisoner (prisoner_id,first_name,last_name,date_of_birth,birth_place,occupation,indictment,intake_date,sentence_end_date,cell_num,security_level_id) VALUES (63214,'Louis','Stein','01/06/1977','Meugliano','computer engineer.','kidnaping','28/04/2020','28/04/2027',18,3);


INSERT INTO visitor(visitor_id,first_name,last_name,phone_number,relation_to_prisoner,visit_date) VALUES (1532,'aron','vande','05438977911','friend','23/09/2019');
INSERT INTO visitor(visitor_id,first_name,last_name,phone_number,relation_to_prisoner,visit_date) VALUES (8493,'smith','vande','04512987913','friend','23/09/2019');
INSERT INTO visitor(visitor_id,first_name,last_name,phone_number,relation_to_prisoner,visit_date) VALUES (2479,'luis','lawrence','04938998651','brother','21/10/2020');


INSERT INTO visited_by (prisoner_id,visitor_id) VALUES (49445,1532);
INSERT INTO visited_by (prisoner_id,visitor_id) VALUES (51308,8493);
INSERT INTO visited_by (prisoner_id,visitor_id) VALUES (24582,2479);

INSERT INTO library (isbn,book_name,genre) VALUES (8974833392875,'player','science fiction');
INSERT INTO library (isbn,book_name,genre) VALUES (2388927393275,'frauder','drama');
INSERT INTO library (isbn,book_name,genre) VALUES (8322393289193,'poppy war','romance');

INSERT INTO borrowed (prisoner_id,isbn) VALUES (13906,8974833392875);
INSERT INTO borrowed (prisoner_id,isbn) VALUES (15908,2388927393275);
INSERT INTO borrowed (prisoner_id,isbn) VALUES (90617,8322393289193);

INSERT INTO jobs(job_id,job_description) VALUES(1,'warden');
INSERT INTO jobs(job_id,job_description) VALUES(2,'psychologist');
INSERT INTO jobs(job_id,job_description) VALUES(3,'accountant');
INSERT INTO jobs(job_id,job_description) VALUES(4,'lawyer');
INSERT INTO jobs(job_id,job_description) VALUES(5,'cook');
INSERT INTO jobs(job_id,job_description) VALUES(6,'foreman');
INSERT INTO jobs(job_id,job_description) VALUES(7,'worker');
INSERT INTO jobs(job_id,job_description) VALUES(8,'guard');
INSERT INTO jobs (job_id,job_description) VALUES(9,'janitor');
INSERT INTO jobs (job_id,job_description) VALUES(10,'doctor');

INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (1,'Harper','Romero',NULL,1,4998,'07/11/2019');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (2,'Isaiah','Wolf',1,1,6275,'31/08/2019');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (3,'Leroy','Dunlap',1,3,5471,'01/03/2019');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (4,'Lewis','Hodge',1,4,8370,'03/05/2020');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (5,'Gage','Herrera',NULL,5,2189,'21/04/2020');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (6,'Valentine','Wilkinson',5,5,9285,'18/04/2019');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (7,'Abel','Shannon',NULL,6,2129,'23/02/2020');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (8,'Jeremy','Watkins',7,7,698,'21/11/2019');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (9,'Gage','York',7,7,8580,'18/05/2020');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (10,'Reese','Schmidt',7,7,1359,'26/09/2019');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (11,'Zahir','Clemons',NULL,8,8503,'11/03/2019');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (12,'Camden','Chapman',11,8,8570,'25/10/2019');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (13,'Levi','Sandoval',11,8,9219,'07/09/2020');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (14,'Troy','Cervantes',6,9,113,'08/02/2020');
INSERT INTO staff (staff_id,first_name,last_name,supervisor_id,job_id,salary,hiredate) VALUES (15,'Beck','Zimmerman',NULL,10,1134,'11/02/2020');

INSERT INTO prisoner_labor (prisoner_id,staff_id) VALUES (64831,6);
INSERT INTO prisoner_labor (prisoner_id,staff_id) VALUES (27211,10);
INSERT INTO prisoner_labor (prisoner_id,staff_id) VALUES (8725,14);

INSERT INTO programs_and_courses (course_id,course_name,instructor_id) VALUES (1,'alcholics group theraphy',10);
INSERT INTO programs_and_courses (course_id,course_name,instructor_id) VALUES (2,'workshop safety induction',7);
INSERT INTO programs_and_courses (course_id,course_name,instructor_id) VALUES (3,'kitchen safety',5);

INSERT INTO own_certificate_from (prisoner_id,course_id) VALUES (64831,3);
INSERT INTO own_certificate_from (prisoner_id,course_id) VALUES (2282,2);
INSERT INTO own_certificate_from (prisoner_id,course_id) VALUES (53522,2);

INSERT INTO enrolled_in (prisoner_id,course_id) VALUES (53522,1);
INSERT INTO enrolled_in (prisoner_id,course_id) VALUES (88221,1);
INSERT INTO enrolled_in (prisoner_id,course_id) VALUES (2130,1);

INSERT INTO infirmary (prescription_num,prisoner_id,related_doctor,drug_name,drug_usage_day,disease_type) VALUES (57834,42448,'jamie harley','cantanol',3,'respiratory');
INSERT INTO infirmary (prescription_num,prisoner_id,related_doctor,drug_name,drug_usage_day,disease_type) VALUES (74289,79335,'jamie harley','fatel',10,'hearth');
INSERT INTO infirmary (prescription_num,prisoner_id,related_doctor,drug_name,drug_usage_day,disease_type) VALUES (48294,13906,'jamie harley','diagood',3,'diabetes');

INSERT INTO properties_in_cells (prisoner_id,property_name) VALUES (15908,'birdcage');
INSERT INTO properties_in_cells (prisoner_id,property_name) VALUES (13906,'sandbag');
INSERT INTO properties_in_cells (prisoner_id,property_name) VALUES (63214,'canvas');
