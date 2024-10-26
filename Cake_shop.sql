create database Cake_shop;
use Cake_shop;

-- Cakes Table
CREATE TABLE Cakes (
    cake_id INT PRIMARY KEY,
    flavour VARCHAR(255),
    weight_kg DECIMAL(4,2),
    price DECIMAL(10,2),
    description TEXT,
    inventory_id INT,
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)  -- New FK
);

-- Pastries Table
CREATE TABLE Pastries (
    pastry_id INT PRIMARY KEY,
    flavour VARCHAR(255),
    price DECIMAL(10,2),
    description TEXT,
    inventory_id INT,
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)  -- New FK
);

-- Decorations Table
CREATE TABLE Decorations (
    decor_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    price DECIMAL(10,2),
    description TEXT,
    inventory_id INT,
    FOREIGN KEY (inventory_id) REFERENCES Inventory(inventory_id)  -- New FK
);

-- Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(255),
    contact_info VARCHAR(255),
    address TEXT
);

-- Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    employee_id INT,  -- New FK to reference Employees
    total_price DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)  -- New FK
);

-- Order Details Table
CREATE TABLE Order_Details (
    order_detail_id INT PRIMARY KEY,
    order_id INT,
    item_type ENUM('Cake', 'Pastry', 'Decoration'),
    item_id INT,
    quantity INT,
    price DECIMAL(10,2),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id)
);

-- Payments Table
CREATE TABLE Payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    employee_id INT,  -- New FK to reference Employees
    payment_method ENUM('Cash', 'Card', 'UPI'),
    payment_status ENUM('Full-Paid', 'Half-Paid', 'Cancelled', 'Pending'),
    payment_date DATE,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)  -- New FK
);

-- Inventory Table
CREATE TABLE Inventory (
    inventory_id INT PRIMARY KEY,
    item_name VARCHAR(255),
    quantity INT,
    unit varchar(55),
    reorder_level INT
);

-- Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY,
    name VARCHAR(255),
    role VARCHAR(100),
    contact_info VARCHAR(255),
    salary DECIMAL(10,2)
);

-- Delivery Table
CREATE TABLE Delivery (
    delivery_id INT PRIMARY KEY,
    order_id INT,
    employee_id INT,  -- New FK to reference Employees
    delivery_address TEXT,
    delivery_date DATE,
    delivery_status varchar(88),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(employee_id)  -- New FK
);


-- Insert into Cakes (Updated for weight range from 0.5 kg to 5 kg)
INSERT INTO Cakes VALUES
(1, 'Chocolate', 0.50, 300.00, 'Chocolate cake for small celebrations', 1),
(2, 'Vanilla', 1.00, 600.00, 'Vanilla cake for birthday parties', 2),
(3, 'Strawberry', 2.00, 1200.00, 'Strawberry cake for anniversaries', 3),
(4, 'Red Velvet', 3.00, 1800.00, 'Large red velvet cake for big events', 4),
(5, 'Black Forest', 5.00, 3000.00, 'Black Forest cake for grand celebrations', 5),
(6, 'Pineapple', 0.50, 350.00, 'Small pineapple cake for gatherings', 6),
(7, 'Butterscotch', 1.50, 900.00, 'Butterscotch cake for medium-sized parties', 7),
(8, 'Coffee', 2.50, 1400.00, 'Coffee-flavored cake for special events', 8),
(9, 'Fruit Cake', 3.00, 1800.00, 'Fruit cake for big celebrations', 9),
(10, 'Mango', 4.00, 2200.00, 'Mango cake for large birthday parties', 10),
(11, 'Oreo', 5.00, 3500.00, 'Oreo cake for special occasions', 11),
(12, 'Blueberry', 0.50, 400.00, 'Small blueberry cake for casual events', 12),
(13, 'Lemon', 1.00, 600.00, 'Lemon cake for small celebrations', 13),
(14, 'Cheesecake', 3.00, 2800.00, 'Large cheesecake for special events', 14),
(15, 'Tiramisu', 2.00, 1500.00, 'Tiramisu cake for intimate parties', 15),
(16, 'Carrot Cake', 1.50, 800.00, 'Carrot cake for family gatherings', 16),
(17, 'Marble Cake', 0.50, 350.00, 'Small marble cake for casual celebrations', 17),
(18, 'Raspberry', 4.50, 2800.00, 'Raspberry cream cake for big occasions', 18),
(19, 'Peanut Butter', 2.50, 1300.00, 'Peanut butter cake for small events', 19),
(20, 'Almond', 5.00, 3800.00, 'Almond cake for large celebrations', 20),
(21, 'Honey Cake', 1.00, 750.00, 'Honey cake for small family events', 21),
(22, 'Orange Cake', 2.00, 1200.00, 'Orange cake for birthday parties', 22),
(23, 'Coconut Cake', 3.50, 1800.00, 'Coconut cake for special events', 23),
(24, 'Pistachio Cake', 4.00, 2500.00, 'Pistachio cake for large gatherings', 24),
(25, 'Walnut Cake', 0.50, 350.00, 'Small walnut cake for casual events', 25),
(26, 'Mint Chocolate', 5.00, 4000.00, 'Mint chocolate cake for big celebrations', 26),
(27, 'Banana Cake', 1.50, 900.00, 'Banana cake for medium-sized parties', 27),
(28, 'Sponge Cake', 2.50, 1400.00, 'Sponge cake for large gatherings', 28),
(29, 'Hazelnut Cake', 3.00, 2200.00, 'Hazelnut cake for special occasions', 29),
(30, 'Mango', 5.00, 3500.00, 'Large mango cake for anniversaries or big parties', 30);


