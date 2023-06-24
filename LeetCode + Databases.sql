# 

# Find Customer Referee. LeetCode 584
# Write an SQL query to report the names of the customer that are not referred by the customer with id = 2.

SELECT name 
FROM Customer
Where referee_id <> 2 or referee_id is null

# Employee Bonus. LeetCode 577
# Write an SQL query to report the name and bonus amount of each employee with a bonus less than 1000.

SELECT t1.name, t2.bonus
FROM Employee t1 
LEFT JOIN Bonus t2
ON t1.empId = t2.empId
where t2.bonus < 1000 or t2.bonus is null

#  Delete Duplicate Emails. LeetCode 196
# Write an SQL query to delete all the duplicate emails, keeping only one unique email with the smallest id. Note that you are supposed to write a DELETE statement and not a SELECT one.

DELETE t1 
FROM Person t1 
INNER JOIN Person t2
ON t1.email = t2.email and t1.id > t2.id

# Fix Names in a Table. LeetCode 1667
# Write an SQL query to fix the names so that only the first character is uppercase and the rest are lowercase.

SELECT t1.name as Customers
FROM Customers t1
LEFT JOIN Orders t2 
ON t1.id = t2.customerId
Where t2.customerId is null

# Combine two tables. LeetCode 175
# We need all the persons, that is the reason why we use left join.

SELECT t1.firstName, t1.LastName, t2.city, t2.state
FROM Person t1
LEFT JOIN Address t2
ON t1.personId = t2.personId

# Duplicate Emails. LeetCode 182
# We group the table by email and count if there are more than 1 emails.

SELECT email
FROM Person t1
GROUP BY email
HAVING COUNT(email) > 1

# Employees Earning More Than Their Managers. LeetCode 181
# First we look for the employers who have a manager, after that we select the ones who have the salary greater than managers.

SELECT e1.name as employee
FROM Employee e1
JOIN Employee e2 
ON e1.managerId = e2.id
WHERE e1.salary > e2.salary

# Rising Temperature. LeetCode 197
# We look for the records that have the temperature higher and the difference between dates is 1.

SELECT t1.id
FROM Weather t1, Weather t2
WHERE t1.temperature > t2.temperature
AND DATEDIFF(t1.recordDate, t2.recordDate) = 1

# Find Followers Count. LeetCode 1729
# Write an SQL query that will, for each user, return the number of followers. Return the result table ordered by user_id in ascending order.

SELECT user_id, count(follower_id) as followers_count
FROM Followers 
GROUP BY user_id
ORDER BY user_id

# Rearrange Products Table. LeetCode 1795
# Write an SQL query to rearrange the Products table so that each row has (product_id, store, price). If a product is not available in a store, do not include a row with that product_id and store combination in the result table.

SELECT product_id, 'store1' as store, store1 as price
FROM Products
where store1 is not null

union 

SELECT product_id, 'store2' as store, store2 as price
FROM Products
where store2 is not null

union 

SELECT product_id, 'store3' as store, store3 as price
FROM Products
where store3 is not null