/*

In Oracle DUAL table which is a special table used for evaluating expressions or calling functions.

In Oracle, the SELECT statement must have a FROM clause. However, some queries don’t require any table for example:
*/

REM Converts Capital Letters TO Lower
SELECT LOWER('THIS IS IN CAPITAL LETTERS BUT CONVERTED TO Lower')
FROM DUAL;

/*
Instead 
*/