-- Insert into Pastries (30 rows)
INSERT INTO Pastries (pastry_id, flavour, price, description, inventory_id) VALUES
(1, 'Chocolate', 50.00, 'Chocolate pastry', 1),
(2, 'Vanilla', 45.00, 'Vanilla pastry', 2),
(3, 'Butterscotch', 55.00, 'Butterscotch pastry', 3),
(4, 'Mango', 60.00, 'Mango flavored pastry', 4),
(5, 'Strawberry', 50.00, 'Fresh strawberry pastry', 5),
(6, 'Pineapple', 55.00, 'Pineapple pastry', 6),
(7, 'Blueberry', 65.00, 'Blueberry pastry', 7),
(8, 'Coffee', 70.00, 'Coffee-flavored pastry', 8),
(9, 'Red Velvet', 75.00, 'Red Velvet pastry', 9),
(10, 'Caramel', 60.00, 'Caramel pastry', 10),
(11, 'Oreo', 80.00, 'Oreo pastry', 11),
(12, 'Banana', 50.00, 'Banana pastry', 12),
(13, 'Hazelnut', 85.00, 'Hazelnut pastry', 13),
(14, 'Mint', 70.00, 'Mint-flavored pastry', 14),
(15, 'Raspberry', 65.00, 'Raspberry pastry', 15),
(16, 'Blackberry', 60.00, 'Blackberry pastry', 16),
(17, 'Peanut Butter', 75.00, 'Peanut butter pastry', 17),
(18, 'Coconut', 55.00, 'Coconut pastry', 18),
(19, 'Almond', 80.00, 'Almond pastry', 19),
(20, 'Walnut', 75.00, 'Walnut pastry', 20),
(21, 'Orange', 55.00, 'Orange-flavored pastry', 21),
(22, 'Pistachio', 85.00, 'Pistachio pastry', 22),
(23, 'Sponge', 50.00, 'Sponge pastry', 23),
(24, 'Cheesecake', 90.00, 'Cheesecake pastry', 24),
(25, 'Tiramisu', 100.00, 'Tiramisu pastry', 25),
(26, 'Mousse', 85.00, 'Chocolate mousse pastry', 26),
(27, 'Marble', 60.00, 'Marble pastry', 27),
(28, 'Carrot', 55.00, 'Carrot-flavored pastry', 28),
(29, 'Apple', 70.00, 'Apple-flavored pastry', 29),
(30, 'Lemon', 65.00, 'Lemon-flavored pastry', 30);


-- Insert into Decorations (first 8 rows)
INSERT INTO Decorations (decor_id, item_name, price, description, inventory_id) VALUES
(1, 'Balloon Set', 150.00, 'Balloons for decoration', 1),
(2, 'Normal Candles', 30.00, 'Candles for cake', 4),
(3, 'Number Candles', 50.00, 'Candles for cake', 20),
(4, 'Banners', 120.00, 'Celebration banners', 5),
(5, 'Ribbons', 80.00, 'Ribbons for cake and decor', 7),
(6, 'Sparkle ', 55.00, 'Sparkles for Cake ', 8),
(7, 'Big Ballon ', 45.00, 'Big ballon ', 5);


