create database inventory
use inventory;
CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(150),
    product_code VARCHAR(50) UNIQUE,
    category VARCHAR(100),
    unit_price DECIMAL(10,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
CREATE TABLE suppliers (
    supplier_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);
CREATE TABLE warehouses (
    warehouse_id INT PRIMARY KEY AUTO_INCREMENT,
    warehouse_name VARCHAR(100),
    location VARCHAR(150)
);
CREATE TABLE stock (
    stock_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    warehouse_id INT,
    quantity INT DEFAULT 0,
    FOREIGN KEY (product_id) REFERENCES products(product_id),
    FOREIGN KEY (warehouse_id) REFERENCES warehouses(warehouse_id)
);
CREATE TABLE purchases (
    purchase_id INT PRIMARY KEY AUTO_INCREMENT,
    supplier_id INT,
    purchase_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (supplier_id) REFERENCES suppliers(supplier_id)
);
CREATE TABLE purchase_items (
    purchase_item_id INT PRIMARY KEY AUTO_INCREMENT,
    purchase_id INT,
    product_id INT,
    quantity INT,
    cost_price DECIMAL(10,2),
    FOREIGN KEY (purchase_id) REFERENCES purchases(purchase_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100),
    phone VARCHAR(15),
    email VARCHAR(100),
    address TEXT
);
CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT,
    sale_date DATE,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);
CREATE TABLE sales_items (
    sales_item_id INT PRIMARY KEY AUTO_INCREMENT,
    sale_id INT,
    product_id INT,
    quantity INT,
    selling_price DECIMAL(10,2),
    FOREIGN KEY (sale_id) REFERENCES sales(sale_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);
CREATE TABLE employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    employee_name VARCHAR(100),
    role VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100)
);
INSERT INTO products (product_name, product_code, category, unit_price) VALUES
('Laptop Dell', 'P001', 'Electronics', 55000),
('HP Laptop', 'P002', 'Electronics', 60000),
('Samsung Monitor', 'P003', 'Electronics', 12000),
('Wireless Mouse', 'P004', 'Accessories', 800),
('Keyboard Logitech', 'P005', 'Accessories', 1500),
('Office Chair', 'P006', 'Furniture', 7000),
('Wooden Table', 'P007', 'Furniture', 9000),
('Printer Canon', 'P008', 'Electronics', 15000),
('Pen Pack', 'P009', 'Stationery', 200),
('Notebook A4', 'P010', 'Stationery', 80),
('Mobile iPhone', 'P011', 'Electronics', 75000),
('Mobile Samsung', 'P012', 'Electronics', 45000),
('Power Bank', 'P013', 'Accessories', 1200),
('USB Cable', 'P014', 'Accessories', 300),
('Router TP-Link', 'P015', 'Electronics', 2500);

INSERT INTO suppliers (supplier_name, phone, email, address) VALUES
('Tech Distributors', '9876543210', 'tech@gmail.com', 'Chennai'),
('Office Needs Pvt Ltd', '9123456780', 'office@gmail.com', 'Bangalore'),
('Furniture Hub', '9988776655', 'furn@gmail.com', 'Coimbatore'),
('Electro World', '9090909090', 'electro@gmail.com', 'Mumbai'),
('Stationery Mart', '9001122334', 'stat@gmail.com', 'Delhi'),
('Gadget Zone', '9445566778', 'gadget@gmail.com', 'Hyderabad'),
('Digital Suppliers', '9887766554', 'digital@gmail.com', 'Pune'),
('Wholesale Traders', '9112233445', 'trade@gmail.com', 'Chennai');

INSERT INTO warehouses (warehouse_name, location) VALUES
('Central Warehouse', 'Chennai'),
('Branch Warehouse', 'Coimbatore'),
('Backup Warehouse', 'Bangalore');

INSERT INTO stock (product_id, warehouse_id, quantity) VALUES
(1, 1, 20),
(2, 1, 15),
(3, 1, 30),
(4, 2, 50),
(5, 2, 40),
(6, 3, 10),
(7, 3, 12),
(8, 1, 8),
(9, 2, 100),
(10, 2, 200),
(11, 1, 5),
(12, 3, 7),
(13, 1, 25),
(14, 2, 60),
(15, 3, 18);

