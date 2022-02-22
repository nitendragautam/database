/*In Oracle DUAL table which is a special table used for evaluating expressions or calling functions.
In Oracle, the SELECT statement must have a FROM clause. However, some queries don’t require any table for example:*/


--Converts Capital Letters TO Lower
SELECT LOWER('THIS IS IN CAPITAL LETTERS BUT CONVERTED TO Lower')
FROM DUAL;



/* In Oracle's flavor of SQL, "dual is just a convienence table". It was originally intended to double rows via a JOIN, but
now contains one row with a DUMMY value of 'X'.*/
SELECT 'Hello World!' FROM dual;

/*=================================================================*/
/*===============Data Dictionary in SQL ==========================*/
/*=================================================================*/


/*
 * Describe All Objects in the Database
 */
SELECT * FROM dba_objects;


/*
 *  See all the Data Dictionary Views to which current user have accesss
 */

SELECT * FROM dict;
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
 * 
 */


/*
 * 
 * Using SELECT to query all the columns from the table
 * 
 */

SELECT * FROM  OT.CUSTOMERS_DATA ;


/*
 * Using SELECT to query specific columns from the table
 */

SELECT CUS_ID, NAME, CRDT_LMT FROM OT.CUSTOMERS_DATA;


/**
 * Perform  Transformation on Columns while Selecting the data without Alias
 */

SELECT CUS_ID, UPPER(NAME) AS NAME FROM OT.CUSTOMERS_DATA;

/**
 * Perform  Transformation on Columns while Selecting the data With Alias
 */

SELECT ORDER_ID, UPPER(STATUS) AS ORDER_STATUS FROM OT.ORDERS_DATA;


/**
 * WHERE Clause using one Condition
 */
SELECT * FROM OT.ORDERS_DATA WHERE ORDER_ID=105;

/**
 * WHERE Clause using Multiple conditions(AND Condition)
 */

SELECT * FROM OT.ORDERS_DATA WHERE ORDER_ID=105 AND STATUS='Pending'


/*
 * WHERE Clause using Multiple conditions(OR Condition)
 */


SELECT * FROM OT.ORDERS_DATA WHERE ORDER_ID=105 OR STATUS='Pending'


/*
 * WHERE Clause for numeric comparison 
 */


/*
 * WHERE Clause with Greater than Clause to check Credit Limit Greater than 1000
 */
SELECT * FROM OT.CUSTOMERS_DATA WHERE CRDT_LMT >=1000;


/*
 * WHERE Clause with Smaller than Clause to check Credit Limit Less than 1000
 */
SELECT * FROM OT.CUSTOMERS_DATA WHERE CRDT_LMT <=1000;