-- Insert into Customers (50 rows, including duplicates)
INSERT INTO Customers (customer_id, customer_name, contact_info, address) VALUES
(1, 'Rahul Sharma', '9876543210', 'Mumbai, India'),
(2, 'Pooja Singh', '9123456789', 'Delhi, India'),
(3, 'Rahul Sharma', '9123456710', 'Mumbai, India'),  -- Duplicate name, different details
(4, 'Amit Verma', '9876543123', 'Bangalore, India'),
(5, 'Sneha Patil', '9812345678', 'Mumbai, India'),
(6, 'Rahul Sharma', '9812345123', 'Pune, India'),  -- Duplicate name again
(7, 'Anjali Desai', '9988776655', 'Mumbai, India'),
(8, 'Sameer Khan', '9876541234', 'Mumbai, India'),
(9, 'Riya Mehta', '8765432109', 'Mumbai, India'),
(10, 'Rohan Gupta', '9912345678', 'Mumbai, India'),
(11, 'Aditi Joshi', '9700000001', 'Mumbai, India'),
(12, 'Rahul Sharma', '9000000002', 'Mumbai, India'),  -- Another duplicate
(13, 'Vikram Singh', '9912345689', 'Mumbai, India'),
(14, 'Priya Chavan', '9988776644', 'Mumbai, India'),
(15, 'Tarun Yadav', '7777777777', 'Mumbai, India'),
(16, 'Kajal Patil', '6666666666', 'Mumbai, India'),
(17, 'Neha Sinha', '5555555555', 'Mumbai, India'),
(18, 'Rakesh Joshi', '4444444444', 'Mumbai, India'),
(19, 'Suresh Naik', '3333333333', 'Mumbai, India'),
(20, 'Rahul Sharma', '2222222222', 'Mumbai, India'),  -- Another entry for Rahul
(21, 'Karan Bhatia', '1111111111', 'Mumbai, India'),
(22, 'Snehal Khatri', '8888888888', 'Mumbai, India'),
(23, 'Dinesh Patil', '9999998888', 'Mumbai, India'),
(24, 'Asha Verma', '7777776666', 'Mumbai, India'),
(25, 'Ajay Rathi', '8888885555', 'Mumbai, India'),
(26, 'Raghav Sharma', '6666664444', 'Mumbai, India'),
(27, 'Vani Mehta', '5555553333', 'Mumbai, India'),
(28, 'Aarav Singh', '4444442222', 'Mumbai, India'),
(29, 'Isha Joshi', '3333331111', 'Mumbai, India'),
(30, 'Ravi Patel', '9999999999', 'Ahmedabad, India'),
(31, 'Nikita Gupta', '9988773322', 'Mumbai, India'),
(32, 'Kriti Agarwal', '9933445566', 'Mumbai, India'),
(33, 'Rajesh Rathi', '9988776655', 'Mumbai, India'),
(34, 'Seema Das', '8899001122', 'Mumbai, India'),
(35, 'Amit Soni', '8833445566', 'Mumbai, India'),
(36, 'Neelam Thakur', '9988773344', 'Mumbai, India'),
(37, 'Prakash Desai', '8844556677', 'Mumbai, India'),
(38, 'Anita Roy', '9911223344', 'Mumbai, India'),
(39, 'Shivam Tiwari', '9922334455', 'Mumbai, India'),
(40, 'Meera Kaur', '9999888777', 'Mumbai, India'),
(41, 'Gaurav Yadav', '9999990000', 'Mumbai, India'),
(42, 'Ritesh Bhardwaj', '7777777771', 'Mumbai, India'),
(43, 'Simran Singh', '6666667771', 'Mumbai, India'),
(44, 'Harsh Kumar', '8888880000', 'Mumbai, India'),
(45, 'Tanya Joshi', '1112223333', 'Mumbai, India'),
(46, 'Kunal Khanna', '2221110000', 'Mumbai, India'),
(47, 'Riya Sharma', '3334445555', 'Mumbai, India'),
(48, 'Ankita Bansal', '4445556666', 'Mumbai, India'),
(49, 'Ravi Sharma', '5556667777', 'Mumbai, India'),
(50, 'Ananya Verma', '6667778888', 'Mumbai, India');