INSERT INTO purchases (supplier_id, purchase_date, total_amount) VALUES
(1, '2026-01-10', 150000),
(2, '2026-01-15', 50000),
(3, '2026-01-20', 75000),
(4, '2026-02-01', 120000),
(5, '2026-02-05', 10000),
(6, '2026-02-10', 95000);

INSERT INTO purchase_items (purchase_id, product_id, quantity, cost_price) VALUES
(1, 1, 5, 52000),
(1, 3, 10, 11000),
(2, 4, 20, 700),
(2, 5, 15, 1300),
(3, 6, 5, 6500),
(3, 7, 4, 8500),
(4, 11, 3, 72000),
(4, 12, 4, 43000),
(5, 9, 100, 150),
(5, 10, 200, 60),
(6, 13, 10, 1000),
(6, 15, 6, 2200);

INSERT INTO customers (customer_name, phone, email, address) VALUES
('Ravi Kumar', '9876500011', 'ravi@gmail.com', 'Chennai'),
('Priya Sharma', '9876500022', 'priya@gmail.com', 'Coimbatore'),
('Arjun Singh', '9876500033', 'arjun@gmail.com', 'Bangalore'),
('Meena Devi', '9876500044', 'meena@gmail.com', 'Hyderabad'),
('Rahul Das', '9876500055', 'rahul@gmail.com', 'Mumbai'),
('Sneha Patel', '9876500066', 'sneha@gmail.com', 'Delhi'),
('Karthik Raja', '9876500077', 'karthik@gmail.com', 'Pune'),
('Anjali Verma', '9876500088', 'anjali@gmail.com', 'Chennai');

Insert INTO sales (  sale_id, customer_id, sale_date, total_amount)VALUES
(1,1,12-02-2026,60000),
(2,2,13-02-2026,1500),
(3,3,14-02-2026,9000),
(4,4,15-02-2026,75000),
(5,5,16-02-2026,2500),
(6,6,17-02-2026,12000);

INSERT INTO sales_items (sale_id, product_id, quantity, selling_price) VALUES
(1, 2, 1, 60000),
(1, 4, 2, 850),
(2, 5, 1, 1500),
(2, 9, 5, 200),
(3, 7, 1, 9000),
(3, 6, 1, 7000),
(4, 11, 1, 75000),
(4, 13, 2, 1200),
(5, 15, 1, 2500),
(5, 14, 3, 300),
(6, 3, 1, 12000),
(6, 8, 1, 15000);

INSERT INTO employees (employee_name, role, phone, email) VALUES
('Suresh Kumar', 'Manager', '9000011111', 'suresh@gmail.com'),
('Lakshmi Priya', 'Inventory Staff', '9000022222', 'lakshmi@gmail.com'),
('John Peter', 'Warehouse Staff', '9000033333', 'john@gmail.com'),
('Ayesha Khan', 'Sales Executive', '9000044444', 'ayesha@gmail.com'),
('Manoj Sharma', 'Accountant', '9000055555', 'manoj@gmail.com');

select * from products	;
select * from suppliers	;
select * from warehouses	;
select * from stock	;
select * from purchases	;
select * from purchase_items ;	
select * from customers	;
select * from sales	;
select * from sales_items	;
select * from employees;

select * from products where unit_price > 10000;
select * from customers where address = "chennai";
select * from suppliers where address = "bangalore";
select * from products where category = "electronics";
select * from employees where  role = "manager";
select product_name from products  where unit_price between 1000 and 10000;
select * from stock where quantity < 10;
select * from customers where customer_name like "a%";
select product_name from products order by unit_price desc ;



select a.product_name, b.quantity,c.warehouse_name  from products as a 
join stock  as b on b.product_id = a.product_id
join warehouses as c on c.warehouse_id= b.warehouse_id;

select a.purchase_id,a.purchase_date ,a.total_amount ,b.supplier_name from purchases as a
left join suppliers as b on a.supplier_id =b.supplier_id;

select  a.sale_id , a.sale_date ,a.total_amount,b.customer_name from sales as a
left join customers as b on a.customer_id = b.customer_id;

select a.warehouse_name,b.stock_id, b.product_id, b.quantity from  warehouses as a
left join stock as b  on a.warehouse_id=b.warehouse_id order by warehouse_name ;

select b.product_name,a.purchase_item_id,a.purchase_id,a.quantity,a.cost_price from purchase_items as a
left join products as b on a.product_id = b.product_id;

