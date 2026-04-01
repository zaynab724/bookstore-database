# Bookstore Management System — Database Design & Implementation

Relational database system designed and implemented for a local bookstore in Ifrane, Morocco. Built as part of CSC 3326 — Database Systems (Fall 2024) in collaboration with a real client.

---

## Project Overview

The system manages the full operational workflow of a bookstore — from product catalog and inventory to customer orders, notifications, and administrative actions. It was designed following a client requirements gathering process and implements a normalized relational schema with referential integrity.

**Client:** Librairie Ifrane, a local bookstore selling books and school supplies
**Team:** Rita Jalal, Zaynab Aboulkacem, Tanishka Suwalka
**Supervisor:** Dr. Lamiae Bouanane

---

## Project Structure

```
bookstore-db/
├── sql/
│   ├── schema.sql        ← CREATE TABLE statements with constraints
│   ├── seed_data.sql     ← Sample data for all tables
│   └── queries.sql       ← 10 analytical SQL queries
├── interface/
│   └── dashboard.html    ← Web-based management interface
└── README.md
```

---

## Database Schema

The database consists of 7 normalized tables:

| Table | Description |
|---|---|
| Users | Customers, staff, and admins with role-based access |
| Categories | Product categories for catalog organization |
| Products | Catalog items with stock and low-stock threshold tracking |
| Orders | Customer orders with status tracking |
| OrderDetails | Junction table linking orders to products (composite PK) |
| Notifications | Event-driven notifications sent to users |
| AdminActions | Audit log of all administrative operations |

### Key Design Decisions

- **Composite primary key** on `OrderDetails (Order_ID, Product_ID)` to represent the many-to-many relationship between orders and products
- **CHECK constraints** enforce valid values for `Order_Status`, `Role`, and `Account_Status`
- **Low_Stock_Threshold** per product enables automated alerts when inventory falls below acceptable levels
- **AdminActions** table provides a full audit trail of staff/admin operations

---

## How to Run

### Prerequisites
- PostgreSQL 13+

### Setup

1. Clone the repository
```bash
git clone https://github.com/zaynab724/bookstore-db.git
cd bookstore-db
```

2. Create the database
```bash
psql -U postgres -c "CREATE DATABASE bookstore;"
```

3. Run the schema
```bash
psql -U postgres -d bookstore -f sql/schema.sql
```

4. Load sample data
```bash
psql -U postgres -d bookstore -f sql/seed_data.sql
```

5. Run sample queries
```bash
psql -U postgres -d bookstore -f sql/queries.sql
```

### Web Interface

Open `interface/dashboard.html` directly in any browser — no server required.

---

## Sample Queries

The `queries.sql` file includes 10 analytical queries:

1. All products with their category
2. All orders with customer name and status
3. Order details — items per order
4. Products below low stock threshold
5. Total revenue per customer
6. Most ordered products
7. Orders summary by status
8. Unread notifications per user
9. Full order history for a specific customer
10. Revenue by category

---

## Web Interface

A browser-based management dashboard built with HTML, CSS, and JavaScript provides a visual interface over the database. It includes:

- Dashboard with key metrics and recent orders
- Product catalog with search and category filter
- Order management with status tracking
- Customer registry
- Database schema viewer
- Notifications panel

---

## Tech Stack

| Layer | Technology |
|---|---|
| Database | PostgreSQL |
| Schema Design | ER Modeling, Normalization |
| Query Language | SQL |
| Interface | HTML, CSS, JavaScript |

---

## Business Rules Implemented

- Each order is linked to a verified user account
- Stock quantity is reduced upon successful order placement
- Orders follow a strict status flow: Pending → Processed → Shipped → Delivered
- Low stock alerts are triggered when inventory falls below the per-product threshold
- All admin and staff operations are logged in the AdminActions audit table
- Products are categorized for easier catalog management and reporting