-- Insert into Orders
INSERT INTO Orders (order_id, customer_id, employee_id, total_price, order_date) VALUES
(1, 1, 1, 1500.00, '2024-10-01'),
(2, 2, 2, 900.00, '2024-10-03'),
(3, 3, 3, 1100.00, '2024-10-05'),
(4, 4, 4, 1750.00, '2024-10-06'),
(5, 5, 5, 1300.00, '2024-10-07'),
(6, 6, 1, 950.00, '2024-10-08'),
(7, 7, 2, 1200.00, '2024-10-09'),
(8, 8, 3, 600.00, '2024-10-10'),
(9, 9, 4, 1550.00, '2024-10-12'),
(10, 10, 5, 850.00, '2024-10-13'),
(11, 6, 1, 2500.00, '2024-10-18'),
(12, 7, 2, 3200.00, '2024-10-18'),
(13, 8, 3, 4000.00, '2024-10-19'),
(14, 9, 4, 2300.00, '2024-10-20'),
(15, 10, 5, 2900.00, '2024-10-20'),
(16, 11, 1, 3500.00, '2024-10-21'),
(17, 12, 2, 2700.00, '2024-10-21'),
(18, 13, 3, 1800.00, '2024-10-22'),
(19, 14, 4, 1400.00, '2024-10-22'),
(20, 15, 5, 1600.00, '2024-10-22'),
(21, 16, 6, 2100.00, '2024-10-23'),
(22, 17, 7, 2200.00, '2024-10-23'),
(23, 18, 1, 2000.00, '2024-10-24'),
(24, 19, 2, 1900.00, '2024-10-24'),
(25, 20, 3, 2400.00, '2024-10-25'),
(26, 21, 4, 1750.00, '2024-10-25'),
(27, 22, 5, 1850.00, '2024-10-26'),
(28, 23, 6, 1950.00, '2024-10-26'),
(29, 24, 7, 2050.00, '2024-10-27'),
(30, 25, 1, 2150.00, '2024-10-27');


-- Insert into Order_Details (Sample Data)
INSERT INTO Order_Details (order_detail_id, order_id, item_type, item_id, quantity, price) VALUES
(1, 1, 'Cake', 1, 1, 500.00),
(2, 1, 'Pastry', 1, 4, 200.00),
(3, 2, 'Cake', 2, 1, 1000.00),
(4, 2, 'Decoration', 1, 1, 150.00),
(5, 3, 'Cake', 3, 1, 600.00),
(6, 3, 'Pastry', 2, 2, 400.00),
(7, 4, 'Cake', 4, 1, 700.00),
(8, 4, 'Decoration', 2, 1, 120.00),
(9, 5, 'Cake', 5, 1, 800.00),
(10, 5, 'Pastry', 3, 3, 600.00),
(11, 6, 'Cake', 6, 1, 900.00),
(12, 6, 'Decoration', 3, 1, 150.00),
(13, 7, 'Cake', 7, 1, 1000.00),
(14, 7, 'Pastry', 4, 2, 400.00),
(15, 8, 'Cake', 8, 1, 1100.00),
(16, 8, 'Decoration', 4, 1, 160.00),
(17, 9, 'Cake', 9, 1, 1200.00),
(18, 9, 'Pastry', 5, 2, 300.00),
(19, 10, 'Cake', 10, 1, 1300.00),
(20, 10, 'Decoration', 5, 1, 170.00),
(21, 11, 'Cake', 11, 1, 1400.00),
(22, 11, 'Pastry', 6, 3, 450.00),
(23, 12, 'Cake', 12, 1, 1500.00),
(24, 12, 'Decoration', 6, 1, 180.00),
(25, 13, 'Cake', 13, 1, 1600.00),
(26, 13, 'Pastry', 7, 2, 600.00),
(27, 14, 'Cake', 14, 1, 1700.00),
(28, 14, 'Decoration', 7, 1, 190.00),
(29, 15, 'Cake', 15, 1, 1800.00),
(30, 15, 'Pastry', 8, 3, 720.00),
(31, 16, 'Cake', 16, 1, 1900.00),
(32, 16, 'Decoration', 8, 1, 200.00),
(33, 17, 'Cake', 17, 1, 2000.00),
(34, 17, 'Pastry', 9, 2, 300.00),
(35, 18, 'Cake', 18, 1, 2100.00);


