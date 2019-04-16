CREATE TABLE family.family (
  PeopleID int(11) NOT NULL AUTO_INCREMENT,
  Gender char(1) DEFAULT NULL,
  FullName varchar(255) DEFAULT NULL,
  Age int(11) DEFAULT NULL,
  Father int(11) DEFAULT NULL,
  Mother int(11) DEFAULT NULL,
  Spouse int(11) DEFAULT NULL,
  PRIMARY KEY (PeopleID)
)
ENGINE = INNODB,
AUTO_INCREMENT = 16,
AVG_ROW_LENGTH = 1092,
CHARACTER SET utf8mb4,
COLLATE utf8mb4_0900_ai_ci;

ALTER TABLE family.family
ADD INDEX HUMANS (FullName);

ALTER TABLE family.family
ADD CONSTRAINT family_ibfk_1 FOREIGN KEY (Father)
REFERENCES family.family (peopleid);

ALTER TABLE family.family
ADD CONSTRAINT family_ibfk_2 FOREIGN KEY (Mother)
REFERENCES family.family (peopleid);

ALTER TABLE family.family
ADD CONSTRAINT family_ibfk_3 FOREIGN KEY (Spouse)
REFERENCES family.family (peopleid);