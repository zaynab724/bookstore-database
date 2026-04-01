-- ============================================================
-- Bookstore Database System
-- CSC 3326 - Database Systems
-- Authors: Rita Jalal, Zaynab Aboulkacem, Tanishka Suwalka
-- Fall 2024
-- ============================================================

-- Drop tables if they exist (in reverse dependency order)
DROP TABLE IF EXISTS AdminActions CASCADE;
DROP TABLE IF EXISTS Notifications CASCADE;
DROP TABLE IF EXISTS OrderDetails CASCADE;
DROP TABLE IF EXISTS Orders CASCADE;
DROP TABLE IF EXISTS Products CASCADE;
DROP TABLE IF EXISTS Categories CASCADE;
DROP TABLE IF EXISTS Users CASCADE;

-- ── Users ─────────────────────────────────────────────────────
CREATE TABLE Users (
    User_ID         SERIAL PRIMARY KEY,
    User_FName      VARCHAR(50)  NOT NULL,
    User_MName      VARCHAR(50),
    User_LName      VARCHAR(50)  NOT NULL,
    Email           VARCHAR(100) NOT NULL UNIQUE,
    Password        VARCHAR(255) NOT NULL,
    Address         VARCHAR(255),
    Role            VARCHAR(20)  NOT NULL DEFAULT 'customer'
                    CHECK (Role IN ('customer', 'admin', 'staff')),
    Date_Registered DATE         NOT NULL DEFAULT CURRENT_DATE,
    Account_Status  VARCHAR(20)  NOT NULL DEFAULT 'active'
                    CHECK (Account_Status IN ('active', 'inactive', 'suspended'))
);

-- ── Categories ────────────────────────────────────────────────
CREATE TABLE Categories (
    Category_ID     SERIAL PRIMARY KEY,
    Category_Name   VARCHAR(100) NOT NULL UNIQUE
);

-- ── Products ──────────────────────────────────────────────────
CREATE TABLE Products (
    Product_ID          SERIAL PRIMARY KEY,
    Name                VARCHAR(150) NOT NULL,
    Description         TEXT,
    Price               NUMERIC(10, 2) NOT NULL CHECK (Price >= 0),
    Stock_Quantity      INT            NOT NULL DEFAULT 0 CHECK (Stock_Quantity >= 0),
    Low_Stock_Threshold INT            NOT NULL DEFAULT 5,
    Category_ID         INT            NOT NULL,
    FOREIGN KEY (Category_ID) REFERENCES Categories(Category_ID)
);

-- ── Orders ────────────────────────────────────────────────────
CREATE TABLE Orders (
    Order_ID        SERIAL PRIMARY KEY,
    Order_Date      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Total_Amount    NUMERIC(10, 2) NOT NULL CHECK (Total_Amount >= 0),
    Order_Status    VARCHAR(20)  NOT NULL DEFAULT 'Pending'
                    CHECK (Order_Status IN ('Pending', 'Processed', 'Shipped', 'Delivered')),
    User_ID         INT          NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- ── OrderDetails ──────────────────────────────────────────────
CREATE TABLE OrderDetails (
    Order_ID    INT            NOT NULL,
    Product_ID  INT            NOT NULL,
    Quantity    INT            NOT NULL CHECK (Quantity > 0),
    Unit_Price  NUMERIC(10, 2) NOT NULL CHECK (Unit_Price >= 0),
    PRIMARY KEY (Order_ID, Product_ID),
    FOREIGN KEY (Order_ID)   REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- ── Notifications ─────────────────────────────────────────────
CREATE TABLE Notifications (
    Notification_ID SERIAL PRIMARY KEY,
    Status          VARCHAR(20)  NOT NULL DEFAULT 'unread'
                    CHECK (Status IN ('unread', 'read')),
    Time_Stamp      TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Message         TEXT         NOT NULL,
    User_ID         INT          NOT NULL,
    FOREIGN KEY (User_ID) REFERENCES Users(User_ID)
);

-- ── AdminActions ──────────────────────────────────────────────
CREATE TABLE AdminActions (
    Action_ID   SERIAL PRIMARY KEY,
    Action_Type VARCHAR(50)  NOT NULL,
    Details     TEXT,
    Time_Stamp  TIMESTAMP    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    User_ID     INT          NOT NULL,
    Product_ID  INT,
    FOREIGN KEY (User_ID)    REFERENCES Users(User_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);