-- Insert into Payments (Sample Data)
INSERT INTO Payments (payment_id, order_id, employee_id, payment_method, payment_status, payment_date) VALUES
(1, 1, 1, 'UPI', 'Full-Paid', '2024-10-01'),
(2, 2, 2, 'Cash', 'Full-Paid', '2024-10-02'),
(3, 3, 1, 'Card', 'Half-Paid', '2024-10-03'),
(4, 4, 2, 'UPI', 'Full-Paid', '2024-10-04'),
(5, 5, 3, 'UPI', 'Pending', '2024-10-05'),
(6, 6, 1, 'Cash', 'Full-Paid', '2024-10-06'),
(7, 7, 2, 'Card', 'Full-Paid', '2024-10-07'),
(8, 8, 3, 'UPI', 'Half-Paid', '2024-10-08'),
(9, 9, 4, 'Cash', 'Full-Paid', '2024-10-09'),
(10, 10, 5, 'Card', 'Pending', '2024-10-10'),
(11, 11, 1, 'UPI', 'Full-Paid', '2024-10-11'),
(12, 12, 2, 'Cash', 'Full-Paid', '2024-10-12'),
(13, 13, 3, 'Card', 'Half-Paid', '2024-10-13'),
(14, 14, 4, 'UPI', 'Full-Paid', '2024-10-14'),
(15, 15, 5, 'Cash', 'Pending', '2024-10-15'),
(16, 16, 1, 'UPI', 'Full-Paid', '2024-10-16'),
(17, 17, 2, 'Card', 'Full-Paid', '2024-10-17'),
(18, 18, 3, 'Cash', 'Half-Paid', '2024-10-18'),
(19, 19, 4, 'UPI', 'Full-Paid', '2024-10-19'),
(20, 20, 5, 'Card', 'Pending', '2024-10-20'),
(21, 21, 1, 'Cash', 'Full-Paid', '2024-10-21'),
(22, 22, 2, 'UPI', 'Full-Paid', '2024-10-22'),
(23, 23, 3, 'Card', 'Half-Paid', '2024-10-23'),
(24, 24, 4, 'Cash', 'Full-Paid', '2024-10-24'),
(25, 25, 5, 'UPI', 'Pending', '2024-10-25'),
(26, 26, 1, 'Cash', 'Full-Paid', '2024-10-26'),
(27, 27, 2, 'Card', 'Full-Paid', '2024-10-27'),
(28, 28, 3, 'UPI', 'Half-Paid', '2024-10-28'),
(29, 29, 4, 'Cash', 'Full-Paid', '2024-10-29'),
(30, 30, 5, 'Cash', 'Full-Paid', '2024-10-30');


-- Insert into Inventory (Sample Data)
INSERT INTO Inventory (inventory_id, item_name, quantity, unit, reorder_level) VALUES
(1, 'Chocolate Cake Ingredients', 50, 'kg', 10),
(2, 'Vanilla Cake Ingredients', 60, 'kg', 15),
(3, 'Pastry Ingredients', 100, 'pieces', 20),
(4, 'Decoration Items', 150, 'pieces', 30),
(5, 'Strawberry Cake Ingredients', 40, 'kg', 8),
(6, 'Lemon Cake Ingredients', 30, 'kg', 6),
(7, 'Fruit Topping', 70, 'kg', 12),
(8, 'Whipped Cream', 80, 'kg', 18),
(9, 'Sprinkles', 200, 'pieces', 50),
(10, 'Cake Boxes', 300, 'pieces', 100),
(11, 'Chocolate Syrup', 20, 'liters', 5),
(12, 'Vanilla Extract', 25, 'liters', 6),
(13, 'Almond Flour', 15, 'kg', 3),
(14, 'Butter', 40, 'kg', 10),
(15, 'Eggs', 120, 'pieces', 30),
(16, 'Sugar', 50, 'kg', 12),
(17, 'Flour', 100, 'kg', 20),
(18, 'Baking Powder', 30, 'kg', 5),
(19, 'Salt', 15, 'kg', 3),
(20, 'Baking Soda', 10, 'kg', 2),
(21, 'Cooking Oil', 50, 'liters', 10),
(22, 'Milk', 100, 'liters', 20),
(23, 'Cream Cheese', 30, 'kg', 7),
(24, 'Piping Bags', 200, 'pieces', 40),
(25, 'Chocolate Chips', 45, 'kg', 8),
(26, 'Fondant', 25, 'kg', 5),
(27, 'Gelatin', 10, 'kg', 2),
(28, 'Cocoa Powder', 15, 'kg', 3),
(29, 'Caramel Sauce', 12, 'liters', 3),
(30, 'Mango Cake Ingredients', 20, 'kg', 5);


