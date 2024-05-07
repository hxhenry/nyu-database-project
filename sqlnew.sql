
-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_account (
    ano     DECIMAL(20) NOT NULL COMMENT 'account number',
    aname   VARCHAR(20) NOT NULL COMMENT 'account name',
    adoopen DATETIME NOT NULL COMMENT 'date opened',
    a_type  VARCHAR(1) NOT NULL COMMENT 'account type',
    cemail  VARCHAR(20) NOT NULL COMMENT 'customer email',
    stid    INT,
    baptno  VARCHAR(10) COMMENT 'Bank apartment number'
);

ALTER TABLE hcy_account
    ADD CONSTRAINT ch_inh_hcy_account CHECK ( a_type IN ( 'C', 'H', 'L', 'S', 'T' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_account.ano IS
    'account number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_account.aname IS
    'account name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_account.adoopen IS
    'date opened'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_account.a_type IS
    'account type'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_account.cemail IS
    'customer email'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_account.baptno IS
    'Bank apartment number'; */

ALTER TABLE hcy_account ADD CONSTRAINT hcy_account_pk PRIMARY KEY ( ano );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_checking (
    ano        DECIMAL(20) NOT NULL COMMENT 'account number',
    csercharge DECIMAL(10, 2) NOT NULL COMMENT 'MONTHLY ACCOUNT MAINTENANCE FEES'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_checking.ano IS
    'account number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_checking.csercharge IS
    'MONTHLY ACCOUNT MAINTENANCE FEES'; */

ALTER TABLE hcy_checking ADD CONSTRAINT hcy_checking_pk PRIMARY KEY ( ano );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_city (
    cid   TINYINT NOT NULL COMMENT 'CITY ID',
    cname VARCHAR(20) NOT NULL COMMENT 'CITY NAME',
    sid   TINYINT NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_city.cid IS
    'CITY ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_city.cname IS
    'CITY NAME'; */

ALTER TABLE hcy_city ADD CONSTRAINT hcy_city_pk PRIMARY KEY ( cid );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_customer (
    cusfname VARCHAR(20) NOT NULL COMMENT 'customer first name',
    cuslname VARCHAR(20) NOT NULL COMMENT 'customer last name',
    cemail   VARCHAR(20) NOT NULL COMMENT 'customer email',
    stid     INT,
    captno   VARCHAR(10) COMMENT 'customer apartment numbner'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_customer.cusfname IS
    'customer first name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_customer.cuslname IS
    'customer last name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_customer.cemail IS
    'customer email'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_customer.captno IS
    'customer apartment numbner'; */

ALTER TABLE hcy_customer ADD CONSTRAINT hcy_customer_pk PRIMARY KEY ( cemail );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_home (
    ano       DECIMAL(20) NOT NULL COMMENT 'account number',
    hbuily    DATETIME NOT NULL COMMENT 'home built year',
    hinsacc   DOUBLE NOT NULL COMMENT 'home insurance account number',
    hinsname  VARCHAR(20) NOT NULL COMMENT 'home insurance name',
    hinyearly DECIMAL(10, 2) NOT NULL COMMENT 'home insurance yearly insurance premium',
    stid      INT,
    haptno    VARCHAR(10) COMMENT 'House apartment number'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_home.ano IS
    'account number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_home.hbuily IS
    'home built year'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_home.hinsacc IS
    'home insurance account number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_home.hinsname IS
    'home insurance name'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_home.hinyearly IS
    'home insurance yearly insurance premium'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_home.haptno IS
    'House apartment number'; */

ALTER TABLE hcy_home ADD CONSTRAINT hcy_home_pk PRIMARY KEY ( ano );

ALTER TABLE hcy_home ADD CONSTRAINT hcy_home_pkv1 UNIQUE ( hinsacc );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_loan (
    ano       DECIMAL(20) NOT NULL COMMENT 'account number',
    lrate     DECIMAL(10, 2) NOT NULL COMMENT 'loan rate',
    lamount   DECIMAL(10, 2) NOT NULL COMMENT 'LOAN AMOUNT',
    lmonths   INTEGER NOT NULL COMMENT 'LOAN MONTHS',
    lpayments DECIMAL(10, 2) NOT NULL,
    l_type    VARCHAR(1) NOT NULL COMMENT 'LOAN TYPE'
);

ALTER TABLE hcy_loan
    ADD CONSTRAINT ch_inh_hcy_loan CHECK ( l_type IN ( 'H', 'L', 'T' ) );

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_loan.ano IS
    'account number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_loan.lrate IS
    'loan rate'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_loan.lamount IS
    'LOAN AMOUNT'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_loan.lmonths IS
    'LOAN MONTHS'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_loan.l_type IS
    'LOAN TYPE'; */

ALTER TABLE hcy_loan ADD CONSTRAINT hcy_loan_pk PRIMARY KEY ( ano );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_savings (
    ano      DECIMAL(20) NOT NULL COMMENT 'account number',
    sintrate DECIMAL(10, 2) NOT NULL COMMENT 'SAVINGS INTEREST RATE'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_savings.ano IS
    'account number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_savings.sintrate IS
    'SAVINGS INTEREST RATE'; */

ALTER TABLE hcy_savings ADD CONSTRAINT hcy_savings_pk PRIMARY KEY ( ano );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_state (
    sid   TINYINT NOT NULL COMMENT 'STATE ID',
    sname VARCHAR(20) NOT NULL COMMENT 'STATE NAME'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_state.sid IS
    'STATE ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_state.sname IS
    'STATE NAME'; */

ALTER TABLE hcy_state ADD CONSTRAINT hcy_state_pk PRIMARY KEY ( sid );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_street (
    stid    INT NOT NULL COMMENT 'STREET ID',
    stname  VARCHAR(20) NOT NULL COMMENT 'STREET NAME',
    cid     TINYINT NOT NULL,
    zipcode DECIMAL(20) NOT NULL
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_street.stid IS
    'STREET ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_street.stname IS
    'STREET NAME'; */

ALTER TABLE hcy_street ADD CONSTRAINT hcy_street_pk PRIMARY KEY ( stid );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_student (
    ano          DECIMAL(20) NOT NULL COMMENT 'account number',
    stuid        VARCHAR(20) NOT NULL COMMENT 'student id',
    sgrad        DOUBLE NOT NULL COMMENT 'student is grad or undergrad',
    sexpgraddate DATETIME NOT NULL COMMENT 'exptected graduation',
    uniid        SMALLINT
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_student.ano IS
    'account number'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_student.stuid IS
    'student id'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_student.sgrad IS
    'student is grad or undergrad'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_student.sexpgraddate IS
    'exptected graduation'; */

ALTER TABLE hcy_student ADD CONSTRAINT hcy_student_pk PRIMARY KEY ( ano );

ALTER TABLE hcy_student ADD CONSTRAINT hcy_student_pkv1 UNIQUE ( stuid );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_university (
    uniid SMALLINT NOT NULL COMMENT 'University ID',
    uname VARCHAR(30) COMMENT 'University Name'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_university.uniid IS
    'University ID'; */

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_university.uname IS
    'University Name'; */

ALTER TABLE hcy_university ADD CONSTRAINT hcy_university_pk PRIMARY KEY ( uniid );

-- SQLINES LICENSE FOR EVALUATION USE ONLY
CREATE TABLE hcy_zip (
    zipcode DECIMAL(20) NOT NULL COMMENT 'Zipcode'
);

/* Moved to CREATE TABLE
COMMENT ON COLUMN hcy_zip.zipcode IS
    'Zipcode'; */

ALTER TABLE hcy_zip ADD CONSTRAINT hcy_zip_pk PRIMARY KEY ( zipcode );

ALTER TABLE hcy_account
    ADD CONSTRAINT hcy_account_customer_fk FOREIGN KEY ( cemail )
        REFERENCES hcy_customer ( cemail );

ALTER TABLE hcy_account
    ADD CONSTRAINT hcy_account_street_fk FOREIGN KEY ( stid )
        REFERENCES hcy_street ( stid );

ALTER TABLE hcy_checking
    ADD CONSTRAINT hcy_checking_account_fk FOREIGN KEY ( ano )
        REFERENCES hcy_account ( ano );

ALTER TABLE hcy_city
    ADD CONSTRAINT hcy_city_state_fk FOREIGN KEY ( sid )
        REFERENCES hcy_state ( sid );

ALTER TABLE hcy_customer
    ADD CONSTRAINT hcy_customer_street_fk FOREIGN KEY ( stid )
        REFERENCES hcy_street ( stid );

ALTER TABLE hcy_home
    ADD CONSTRAINT hcy_home_loan_fk FOREIGN KEY ( ano )
        REFERENCES hcy_loan ( ano );

ALTER TABLE hcy_home
    ADD CONSTRAINT hcy_home_street_fk FOREIGN KEY ( stid )
        REFERENCES hcy_street ( stid );

ALTER TABLE hcy_loan
    ADD CONSTRAINT hcy_loan_account_fk FOREIGN KEY ( ano )
        REFERENCES hcy_account ( ano );

ALTER TABLE hcy_savings
    ADD CONSTRAINT hcy_savings_account_fk FOREIGN KEY ( ano )
        REFERENCES hcy_account ( ano );

ALTER TABLE hcy_street
    ADD CONSTRAINT hcy_street_city_fk FOREIGN KEY ( cid )
        REFERENCES hcy_city ( cid );

ALTER TABLE hcy_street
    ADD CONSTRAINT hcy_street_zip_fk FOREIGN KEY ( zipcode )
        REFERENCES hcy_zip ( zipcode );

ALTER TABLE hcy_student
    ADD CONSTRAINT hcy_student_loan_fk FOREIGN KEY ( ano )
        REFERENCES hcy_loan ( ano );

ALTER TABLE hcy_student
    ADD CONSTRAINT hcy_student_university_fk FOREIGN KEY ( uniid )
        REFERENCES hcy_university ( uniid );

-- SQLINES LICENSE FOR EVALUATION USE ONLY

-- hcy_home insert trigger
DROP TRIGGER IF EXISTS arc_fkarc_i_hcy_home;

DELIMITER //

CREATE TRIGGER arc_fkarc_i_hcy_home BEFORE INSERT ON hcy_home
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.l_type
    INTO d
    FROM
        hcy_loan a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'H' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_HOME_LOAN_FK in Table HCY_HOME violates Arc constraint on Table HCY_LOAN - discriminator column L_TYPE doesn''t have value ''H''';
    END IF;

END;
//

DELIMITER ;

-- hcy_home update trigger
DROP TRIGGER IF EXISTS arc_fkarc_u_hcy_home;

DELIMITER //

CREATE TRIGGER arc_fkarc_u_hcy_home BEFORE UPDATE ON hcy_home
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.l_type
    INTO d
    FROM
        hcy_loan a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'H' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_HOME_LOAN_FK in Table HCY_HOME violates Arc constraint on Table HCY_LOAN - discriminator column L_TYPE doesn''t have value ''H''';
    END IF;

END;
//

DELIMITER ;


-- hcy_student insert trigger
DROP TRIGGER IF EXISTS arc_fkarc_i_hcy_student;

DELIMITER //

CREATE TRIGGER arc_fkarc_i_hcy_student BEFORE INSERT ON hcy_student
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.l_type
    INTO d
    FROM
        hcy_loan a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'T' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_STUDENT_LOAN_FK in Table HCY_STUDENT violates Arc constraint on Table HCY_LOAN - discriminator column L_TYPE doesn''t have value ''T''';
    END IF;

END;
//

DELIMITER ;

-- hcy_student update trigger
DROP TRIGGER IF EXISTS arc_fkarc_u_hcy_student;

DELIMITER //

CREATE TRIGGER arc_fkarc_u_hcy_student BEFORE UPDATE ON hcy_student
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.l_type
    INTO d
    FROM
        hcy_loan a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'T' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_STUDENT_LOAN_FK in Table HCY_STUDENT violates Arc constraint on Table HCY_LOAN - discriminator column L_TYPE doesn''t have value ''T''';
    END IF;

END;
//

DELIMITER ;


-- hcy_loan insert trigger
DROP TRIGGER IF EXISTS arc_fkarc_i_hcy_loan;

DELIMITER //

CREATE TRIGGER arc_fkarc_i_hcy_loan BEFORE INSERT ON hcy_loan
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.a_type
    INTO d
    FROM
        hcy_account a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'L' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_LOAN_ACCOUNT_FK in Table HCY_LOAN violates Arc constraint on Table HCY_ACCOUNT - discriminator column A_TYPE doesn''t have value ''L''';
    END IF;

END;
//

DELIMITER ;

-- hcy_loan update trigger
DROP TRIGGER IF EXISTS arc_fkarc_u_hcy_loan;

DELIMITER //

CREATE TRIGGER arc_fkarc_u_hcy_loan BEFORE UPDATE ON hcy_loan
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.a_type
    INTO d
    FROM
        hcy_account a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'L' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_LOAN_ACCOUNT_FK in Table HCY_LOAN violates Arc constraint on Table HCY_ACCOUNT - discriminator column A_TYPE doesn''t have value ''L''';
    END IF;

END;
//

DELIMITER ;


-- hcy_savings insert trigger
DROP TRIGGER IF EXISTS arc_fkarc_i_hcy_savings;

DELIMITER //

CREATE TRIGGER arc_fkarc_i_hcy_savings BEFORE INSERT ON hcy_savings
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.a_type
    INTO d
    FROM
        hcy_account a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'S' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_SAVINGS_ACCOUNT_FK in Table HCY_SAVINGS violates Arc constraint on Table HCY_ACCOUNT - discriminator column A_TYPE doesn''t have value ''S''';
    END IF;

END;
//

DELIMITER ;

-- hcy_savings update trigger
DROP TRIGGER IF EXISTS arc_fkarc_u_hcy_savings;

DELIMITER //

CREATE TRIGGER arc_fkarc_u_hcy_savings BEFORE UPDATE ON hcy_savings
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.a_type
    INTO d
    FROM
        hcy_account a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'S' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_SAVINGS_ACCOUNT_FK in Table HCY_SAVINGS violates Arc constraint on Table HCY_ACCOUNT - discriminator column A_TYPE doesn''t have value ''S''';
    END IF;

END;
//

DELIMITER ;


-- hcy_checking insert trigger
DROP TRIGGER IF EXISTS arc_fkarc_i_hcy_checking;

DELIMITER //

CREATE TRIGGER arc_fkarc_i_hcy_checking BEFORE INSERT ON hcy_checking
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.a_type
    INTO d
    FROM
        hcy_account a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'C' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_CHECKING_ACCOUNT_FK in Table HCY_CHECKING violates Arc constraint on Table HCY_ACCOUNT - discriminator column A_TYPE doesn''t have value ''C''';
    END IF;

END;
//

DELIMITER ;

-- hcy_checking update trigger
DROP TRIGGER IF EXISTS arc_fkarc_u_hcy_checking;

DELIMITER //

CREATE TRIGGER arc_fkarc_u_hcy_checking BEFORE UPDATE ON hcy_checking
    FOR EACH ROW
BEGIN
    DECLARE d VARCHAR(1);
    SELECT
        a.a_type
    INTO d
    FROM
        hcy_account a
    WHERE
        a.ano = new.ano;

    IF ( d IS NULL OR d <> 'C' ) THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'FK HCY_CHECKING_ACCOUNT_FK in Table HCY_CHECKING violates Arc constraint on Table HCY_ACCOUNT - discriminator column A_TYPE doesn''t have value ''C''';
    END IF;

END;
//

DELIMITER ;



--CONSTRAINTS
ALTER TABLE HCY_ACCOUNT MODIFY COLUMN ADOOPEN TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE HCY_ACCOUNT ADD CONSTRAINT HCY_ACCOUNT_UNI UNIQUE (CEMAIL,A_TYPE);
alter table HCY_ACCOUNT add constraint HCY_ACCOUNT_A_TYPE check (A_TYPE in ('C','S','L'));
alter table HCY_LOAN add constraint HCY_LOAN_L_TYPE check (L_TYPE in ('L','H','T'));
alter table HCY_ZIP add constraint HCY_ZIP_ZIPCODE check (ZIPCODE between 10000 and 99999);
alter table HCY_STATE add constraint HCY_STATE_SID check (SID between 10 and 99);
alter table HCY_CITY add constraint HCY_CITY_CID check (CID between 10 and 99);
alter table HCY_STREET add constraint HCY_STREET_STID check (STID between 1000 and 9999);
alter table HCY_ACCOUNT add constraint HCY_ACCOUNT_ANO check (ANO between 1000 and 9999);
alter table HCY_CUSTOMER add constraint HCY_CUSTOMER_CUSFNAME check (CUSFNAME=upper(CUSFNAME));
alter table HCY_CUSTOMER add constraint HCY_CUSTOMER_CUSLNAME check (CUSLNAME=upper(CUSLNAME));
alter table HCY_UNIVERSITY add constraint HCY_UNIVERSITY_UNIID check (UNIID between 100 and 999);

-- CONSTANTS QUERY
SELECT * FROM information_schema.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'hcy_XXX';


-- Sample Data
-- STATE
INSERT INTO HCY_STATE(SID,SNAME)VALUES(11,'CAL');
INSERT INTO HCY_STATE(SID,SNAME)VALUES(12,'NY');

-- CITY
INSERT INTO HCY_CITY(CID,CNAME,SID) VALUES(11,'BERKELEY',11);
INSERT INTO HCY_CITY(CID,CNAME,SID) VALUES(12,'SANJOSE',11);
INSERT INTO HCY_CITY(CID,CNAME,SID) VALUES(13,'NYC',12);
INSERT INTO HCY_CITY(CID,CNAME,SID) VALUES(14,'LA',11);
INSERT INTO HCY_CITY(CID,CNAME,SID) VALUES(15,'SANTACRUZ',11);
INSERT INTO HCY_CITY(CID,CNAME,SID) VALUES(16,'MONTEREY',11);

-- STREET
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2100,'1062 Arbol Way',12,95126);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2200,'22 Chapel',13,11210);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2300,'22 Chapel',13,11210);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2400,'1240 Shaffer Rd',15,95060);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2500,'1156 High St',15,95064);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2600,'Hearst Ave',11,94704);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2700,'6 Metro Center',13,11210);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2800,'405 Hilgard Ave',14,90095);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(2900,'306 Gold Street',13,11210);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(3100,'2600 Bancroft Way',11,94704);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(3200,'886 Cannery Row',16,93940);
INSERT INTO HCY_STREET(STID,STNAME,CID,ZIPCODE)VALUES(3300,'50 Front St',15,95060);

-- ZIPCODE
INSERT INTO HCY_ZIP(ZIPCODE)VALUES(11210);
INSERT INTO HCY_ZIP(ZIPCODE)VALUES(94704);
INSERT INTO HCY_ZIP(ZIPCODE)VALUES(93940);
INSERT INTO HCY_ZIP(ZIPCODE)VALUES(95126);
INSERT INTO HCY_ZIP(ZIPCODE)VALUES(95060);
INSERT INTO HCY_ZIP(ZIPCODE)VALUES(90095);
INSERT INTO HCY_ZIP(ZIPCODE)VALUES(95064);

-- customer
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('NANCY','MULLIGAN','nw46@gmail.com',3300);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('DAISY','LEE','dal9@gmail.com',2300);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('DAVID','HUMPHREY','dh71@gmail.com',2400);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('MIKE','JONAS','mj89@gmail.com',2500);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('EVA','GREEN','eva97@gmail.com',2600);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('GEORGE','STRAIT','gst53@gmail.com',2800);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('TAYLOR','MOMSEN','tam47@gmial.com',2900);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('MICHAEL','JORDAN','mjo12@gmail.com',3100);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('MARY','CAREY','mc99@gamil.com',3300);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('BILL','PANG','bp77@gmail.com',2700);	
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('PAUL','MILLER','pm12@gmail.com',3200);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('JERRY','LIN','jl23@gmail.com',2100);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('EMILY','CLARK','ec02@gmial.com',2200);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('FIONA','ZHOU','fz72@gmail.com',2600);
INSERT INTO HCY_CUSTOMER(CUSFNAME,CUSLNAME,CEMAIL,STID)VALUES('HENRY','WALKER','hw00@gmail.com',2500);

--ACCOUNT
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(5534,'nwsavin','S','nw46@gmail.com',3300);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(5545,'gstcheckin','C','gst53@gmail.com',2800);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(5557,'dalcheckin','C','dal9@gmail.com',2300);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(5567,'hwsavin','S','hw00@gmail.com',2500);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(5587,'fzloan','L','fz72@gmail.com',2600);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(6534,'ecloan','L','ec02@gmial.com',2200);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(6547,'jlloan','L','jl23@gmail.com',2100);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(6556,'pmsavin','S','pm12@gmail.com',3200);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(6564,'bpcheckin','C','bp77@gmail.com',2700);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(6572,'mccheckin','C','mc99@gamil.com',3300);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(6583,'mjosavin','S','mjo12@gmail.com',3100);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(7534,'tamsavin','S','tam47@gmial.com',2900);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(7546,'evaloan','L','eva97@gmail.com',2600);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(7559,'dhloan','L','dh71@gmail.com',2400);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(7567,'evacheckin','C','eva97@gmail.com',2600);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(7579,'mjsavin','S','mj89@gmail.com',2500);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(8532,'bploan','L','bp77@gmail.com',2700);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(8543,'fzcheckin','C','fz72@gmail.com',2600);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(8556,'dhsavin','S','dh71@gmail.com',2400);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(8569,'mcloan','L','mc99@gamil.com',3300);
INSERT INTO HCY_ACCOUNT(ANO,ANAME,A_TYPE,CEMAIL,STID)VALUES(8575,'jlsavin','S','jl23@gmail.com',2100);

-- SAVINGS
INSERT INTO HCY_SAVINGS(ANO,SINTRATE)VALUES(5534,0.02);
INSERT INTO HCY_SAVINGS(ANO,SINTRATE)VALUES(5567,0.03);
INSERT INTO HCY_SAVINGS(ANO,SINTRATE)VALUES(6556,0.04);
INSERT INTO HCY_SAVINGS(ANO,SINTRATE)VALUES(6583,0.02);
INSERT INTO HCY_SAVINGS(ANO,SINTRATE)VALUES(7534,0.01);
INSERT INTO HCY_SAVINGS(ANO,SINTRATE)VALUES(7579,0.04);
INSERT INTO HCY_SAVINGS(ANO,SINTRATE)VALUES(8556,0.02);
INSERT INTO HCY_SAVINGS(ANO,SINTRATE)VALUES(8575,0.03);

-- CHECKING
INSERT INTO HCY_CHECKING(ANO,CSERCHARGE)VALUES(5545,50);
INSERT INTO HCY_CHECKING(ANO,CSERCHARGE)VALUES(5557,40);
INSERT INTO HCY_CHECKING(ANO,CSERCHARGE)VALUES(6564,60);
INSERT INTO HCY_CHECKING(ANO,CSERCHARGE)VALUES(6572,45);
INSERT INTO HCY_CHECKING(ANO,CSERCHARGE)VALUES(7567,55);
INSERT INTO HCY_CHECKING(ANO,CSERCHARGE)VALUES(8543,35);

-- LOAN
INSERT INTO HCY_LOAN(ANO,LRATE,LAMOUNT,LMONTHS,LPAYMENTS,L_TYPE)VALUES(5587,0.07,500000,150,3300,'H');
INSERT INTO HCY_LOAN(ANO,LRATE,LAMOUNT,LMONTHS,LPAYMENTS,L_TYPE)VALUES(6534,0.05,600000,120,5000,'H');
INSERT INTO HCY_LOAN(ANO,LRATE,LAMOUNT,LMONTHS,LPAYMENTS,L_TYPE)VALUES(6547,0.06,200000,120,1650,'H');
INSERT INTO HCY_LOAN(ANO,LRATE,LAMOUNT,LMONTHS,LPAYMENTS,L_TYPE)VALUES(7546,0.03,50000,48,1100,'T');
INSERT INTO HCY_LOAN(ANO,LRATE,LAMOUNT,LMONTHS,LPAYMENTS,L_TYPE)VALUES(7559,0.02,28000,24,1100,'T');
INSERT INTO HCY_LOAN(ANO,LRATE,LAMOUNT,LMONTHS,LPAYMENTS,L_TYPE)VALUES(8532,0.02,30000,24,1200,'T');
INSERT INTO HCY_LOAN(ANO,LRATE,LAMOUNT,LMONTHS,LPAYMENTS,L_TYPE)VALUES(8569,0.04,67000,36,2000,'L');

-- home
INSERT INTO HCY_HOME(ANO,HBUILY,HINSACC,HINSNAME,HINYEARLY,STID)VALUES(5587,'1-JAN-2000',12453,'PACIFIC',10000,2600);
INSERT INTO HCY_HOME(ANO,HBUILY,HINSACC,HINSNAME,HINYEARLY,STID)VALUES(6534,'5-MAY-2020',16789,'ATLANTIC',5000,2200);
INSERT INTO HCY_HOME(ANO,HBUILY,HINSACC,HINSNAME,HINYEARLY,STID)VALUES(6547,'8-JUL-2019',12809,'LOTUS',8000,2100);

-- student
INSERT INTO HCY_STUDENT(ANO,STUID,SUNI,SGRAD,SEXPGRADDATE)VALUES(7546,'N123432','NYU',0,'13-MAY-2025');
INSERT INTO HCY_STUDENT(ANO,STUID,SUNI,SGRAD,SEXPGRADDATE)VALUES(7559,'P789109','UCLA',1,'13-DEC-2024');
INSERT INTO HCY_STUDENT(ANO,STUID,SUNI,SGRAD,SEXPGRADDATE)VALUES(8532,'C198296','UCBERKELEY',1,'13-MAY-2024');

-- University
INSERT INTO HCY_UNIVERSITY(UNIID, UNAME)VALUES(101, 'NYU');
INSERT INTO HCY_UNIVERSITY(UNIID, UNAME)VALUES(102, 'UCLA');
INSERT INTO HCY_UNIVERSITY(UNIID, UNAME)VALUES(103, 'UCB');