select a.product_id,a.product_name,a.product_code,a.category,a.unit_price,a.created_at,b.supplier_name from products as a
left join  purchase_items as c on a.product_id = c.product_id 
left join purchases as d on c.purchase_id = d.purchase_id
left join suppliers as b on b.supplier_id = d.supplier_id where b.supplier_name = "Tech Distributors";

select a.product_id,a.product_name,a.product_code,a.category,a.unit_price,a.created_at,d.customer_name from products as a
left join sales_items as b on a.product_id = b.product_id
left join sales as c on b.sale_id = c.sale_id
left join customers as d on d.customer_id = c.customer_id where customer_name = "Ravi kumar";



select a.product_name , sum(b.quantity) from products as a
join stock as b on a.product_id = b.product_id
group by a.product_name;

select a.supplier_name ,sum(b.total_amount) from purchases as b
join suppliers as a on a.supplier_id = b.supplier_id
group by a.supplier_name ;
 
 select b.customer_name , sum(a.total_amount) from sales as a
 join customers as b on a.customer_id = b.customer_id
 group by b.customer_name;
 
 select b.product_name,sum(a.quantity) from  sales_items as a
 join products as b on a.product_id = b.product_id
 group by b.product_name;
 
select  category , avg(unit_price) from products group by category;

select count(customer_id),address from customers group by address;

select b.product_name , max(a.quantity) as Total_sales from sales_items as a
join products as b on a.product_id = b.product_id
group by b.product_name order by Total_sales desc limit 1;

select max(unit_price) as maximun_pro_price ,
		min(unit_price) as minimun_pro_price from products;
        
        
                
 select a.product_name, b.quantity from stock as b
 join products as a on b.product_id = a.product_id
 having quantity >20;
  
 select a.supplier_name, b.total_amount from suppliers as a
 join purchases as b on a.supplier_id = b.supplier_id
 having  b.total_amount > 100000;
 
 select a.customer_name ,b.total_amount from customers as a
 join sales as b on a.customer_id = b.customer_id
 having total_amount >50000;
 
 select category ,avg(unit_price) from products group by category having avg(unit_price) >20000;
 
 
 
 select * from products
 where unit_price > (select avg(unit_price) from products);
 
 select  customer_name from customers where customer_id in 
 (select customer_id from sales where sale_date = (select max(sale_date) from sales));
 
 select * from customers as a
 where customer_id in (select customer_id from sales
 where sale_date = (select min(sale_date) from sales));
  
select a.supplier_name from suppliers as a
left join purchases as b on a.supplier_id=b.supplier_id
left join purchase_items as c on c.purchase_id = b.purchase_id
left join products as d on c.product_id = d.product_id
where d.unit_price = (select max(unit_price) from products);

select * from products where product_id not in (select distinct product_id from sales_items) ;

select a.warehouse_name, b.quantity from warehouses as a
join stock as b on a.warehouse_id =b.warehouse_id 
where b.quantity = (select (max(b.quantity) from stock);



update products set unit_price = ((unit_price*0.1)+unit_price)    where category = "Electronics";

delete from customers  where customer_id not in (select customer_id from sales );

update stock set quantity= quantity-1 where product_id = 1;

alter table products change product_name product_name varchar(30) not null;

alter table stock  add constraint chk_quantity check (quantity  >= 0) ;



create view  createview  as
select * from employee where salary is not null ;

create  view sale_report as 
select a.customer_name,b.total_amount from customers as a
join sales as b on a.customer_id = b.customer_id;
select * from sale_report;

create view low_stock as
select b.product_name , a.quantity from stock as a
join products as b on a.product_id = b.product_id where a.quantity < 10;
select * from low_stock;
 
delimiter//
create procedure add_product(in pname varchar(30),in pcode varchar(30),in pcat varchar(30),in price decimal(10,2))
begin 
insert into products(product_name , product_code, product_category, unit_price )
values (pname ,pcode, pcat, price)
end // 
delimeter ;

select product_name, category, unit_price,
case
	when unit_price <= 15000 then "low price"
    when unit_price between  15000 and 50000 then "mid price"
    when unit_price > 50000 then "high price"
    else "Very high"
end as price_range from products ;

select a.product_name, 
case 
	when b.quantity <10 then "Low_stock"
    when b.quantity between 10 and 50 then "Medium_stock"
    when b.quantity between 51 and 100 then "High_stock"
    else "Very_High_stock" 
end as stock_range from products as a
join stock as b on a.product_id = b.product_id ;  








    
    
	


























