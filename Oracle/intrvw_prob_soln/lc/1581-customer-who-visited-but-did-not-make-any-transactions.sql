

/*https://leetcode.com/problems/customer-who-visited-but-did-not-make-any-transactions/description/?envType=study-plan-v2&envId=top-sql-50 */

SELECT customer_id, count(*) as count_no_trans from Visits
WHERE visit_id  NOT IN 
(SELECT visit_id FROM Transactions)
GROUP BY customer_id
