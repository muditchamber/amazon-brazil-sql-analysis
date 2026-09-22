# Amazon Brazil E-Commerce SQL Analysis

## 📌 Project Overview

This project analyzes an e-commerce dataset from Brazil using SQL to answer practical business questions across customers, sellers, products, orders, payments, reviews, revenue, and logistics.

The analysis focuses on transforming transactional data into business insights using SQL queries and analytical techniques.

## 🎯 Business Objectives

### The project addresses questions related to:

- Seller performance
- Customer behavior
- Revenue and product category performance
- Payment method usage
- Customer satisfaction
- Delivery and logistics performance
- Catalogue management
- Regional analysis
- Demand patterns


## 🗂️ Dataset

The project uses the Olist Brazilian E-Commerce Dataset, documented through a custom data dictionary.

The database contains 11 tables, covering areas such as customers, orders, order items, products, sellers, payments, reviews, and supporting data.


## 🗃️ Raw Dataset

The raw dataset is hosted on Google Drive because the files are too large for direct upload to this GitHub repository.

👉 **[Access / Download Raw Dataset](https://drive.google.com/file/d/1Lx56GUIczrI3VMszoIgjl2414eKxh5NR/view?usp=sharing)**

> The dataset is provided separately for users who want to reproduce or explore the SQL analysis.


## 🔎 Business Questions

### The project answers 14 business questions, including:

1. Total orders fulfilled by each seller state
2. Cumulative revenue by product category over time
3. Payment method usage and average order value
4. Highest-spending customer
5. Average review score by product category
6. Orders by customer and customer state
7. Sellers who have never fulfilled an order
8. Top 5 product categories by total revenue
9. Median delivery time
10. Products that have never been ordered
11. Sellers performing above the platform average
12. States with the highest average customer review score
13. Customers who never left a review
14. Month with the highest number of orders

## 🛠️ SQL Concepts Used

- SELECT
- WHERE
- GROUP BY
- ORDER BY
- COUNT()
- SUM()
- AVG()
- JOIN
- LEFT JOIN
- Subqueries
- Common Table Expressions (CTEs)
- Window Functions
- Running / Cumulative Totals
- Ranking
- Median Calculation
- Date & Time Functions
- Conditional Aggregation
- HAVING
- Identifying Unmatched Records

## 📁 Project Structure

```text
amazon-brazil-sql-analysis/
│
├── README.md
├── .gitignore
├── amazon_data_dictionary.txt
│
├── SQL/
│   └── amazon_queries.sql
│
├── Documentation/
│   └── Amazon_Brazil_SQL_Questions.md
│
└── Screenshots/
    ├── amazon_query1.png
    ├── amazon_query2.png
    ├── amazon_query3.png
    ├── amazon_query4.png
    ├── amazon_query5.png
    ├── amazon_query6.png
    ├── amazon_query7.png
    └── amazon_query8.png

```

## 📊 Analysis Areas

### Seller Performance

Analysis of seller order volume, seller states, inactive sellers, and sellers performing above the platform average.

### Customer Behavior

Analysis of customer order frequency, spending behavior, and customers who have not submitted reviews.

### Revenue Analysis

Analysis of cumulative revenue and the highest-revenue product categories.

### Payment Analysis

Comparison of payment methods based on order usage and average order value.

### Customer Satisfaction

Analysis of review scores across product categories and Brazilian states.

### Logistics

Analysis of median delivery time between order placement and customer delivery.

### Catalogue Management

Identification of products that have never been ordered.

### Regional & Demand Analysis

Analysis of seller/customer states and the month with the highest order volume.

## 📚 Documentation

| Resource | Description |
|---|---|
| [SQL Queries](SQL/amazon_queries.sql) | SQL queries used for the analysis |
| [Business Questions](Documentation/Amazon_Brazil_SQL_Questions.md) | Business questions and business context |
| [Data Dictionary](Documentation/amazon_data_dictionary.txt) | Database tables, columns, data types and descriptions |
| [Screenshots](Screenshots/) | Selected SQL query results |


## 📸 Project Screenshots

### SQL Query 1
![Amazon SQL Query 1](Screenshots/amazon_query1.png)

### SQL Query 2
![Amazon SQL Query 2](Screenshots/amazon_query2.png)

### SQL Query 3
![Amazon SQL Query 3](Screenshots/amazon_query3.png)

### SQL Query 4
![Amazon SQL Query 4](Screenshots/amazon_query4.png)

### SQL Query 5
![Amazon SQL Query 5](Screenshots/amazon_query5.png)

### SQL Query 6
![Amazon SQL Query 6](Screenshots/amazon_query6.png)

### SQL Query 7
![Amazon SQL Query 7](Screenshots/amazon_query7.png)

### SQL Query 8
![Amazon SQL Query 8](Screenshots/amazon_query8.png)


## 💡 Key Learning Outcomes

Through this project, I practiced using SQL to solve practical business problems involving relational data.

The project particularly focuses on combining multiple tables and applying analytical SQL techniques such as joins, CTEs, window functions, aggregation, ranking, and date-based analysis.


## 🧰 Tools

- MySQL
- SQL
- MySQL Workbench

## 👨‍💻 Author

Mudit Chamber
