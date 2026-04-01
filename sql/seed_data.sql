-- ============================================================
-- Sample Data — Bookstore Database System
-- ============================================================

-- ── Categories ────────────────────────────────────────────────
INSERT INTO Categories (Category_Name) VALUES
    ('Books'),
    ('Stationery'),
    ('Notebooks & Journals'),
    ('Art Supplies'),
    ('Office Supplies');

-- ── Users ─────────────────────────────────────────────────────
INSERT INTO Users (User_FName, User_MName, User_LName, Email, Password, Address, Role, Date_Registered, Account_Status) VALUES
    ('Admin',    NULL,      'Store',      'admin@bookstore.ma',    'hashed_pw_1', '12 Rue Hassan II, Ifrane',    'admin',    '2024-01-01', 'active'),
    ('Zaynab',   NULL,      'Aboulkacem', 'zaynab@aui.ma',         'hashed_pw_2', '45 Avenue Mohammed V, Ifrane','customer', '2024-09-01', 'active'),
    ('Rita',     NULL,      'Jalal',      'rita@aui.ma',           'hashed_pw_3', '7 Rue Atlas, Ifrane',         'customer', '2024-09-03', 'active'),
    ('Tanishka', NULL,      'Suwalka',    'tanishka@aui.ma',       'hashed_pw_4', '22 Rue Zitoun, Ifrane',       'customer', '2024-09-05', 'active'),
    ('Youssef',  'Ali',     'Benali',     'youssef@aui.ma',        'hashed_pw_5', '3 Rue des Cedres, Ifrane',    'customer', '2024-10-10', 'active'),
    ('Sara',     NULL,      'Moussaoui',  'sara@aui.ma',           'hashed_pw_6', '18 Blvd Al Fida, Ifrane',     'staff',    '2024-01-15', 'active');

-- ── Products ──────────────────────────────────────────────────
INSERT INTO Products (Name, Description, Price, Stock_Quantity, Low_Stock_Threshold, Category_ID) VALUES
    ('Introduction to Algorithms',      'Classic computer science textbook by CLRS',            120.00, 15,  3, 1),
    ('The Alchemist',                   'Novel by Paulo Coelho',                                 55.00, 30,  5, 1),
    ('Atomic Habits',                   'Self-improvement book by James Clear',                  70.00, 20,  5, 1),
    ('Clean Code',                      'Software engineering best practices by Robert Martin',  95.00, 10,  3, 1),
    ('Calculus: Early Transcendentals', 'Mathematics textbook by James Stewart',                150.00,  8,  3, 1),
    ('Ballpoint Pens (Pack of 10)',     'Blue ink, medium tip',                                  12.00, 80, 10, 2),
    ('Highlighters Set',                'Assorted colors, pack of 6',                            18.00, 60, 10, 2),
    ('Ruler 30cm',                      'Transparent plastic ruler',                              5.00, 50, 10, 2),
    ('Scientific Calculator',           'Casio FX-991ES Plus',                                  180.00, 12,  3, 2),
    ('Sticky Notes Pack',               'Yellow, 3x3 inch, 100 sheets',                          10.00, 70, 15, 2),
    ('Spiral Notebook A4',              '200 pages, ruled',                                      22.00, 45,  8, 3),
    ('Hardcover Journal',               'Dotted pages, 160 pages, A5',                           35.00, 25,  5, 3),
    ('Composition Notebook',            'Wide ruled, 100 pages',                                 15.00, 40,  8, 3),
    ('Watercolor Set',                  '24 colors, professional grade',                         95.00,  6,  3, 4),
    ('Sketching Pencils Set',           'Grades 2H to 6B, pack of 12',                           45.00, 20,  5, 4),
    ('Stapler',                         'Desktop stapler with 1000 staples',                     38.00, 15,  4, 5),
    ('Paper Clips Box',                 'Assorted sizes, 200 count',                              8.00, 90, 15, 5),
    ('File Folders Pack',               'Manila folders, pack of 20',                            25.00, 35, 10, 5);

-- ── Orders ────────────────────────────────────────────────────
INSERT INTO Orders (Order_Date, Total_Amount, Order_Status, User_ID) VALUES
    ('2024-11-01 10:30:00', 190.00, 'Delivered',  2),
    ('2024-11-05 14:15:00', 125.00, 'Delivered',  3),
    ('2024-11-10 09:00:00',  57.00, 'Shipped',    4),
    ('2024-11-15 16:45:00', 300.00, 'Processed',  5),
    ('2024-11-20 11:20:00',  83.00, 'Pending',    2),
    ('2024-11-22 13:00:00', 215.00, 'Pending',    3);

-- ── OrderDetails ──────────────────────────────────────────────
INSERT INTO OrderDetails (Order_ID, Product_ID, Quantity, Unit_Price) VALUES
    (1, 1,  1, 120.00),  -- Intro to Algorithms
    (1, 6,  1,  12.00),  -- Pens
    (1, 11, 1,  22.00),  -- Spiral Notebook
    (1, 8,  1,   5.00),  -- Ruler
    (2, 3,  1,  70.00),  -- Atomic Habits
    (2, 7,  1,  18.00),  -- Highlighters
    (2, 12, 1,  35.00),  -- Hardcover Journal
    (3, 2,  1,  55.00),  -- The Alchemist
    (3, 10, 1,  10.00),  -- Sticky Notes
    (4, 5,  1, 150.00),  -- Calculus textbook
    (4, 9,  1, 180.00),  -- Scientific Calculator (adjusted total)
    (5, 4,  1,  95.00),  -- Clean Code (adjusted)
    (6, 1,  1, 120.00),  -- Intro to Algorithms
    (6, 14, 1,  95.00);  -- Watercolor Set

-- ── Notifications ─────────────────────────────────────────────
INSERT INTO Notifications (Status, Time_Stamp, Message, User_ID) VALUES
    ('read',   '2024-11-01 10:31:00', 'Your order #1 has been placed successfully.',          2),
    ('read',   '2024-11-03 08:00:00', 'Your order #1 has been shipped.',                      2),
    ('read',   '2024-11-06 10:00:00', 'Your order #1 has been delivered.',                    2),
    ('read',   '2024-11-05 14:16:00', 'Your order #2 has been placed successfully.',          3),
    ('unread', '2024-11-20 11:21:00', 'Your order #5 has been placed successfully.',          2),
    ('unread', '2024-11-22 13:01:00', 'Your order #6 has been placed successfully.',          3),
    ('unread', '2024-11-22 13:05:00', 'Low stock alert: Watercolor Set has only 6 units.',   1);

-- ── AdminActions ──────────────────────────────────────────────
INSERT INTO AdminActions (Action_Type, Details, Time_Stamp, User_ID, Product_ID) VALUES
    ('ADD_PRODUCT',    'Added Scientific Calculator to inventory',      '2024-10-15 09:00:00', 1, 9),
    ('UPDATE_PRODUCT', 'Updated price of Introduction to Algorithms',   '2024-10-20 11:30:00', 1, 1),
    ('UPDATE_PRODUCT', 'Restocked Spiral Notebooks, added 20 units',    '2024-11-01 08:00:00', 6, 11),
    ('REMOVE_PRODUCT', 'Removed discontinued product from catalog',     '2024-11-10 10:00:00', 1, NULL),
    ('UPDATE_PRODUCT', 'Updated low stock threshold for Calculus book', '2024-11-15 14:00:00', 1, 5);
