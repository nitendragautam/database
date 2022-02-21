--------------------------------------------------------------------------------------
--------------------------------------------------------------------
-- execute the following statements to create a user name OT if not exists 
--and grant priviledges
--------------------------------------------------------------------

-- create new user
CREATE USER OT IDENTIFIED BY admin123;
-- grant priviledges
GRANT CONNECT, RESOURCE, DBA TO OT;
GRANT CREATE SESSION TO OT;
GRANT UNLIMITED TABLESPACE TO OT;
COMMIT;

CREATE TABLE "OT"."CUSTOMERS_DATA" 
   ("CUS_ID" NUMBER  NOT NULL , -- Customer ID
	"NAME" VARCHAR2(255) NOT NULL , 
	"ADDRESS" VARCHAR2(255), 
	"WEBSITE" VARCHAR2(255), 
	"CRDT_LMT" NUMBER(8,2), --  Credit Limit
	 PRIMARY KEY ("CUS_ID"))
;
   CREATE TABLE "OT"."ORDERS_DATA" 
   ("ORDER_ID" NUMBER    NOT NULL, 
	"CUS_ID" NUMBER(6,0) NOT NULL ENABLE, 
	"STATUS" VARCHAR2(20) NOT NULL ENABLE, 
	"SLSMAN_ID" NUMBER(6,0), -- SalesMan ID
	"ORDER_DATE" DATE NOT NULL ENABLE, 
	 PRIMARY KEY ("ORDER_ID"));

  TRUNCATE TABLE "OT"."CUSTOMERS_DATA";
-- Insert into Customers Data table 
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (101,'State Street Corp.','1607 Abwdrts St, Bangalore, Kar','http://www.statestreet.com',3500);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (102,'Unum Group','1608 Amadeus St, Bangalore, Kar','http://www.unum.com',3500);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (103,'Reynolds American','1610 Betrayal Crt, Bangalore, Kar','http://www.reynoldsamerican.com',5000);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (104,'Group 1 Automotive','1614 Crackers Rd, Bangalore - India, Kar','http://www.group1auto.com',2300);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (105,'Henry Schein','1615 Crackers Crt, Bangalore - India, Kar','http://www.henryschein.com',5000);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (106,'Norfolk Southern','1618 Footloose St, Bangalore - India, Kar','http://www.nscorp.com',900);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (107,'Reinsurance Group of America','1619 Footloose Rd, Bangalore - India, Kar','http://www.rgare.com',900);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (108,'Public Service Enterprise Group','1621 Gargon! Blvd, Bangalore - India, Kar','http://www.pseg.com',600);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (109,'DTE Energy','8110 Jackson Rd, Ann Arbor, MI','http://www.dteenergy.com',200);
  INSERT INTO OT.CUSTOMERS_DATA (CUS_ID,NAME,ADDRESS,WEBSITE,CRDT_LMT) VALUES
	 (110,'Assurant','101 N Falahee Rd, Jackson, MI','http://www.assurant.com',300);
COMMIT;

TRUNCATE TABLE "OT"."ORDERS_DATA" ;
-- Insert Into Orders Data 
     INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (105,101,'Pending',54,TIMESTAMP'2016-11-17 00:00:00.0');
    INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (44,102,'Pending',55,TIMESTAMP'2017-02-20 00:00:00.0');
    INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (101,103,'Pending',55,TIMESTAMP'2017-01-03 00:00:00.0');
     INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (1,104,'Pending',56,TIMESTAMP'2017-10-15 00:00:00.0');
    INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (5,105,'Canceled',56,TIMESTAMP'2017-04-09 00:00:00.0');
    INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (28,106,'Canceled',57,TIMESTAMP'2017-08-15 00:00:00.0');
    INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (87,107,'Canceled',57,TIMESTAMP'2016-12-01 00:00:00.0');
    INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (4,108,'Shipped',59,TIMESTAMP'2015-04-09 00:00:00.0');
    INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (41,109,'Shipped',59,TIMESTAMP'2017-05-11 00:00:00.0');
    INSERT INTO OT.ORDERS_DATA (ORDER_ID,CUS_ID,STATUS,SLSMAN_ID,ORDER_DATE) VALUES
	 (82,110,'Shipped',60,TIMESTAMP'2016-12-03 00:00:00.0');
     COMMIT;