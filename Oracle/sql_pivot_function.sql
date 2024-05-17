CREATE TABLE OT.pivot_test (
  id NUMBER,
  customer_id NUMBER,
  product_code varchar2(5),
  quantity NUMBER
);

TRUNCATE TABLE OT.pivot_test DROP STORAGE;

INSERT ALL 
 into OT.pivot_test (id,customer_id,product_code,quantity) values (1, 1, 'A', 10)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (2, 1, 'B', 20)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (3, 1, 'C', 30)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (4, 2, 'A', 40)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (5, 2, 'C', 50)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (6, 3, 'A', 60)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (7, 3, 'B', 70)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (8, 3, 'C', 80)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (9, 3, 'D', 90)
 into OT.pivot_test (id,customer_id,product_code,quantity) values (10,4, 'A', 100)
SELECT * FROM dual;  
COMMIT;

-- Pivot Operation

select *
from   (select customer_id, product_code, quantity
        from   pivot_test)
pivot  (sum(quantity) as sum_quantity for (product_code) in ('A' as a, 'B' as b, 'C' as c))
order by customer_id;


-- Drop The Table OT.pivot_test when done
DROP TABLE OT.pivot_test;