-- Insert into Employees (10 rows with specified roles)
INSERT INTO Employees (employee_id, name, role, contact_info, salary) VALUES
(1, 'Amit Kumar', 'Cashier', '9823456789', 20000.00),
(2, 'Sunita Gupta', 'Baker', '9812345678', 25000.00),
(3, 'Rajesh Mehta', 'Delivery Staff', '9876543211', 18000.00),
(4, 'Rani Sinha', 'Delivery Staff', '9821345678', 22000.00),
(5, 'Anil Sharma', 'Manager', '9812456789', 30000.00),  -- 1 Manager
(6, 'Neha Desai', 'Baker', '9812345123', 24000.00),      -- 2nd Baker
(7, 'Rakesh Jain', 'Delivery Staff', '9823415678', 18000.00),  -- 2nd Delivery Staff
(8, 'Rahul Yadav', 'Cashier', '9823456123', 21000.00),   -- 2nd Cashier
(9, 'Sneha Patil', 'Cashier', '9812345670', 20000.00),    -- 3rd Cashier
(10, 'Pooja Rathi', 'Cleaning Staff', '9812365789', 15000.00); -- 1 Cleaning Staff



-- Insert into Delivery (Sample Data)
INSERT INTO Delivery (delivery_id, order_id, employee_id, delivery_address, delivery_date, delivery_status) VALUES
(1, 1, 3, 'Mumbai, India', '2024-10-02', 'Delivered'),
(2, 2, 4, 'Delhi, India', '2024-10-03', 'Pending'),
(3, 3, 3, 'Mumbai, India', '2024-10-04', 'Delivered'),
(4, 4, 3, 'Bangalore, India', '2024-10-05', 'Dispatched'),
(5, 5, 3, 'Mumbai, India', '2024-10-06', 'Pending'),
(6, 6, 4, 'Mumbai, India', '2024-10-07', 'On Delivery'),
(7, 7, 2, 'Mumbai, India', '2024-10-08', 'Completed'),
(8, 8, 1, 'Mumbai, India', '2024-10-09', 'Dispatched'),
(9, 9, 5, 'Mumbai, India', '2024-10-10', 'Pending'),
(10, 10, 2, 'Mumbai, India', '2024-10-11', 'On Delivery'),
(11, 11, 3, 'Mumbai, India', '2024-10-12', 'Delivered'),
(12, 12, 4, 'Mumbai, India', '2024-10-13', 'Pending'),
(13, 13, 5, 'Mumbai, India', '2024-10-14', 'Dispatched'),
(14, 14, 1, 'Mumbai, India', '2024-10-15', 'On Delivery'),
(15, 15, 2, 'Mumbai, India', '2024-10-16', 'Completed'),
(16, 16, 3, 'Mumbai, India', '2024-10-17', 'Delivered'),
(17, 17, 4, 'Mumbai, India', '2024-10-18', 'Pending'),
(18, 18, 5, 'Mumbai, India', '2024-10-19', 'Dispatched'),
(19, 19, 1, 'Mumbai, India', '2024-10-20', 'On Delivery'),
(20, 20, 2, 'Mumbai, India', '2024-10-21', 'Completed'),
(21, 21, 3, 'Mumbai, India', '2024-10-22', 'Delivered'),
(22, 22, 4, 'Mumbai, India', '2024-10-23', 'Pending'),
(23, 23, 5, 'Mumbai, India', '2024-10-24', 'Dispatched'),
(24, 24, 1, 'Mumbai, India', '2024-10-25', 'On Delivery'),
(25, 25, 2, 'Mumbai, India', '2024-10-26', 'Completed'),
(26, 26, 3, 'Mumbai, India', '2024-10-27', 'Delivered'),
(27, 27, 4, 'Mumbai, India', '2024-10-28', 'Pending'),
(28, 28, 5, 'Mumbai, India', '2024-10-29', 'Dispatched'),
(29, 29, 1, 'Mumbai, India', '2024-10-30', 'On Delivery'),
(30, 30, 2, 'Ahmedabad, India', '2024-10-31', 'Dispatched');


