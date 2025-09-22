create database RMS;
GO

use RMS;
GO

CREATE TABLE ContactMessages (
    MessageId INT IDENTITY PRIMARY KEY,
    Name NVARCHAR(100) NOT NULL,
    Email NVARCHAR(100) NOT NULL,
    Website NVARCHAR(255) NULL,
    Message NVARCHAR(MAX) NOT NULL,
    DateSubmitted DATETIME DEFAULT GETDATE(),
    Status NVARCHAR(20) DEFAULT 'New'
);
GO

CREATE TABLE Users (
    Id INT PRIMARY KEY IDENTITY,
 	Name NVARCHAR(100),
    Username NVARCHAR(50) NOT NULL,
 	Email NVARCHAR(100) ,
    Password NVARCHAR(50) NOT NULL,
    Role NVARCHAR(20) NOT NULL  -- Admin, Waiter
);
GO

CREATE TABLE Categories (
    CategoryId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(100) NOT NULL,
    Description NVARCHAR(255) NULL
);
GO

CREATE TABLE MenuItems (
    MenuItemId INT PRIMARY KEY IDENTITY(1,1),
    Name NVARCHAR(150) NOT NULL,
    Description NVARCHAR(255) NULL,
    Price DECIMAL(10,2) NOT NULL,
    CategoryId INT FOREIGN KEY REFERENCES Categories(CategoryId),
    Available BIT NOT NULL DEFAULT 1,
    ImageUrl NVARCHAR(255) NULL
);
GO

CREATE TABLE Orders (
    OrderId INT PRIMARY KEY IDENTITY(1,1),
    WaiterId INT NOT NULL, -- foreign key to Users or Employees table
    CustomerName NVARCHAR(100) NULL,
    TableNumber NVARCHAR(20) NULL, -- optional if needed
    OrderDate DATETIME NOT NULL DEFAULT GETDATE(),
    TotalAmount DECIMAL(10,2) NOT NULL
 	CONSTRAINT FK_Orders_Waiter FOREIGN KEY (WaiterId) REFERENCES Users(Id)
);
GO

CREATE TABLE OrderItems (
    OrderItemId INT PRIMARY KEY IDENTITY(1,1),
    OrderId INT FOREIGN KEY REFERENCES Orders(OrderId),
    MenuItemId INT FOREIGN KEY REFERENCES MenuItems(MenuItemId),
    Quantity INT NOT NULL,
    Price DECIMAL(10,2) NOT NULL
);
GO

--Insert into the user for admin

INSERT INTO Users (Name, Username, Email, Password, Role) VALUES ('Abdi', 'admin', 'abdi@gmail.com', '123', 'Admin');
GO

-- Insert into categories:

INSERT INTO Categories (Name, Description)
VALUES
('Breakfast', 'Monday – Friday | 7:30 a.m. – 10:00 a.m.'),
('Lunch', 'Monday – Friday | 11:30 a.m. – 2:30 p.m.'),
('Dinner', 'Monday – Saturday | 5:30 p.m. – 10:00 p.m.; Saturday & Sunday | 10:00 a.m. – 2:00 p.m.'),
('Brunch', ''),
('Beverages', 'Hot and cold drinks');
GO

-- Insert into MenuITems:

INSERT INTO MenuItems (Name, Description, Price, CategoryId, Available, ImageUrl)
VALUES
('Waffles', 'Chocolate Chip Waffles', 4.00, 1, 1, '/images/menu/waffles.jpg'),
('French toast', 'French toast', 10.00, 1, 1, '/images/menu/French toast.jpeg'),
('Brunch Eggs', 'Brunch Eggs', 4.00, 1, 1, '/images/menu/Brunch Eggs.jpeg'),
('Scrambled Eggs', 'Scrambled Eggs', 3.00, 1, 1, '/images/menu/Scrambled Eggs.jpeg'),
('Croissant', '', 6.50, 1, 1, '/images/menu/Croissant.jpeg'),
('Blueberry Scone', '', 4.50, 1, 1, '/images/menu/Blueberry Scone.jpg'),
('Grilled Chicken Sandwich', '', 14.00, 2, 1, '/images/menu/Grilled Chicken Sandwich.jpg'),
('Pasta Primavera', '', 16.00, 2, 1, '/images/menu/Pasta Primavera.jpg'),
('Beef Burger with Fries', '', 15.00, 2, 1, '/images/menu/Beef Burger with Fries.jpg'),
('Seared Scallops', '', 18.00, 3, 1, '/images/menu/Seared-Scallops.jpg'),
('Stuffed Mushrooms', '', 14.00, 3, 1, '/images/menu/stuffed-mushrooms.jpg'),
('Caprese Salad', '', 12.00, 3, 1, '/images/menu/Caprese Salad.jpeg'),
('Grilled Salmon with Asparagus', '', 28.00, 3, 1, '/images/menu/Grilled Salmon with Asparagus.jpeg'),
('Ribeye Steak with Garlic Butter', '', 32.00, 3, 1, '/images/menu/Ribeye Steak with Garlic Butter.jpg'),
('Vegetarian Risotto', '', 24.00, 3, 1, '/images/menu/Vegetarian Risotto.jpeg'),
('Tiramisu', '', 8.00, 3, 1, '/images/menu/Tiramisu.jpeg'),
('Chocolate Lava Cake', '', 9.00, 3, 1, '/images/menu/Chocolate Lava Cake.jpg'),
('Panna Cotta', '', 7.00, 3, 1, '/images/menu/Panna Cotta.jpeg'),
('Seasonal Fruit Tart', '', 8.00, 3, 1, '/images/menu/Seasonal Fruit Tart.jpg'),
('Avocado Toast', '', 12.00, 4, 1, '/images/menu/Avocado Toast.jpg'),
('Eggs Benedict', '', 15.00, 4, 1, '/images/menu/Eggs Benedict.jpg'),
('Pancakes with Maple Syrup', '', 14.00, 4, 1, '/images/menu/Pancakes with Maple Syrup.jpeg'),
('Espresso', '', 4.00, 5, 1, '/images/menu/Espresso.jpeg'),
('Cappuccino', '', 5.00, 5, 1, '/images/menu/cappuccino.jpg'),
('Herbal Tea', '', 4.50, 5, 1, '/images/menu/Herbal Tea.jpg'),
('Iced Latte', '', 5.00, 5, 1, '/images/menu/Iced Latte.jpeg'),
('Fresh Lemonade', '', 4.50, 5, 1, '/images/menu/Fresh Lemonade.jpeg'),
('Sparkling Water', '', 0.00, 5, 1, '/images/menu/Sparkling Water.jpeg');
GO
