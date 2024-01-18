
/* https://leetcode.com/problems/article-views-i */


SELECT distinct(author_id) as id from 
(SELECT author_id ,article_id, count(*)
from views 
where author_id=viewer_id
group by author_id,article_id
having count(*)>=1)
ORDER BY author_id asc
