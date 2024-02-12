-- joins: select all the computers from the products table:
select * from products where Name like 'computer%';
-- using the products table and the categories table, return the product name and the category name */
 select products.Name AS 'Product Name', categories.Name AS 'Category Name' from products
 join categories on products.CategoryID= categories.CategoryID;
-- joins: find all product names, product prices, and products ratings that have a rating of 5 */
 -- product, reviews 
 select products.Name As 'product Name', products.Price As 'Product Price', reviews.Rating from products
 join reviews  On products.productID = reviews.productID
 where reviews.Rating = 5;
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
select employees.FirstName As 'Employee Name', SUM(sales.Quantity) AS 'Quantity Sold' 
 from  employees
join sales on employees.EmployeeID = sales.EmployeeID group by employees.EmployeeID limit 5;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
-- department name catagory
select departments.Name As 'Department Name',  categories.Name As'category Name'from departments 
join categories on departments.DepartmentID = categories.DepartmentID where categories.Name like 'Appliances' OR categories.Name like '%Games%';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
Select products.Name as'products Name', sum(sales.Quantity) as 'Total Sold' , sum(sales.Quantity* sales.PricePerUnit) as 'Total price ' from products
inner join sales on products.ProductID = sales.ProductID where ProductID = 97 ;
select * from sales where ProductID = 97;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
select p.Name , r.Reviewer, r.Rating, r.Comment from products as p 
inner join reviews as r on r.ProductID = p.ProductID 
where  p.ProductID = 857 AND r.Rating = true order by r.Rating desc;


-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */
 select e.EmployeeID, e.FirstName, e.LastName, p.Name, sum(s.Quantity) As Totalsold from sales as s
 inner join products as p On s.ProductID = p.ProductID
 inner join employees As e On  e.EmployeeID = s.EmployeeID
 group by e.EmployeeID, p.ProductID order by Totalsold desc ;
 
