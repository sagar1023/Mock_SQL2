
# 1045 Customers Who Bought All Products

with cte as(
select c.customer_id, count(distinct c.product_key) as 'key_count' from Customer c inner join Product p on c.product_key =p.product_key group by c.customer_id
)

select distinct customer_id from cte where key_count =(select count(product_key) from product);

1070. Product Sales Analysis III

# Write your MySQL query statement below
select product_id, year as 'first_year', quantity, price from Sales where (product_id, year) 
IN (select product_id, MIN(year) from Sales group by product_id);