/*In Oracle DUAL table which is a special table used for evaluating expressions or calling functions.
In Oracle, the SELECT statement must have a FROM clause. However, some queries don’t require 
any table for example:*/
--Converts Capital Letters TO Lower
SELECT
	LOWER('THIS IS IN CAPITAL LETTERS BUT CONVERTED TO Lower')
FROM
	DUAL;

/* In Oracle's flavor of SQL, "dual is just a convienence table". It was originally intended to
 *  double rows via a JOIN, but
now contains one row with a DUMMY value of 'X'.*/
SELECT
	'Hello World!'
FROM
	dual;

/*=================================================================*/
/*===============Data Dictionary in SQL ==========================*/
/*=================================================================*/

/*
 * Describe All Objects in the Database
 */
SELECT
	*
FROM
	dba_objects;

/*
 *  See all the Data Dictionary Views to which current user have accesss
 */

SELECT
	*
FROM
	dict;
-- It gives below output

/*
 *  TABLE_NAME	COMMENTS
CDB_KGLLOCK	 in all containers
CDB_LOCK	 in all containers
CDB_LOCK_INTERNAL	 in all containers
CDB_DML_LOCKS	 in all containers
CDB_DDL_LOCKS	 in all containers
CDB_WAITERS	 in all containers
CDB_BLOCKERS	 in all containers
CDB_CONS_COLUMNS	Information about accessible columns in constraint definitions in all containers
CDB_LOG_GROUP_COLUMNS	Information about columns in log group definitions in all containers
CDB_LOBS	Description of LOBs contained in all tables in all containers
 */

/*
 * Using SELECT to query all the columns from the table
 */

SELECT
	*
FROM
	OT.CUSTOMERS_DATA ;

/*
 * Using SELECT to query specific columns from the table
 */

SELECT
	CUS_ID,
	NAME,
	CRDT_LMT
FROM
	OT.CUSTOMERS_DATA;

/**
 * Perform  Transformation on Columns while Selecting the data without Alias
 */

SELECT
	CUS_ID,
	UPPER(NAME) AS NAME
FROM
	OT.CUSTOMERS_DATA;

/**
 * Perform  Transformation on Columns while Selecting the data With Alias
 */

SELECT
	ORDER_ID,
	UPPER(STATUS) AS ORDER_STATUS
FROM
	OT.ORDERS_DATA;

/**
 * WHERE Clause using one Condition
 */
SELECT
	*
FROM
	OT.ORDERS_DATA
WHERE
	ORDER_ID = 105;

/**
 * WHERE Clause using Multiple conditions(AND Condition)
 */

SELECT
	*
FROM
	OT.ORDERS_DATA
WHERE
	ORDER_ID = 105
	AND STATUS = 'Pending'

/*
 * WHERE Clause using Multiple conditions(OR Condition)
 */
	SELECT
	*
FROM
	OT.ORDERS_DATA
WHERE
	ORDER_ID = 105
	OR STATUS = 'Pending'

/*
 * WHERE Clause for numeric comparison 
 */
	/*
 * WHERE Clause with Greater than Clause to check Credit Limit Greater than 1000
 */
	SELECT
	*
FROM
	OT.CUSTOMERS_DATA
WHERE
	CRDT_LMT >= 1000;

/*
 * WHERE Clause with Smaller than Clause to check Credit Limit Less than 1000
 */
SELECT
	*
FROM
	OT.CUSTOMERS_DATA
WHERE
	CRDT_LMT <= 1000;

/*
 * Using Distinct for Single Column
 */

SELECT
	DISTINCT(STATUS)
FROM
	OT.ORDERS_DATA OD;

/*
 * Using Distinct for Multiple Columns
 */

SELECT
	DISTINCT CUS_ID,
	STATUS
FROM
	OT.ORDERS_DATA OD;

/*
 * Using  DISTINCT with Aggregate Functions
 */
SELECT
	COUNT(DISTINCT(STATUS))
FROM
	OT.ORDERS_DATA OD;

/*
 *  SQL ORDER BY  clause to sort values in Single columns  
 */
SELECT
	*
FROM
	OT.CUSTOMERS_DATA
ORDER BY
	NAME DESC

/*
 *  SQL ORDER BY  clause to sort values in Multiple columns  
 */
	SELECT
	*
FROM
	OT.CUSTOMERS_DATA
ORDER BY
	NAME,
	CRDT_LMT ASC 

/*
 * SQL ORDER BY  clause to sort Date Columns 
 */
	SELECT
	*
FROM
	OT.ORDERS_DATA OD
ORDER BY
	ORDER_DATE DESC;

/*
 * SQL IN operator with Numeric value
 */
SELECT
	*
FROM
	OT.CUSTOMERS_DATA
WHERE
	CRDT_LMT IN(3500, 5000, 900)

/*
 *  Using OR operator to get the same result we get from SQL in Operator for number
 */
	SELECT
	*
FROM
	OT.CUSTOMERS_DATA
WHERE
	CRDT_LMT = 3500
	OR CRDT_LMT = 5000
	OR CRDT_LMT = 900;

/* 
 *  SQL IN Operator With Text Value
 */
SELECT
	*
FROM
	OT.ORDERS_DATA OD
WHERE
	STATUS IN ('Pending', 'Shipped');

/*
 *  Using OR operator to get the same result we get from SQL in Operator for Text
 */
SELECT
	*
FROM
	OT.ORDERS_DATA OD
WHERE
	STATUS = 'Pending'
	OR STATUS = 'Shipped';

/*
 * SQL IN Operator with a Sub Query
 */
SELECT
	*
FROM
	OT.CUSTOMERS_DATA
WHERE
	CUS_ID IN 
(
	SELECT
		CUS_ID
	FROM
		OT.ORDERS_DATA
	WHERE
		CUS_ID >105)
ORDER BY
	CUS_ID DESC;


/*
 * SQL IN Operator with Boolean NOT Operator
 */

SELECT
	*
FROM 
	OT.CUSTOMERS_DATA
WHERE
	CRDT_LMT NOT IN (200, 300, 600);



/*
 * SQL IN Operator with Boolean NOT Operator Equivalent query using AND condition
 */

SELECT
	*
FROM 
	OT.CUSTOMERS_DATA
WHERE
	CRDT_LMT!=200
	AND CRDT_LMT !=300
	AND CRDT_LMT !=600;
   



/*
 * Create table Example
 */

CREATE TABLE "OT"."CUSTOMERS_DATA_EXAMPLE" 
   ("CUSTOMER_ID" NUMBER  NOT NULL , 
	"NAME" VARCHAR2(255) NOT NULL , 
	"ADDRESS" VARCHAR2(255), 
	"WEBSITE" VARCHAR2(255), 
	"CREDIT_LIMIT" NUMBER(8,2), 
	 PRIMARY KEY ("CUSTOMER_ID"))
;


SELECT * FROM OT.CUSTOMERS_DATA_EXAMPLE;

/*
 * Create table from Existing Table
 */

CREATE TABLE OT.CUSTOMERS_DATA_NEW_TABLE AS 
SELECT CUS_ID, NAME, ADDRESS,WEBSITE,CRDT_LMT 
	FROM OT.CUSTOMERS_DATA;


SELECT * FROM OT.CUSTOMERS_DATA_NEW_TABLE;
	

SELECT * FROM OT.orders_data ;

/**
 *  SQL Like Operator
 */

SELECT * FROM OT.CUSTOMERS_DATA WHERE ADDRESS LIKE '160%';

SELECT * FROM OT.CUSTOMERS_DATA WHERE ADDRESS LIKE '160_';