select * from Cakes ;
select * from Pastries ;
select * from Decorations ;
select * from Customers ;
select * from Orders ; --
select * from Order_Details ; -- 
select * from Payments ; --
select * from Inventory ;
select * from Employees ;
select * from Delivery ; -- 

Desc Cakes ;
Desc Pastries ;
Desc Decorations ;
Desc Customers ; 
Desc Orders ;
Desc Order_Details ;
Desc Payments ;
Desc Inventory ;
Desc Employees ;
Desc Delivery ;

--------------
-- Questions
--------------

-- change column name of cakes tables
ALTER TABLE Cakes
RENAME COLUMN flavour TO Cake_Name;

-- To find all cakes with a price above 3500?
SELECT Cake_Name, price 
FROM Cakes 
WHERE price > 3500;

-- To find cakes that are best for small celebrations price below 500 ?
SELECT Cake_Name, description, price
FROM Cakes 
WHERE price < 500;

-- To count how many types of cakes are available:
SELECT COUNT(*) AS total_cakes 
FROM Cakes;

-- To find 5 customers from Mumbai:
SELECT customer_name, contact_info 
FROM Customers 
WHERE address LIKE '%Mumbai%'
limit 5;

--  To find customers who have the name 'Rahul Sharma'?
SELECT * 
FROM Customers 
WHERE customer_name = 'Rahul Sharma';

-- to display cakes in descending order of their price and weight ?
SELECT  Cake_Name, weight_kg, price 
FROM Cakes 
ORDER BY price DESC
limit 10;

-- To find the cheapest cake:
SELECT  Cake_Name, MIN(price) AS lowest_price 
FROM Cakes 
GROUP BY Cake_Name 
LIMIT 5;

-- To find all cakes that weigh more than 2 kg?
SELECT  Cake_Name, weight_kg
FROM Cakes 
WHERE weight_kg > 2.00
limit 5;

-- To find cakes meant for special events?
SELECT  Cake_Name, description 
FROM Cakes 
WHERE description LIKE '%special occasions%';

-- Find all customers who have placed orders?
SELECT DISTINCT Customers.customer_id, customer_name, contact_info, address
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id limit 5;

-- Get total orders made by each customer ?
SELECT Customers.customer_name, COUNT(Orders.order_id) AS total_orders
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
GROUP BY Customers.customer_name limit 3;

-- Show all orders, including customer names, total price, and order dates:
SELECT Orders.order_id, Customers.customer_name, Orders.total_price, Orders.order_date
FROM Orders
JOIN Customers ON Orders.customer_id = Customers.customer_id limit 15;

-- Find the total sales made in a given month  ?
SELECT SUM(total_price) AS total_sales
FROM Orders
WHERE MONTH(order_date) = 10 AND YEAR(order_date) = 2024;

-- List all employees along with their roles and contact information:
SELECT employee_id, name, role, contact_info,salary
FROM Employees;

-- Find all pending or unpaid payments:
SELECT Payments.payment_id, Payments.payment_status, Payments.payment_date, Orders.order_id, Customers.customer_name
FROM Payments
JOIN Orders ON Payments.order_id = Orders.order_id
JOIN Customers ON Orders.customer_id = Customers.customer_id
WHERE Payments.payment_status IN ('Half-Paid', 'Pending');

-- Display all deliveries along with delivery status and date:
SELECT delivery_id, Orders.order_id, Customers.customer_name, Delivery.delivery_address, Delivery.delivery_date, Delivery.delivery_status
FROM Delivery
JOIN Orders ON Delivery.order_id = Orders.order_id
JOIN Customers ON Orders.customer_id = Customers.customer_id;

-- change  salary of employee
UPDATE Employees
SET salary = 15000.00
WHERE name = 'Amit Kumar';

-- which pastry is customer  buying ? 
SELECT 
    C.customer_name,
    PA.flavour AS pastry_name,
    PA.price AS pastry_price
FROM Customers C
JOIN Orders O ON C.customer_id = O.customer_id
JOIN Order_Details OD ON O.order_id = OD.order_id
JOIN Pastries PA ON OD.item_id = PA.pastry_id
WHERE OD.item_type = 'Pastry' limit 5;

-- Top 3 Max salary of cashier
SELECT name,salary
FROM Employees
WHERE role = 'Cashier'
ORDER BY salary DESC
LIMIT 3;
