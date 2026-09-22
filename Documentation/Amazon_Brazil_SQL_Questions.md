# Amazon Brazil E-Commerce SQL Analysis

## Project Overview

Amazon Brazil is scaling rapidly in Latin America's largest e-commerce
market. The operations and strategy team needs a clearer picture of how
the platform is performing --- which customers are driving revenue,
which sellers are delivering, which product categories are growing, and
where fulfillment is breaking down.

As a Data Analyst, you have been given access to Amazon Brazil's
internal order database. It contains transactional data across
customers, sellers, products, orders, payments, and reviews. Your job is
to write SQL queries that turn this raw data into decisions.

------------------------------------------------------------------------

## Questions & Business Context

### Q1. Total Orders Fulfilled by Each Seller State

**Question:**\
Find the total number of orders fulfilled by each seller state.

**Business Context:**\
Amazon Brazil's logistics team is planning its next round of regional
fulfillment center investments. Before committing budget, they need to
know which states are generating the most order volume on the seller
side --- so infrastructure goes where the actual demand is.

------------------------------------------------------------------------

### Q2. Cumulative Revenue by Product Category Over Time

**Question:**\
For each product category, calculate the cumulative revenue generated as
orders come in over time.

**Business Context:**\
The growth team wants to see how revenue builds up within each category
across the order timeline. This running total helps them spot which
categories hit their revenue targets early in the month versus which
ones pick up only toward the end --- useful for planning flash sales and
push notifications.

------------------------------------------------------------------------

### Q3. Payment Method Usage and Average Order Value

**Question:**\
Which payment method do customers use the most, and what is the average
order value for each payment type?

**Business Context:**\
The finance and partnerships team is renegotiating contracts with
payment providers. Before those talks, they need to know which payment
method --- credit card, boleto, voucher, or debit card --- dominates the
platform, and whether high-value orders cluster around a specific
payment type.

------------------------------------------------------------------------

### Q4. Highest-Spending Customer

**Question:**\
Find the customer who has spent the most money across all their orders.

**Business Context:**\
The CRM team is launching Amazon Brazil's first premium loyalty tier.
The first step is identifying the single highest-spending customer on
the platform --- both to personally onboard them into the program and to
understand what a top-tier customer profile looks like.

------------------------------------------------------------------------

### Q5. Average Review Score by Product Category

**Question:**\
Find the average review score for each product category.

**Business Context:**\
The customer experience team tracks satisfaction at the category level.
A low average review score in a category often signals a fulfillment
issue, a product quality problem, or a mismatch between listing
description and actual product. This query helps them prioritize which
categories need intervention first.

------------------------------------------------------------------------

### Q6. Orders by Customer and Customer State

**Question:**\
Find the total number of orders placed by each customer, broken down by
the state they live in.

**Business Context:**\
The regional marketing team is planning state-level campaigns in Brazil.
They want to know how order frequency varies by customer location --- so
they can target low-frequency states with acquisition offers and reward
high-frequency states with loyalty perks.

------------------------------------------------------------------------

### Q7. Sellers Who Have Never Fulfilled an Order

**Question:**\
Identify sellers who registered on the platform but have never fulfilled
a single order.

**Business Context:**\
The seller growth team runs quarterly re-engagement campaigns targeting
dormant sellers. To build that list, they need to find every seller
account that exists in the system but has zero fulfilled orders ---
these are the accounts that need a nudge or need to be reviewed for
removal.

------------------------------------------------------------------------

### Q8. Top 5 Product Categories by Total Revenue

**Question:**\
Find the top 5 product categories by total revenue.

**Business Context:**\
Before every major sales event --- Black Friday Brazil, Dia das Mães,
Cyber Monday --- the merchandising team decides which categories get
homepage real estate and promotional budget. Total revenue by category
is the primary input for that decision.

------------------------------------------------------------------------

### Q9. Median Delivery Time

**Question:**\
Find the median delivery time (in days) between order placement and
actual delivery.

**Business Context:**\
The logistics director wants to know the true middle ground of how long
customers wait for their orders. The median is preferred over the
average because a handful of extremely delayed orders (due to remote
delivery locations in Brazil's interior) would skew the average and make
performance look worse than it is for most customers.

------------------------------------------------------------------------

### Q10. Products That Have Never Been Ordered

**Question:**\
Find all products that have never been ordered.

**Business Context:**\
The catalogue operations team does a quarterly clean-up of dead
listings. Products that have never received a single order waste search
index space, confuse customers, and inflate category browse pages. This
query gives them the exact list to review, reprice, or remove.

------------------------------------------------------------------------

### Q11. Sellers Performing Above the Platform Average

**Question:**\
Find sellers who have fulfilled more orders than the average seller on
the platform.

**Business Context:**\
The seller success team is building an invite list for Amazon Brazil's
"Top Seller" badge program. Only sellers who perform above the platform
average qualify. This query identifies exactly who clears that bar ---
and gives the team a baseline for what above-average performance
actually means numerically.

------------------------------------------------------------------------

### Q12. States with the Highest Average Customer Review Score

**Question:**\
Find which Brazilian states have the highest average customer review
score for orders delivered there.

**Business Context:**\
The last-mile delivery experience varies significantly across Brazil ---
deliveries to São Paulo and Rio are generally faster and smoother than
to states in the North and Northeast. This query helps the CX team
correlate delivery destination with satisfaction, so they can push
logistics partners to improve in underperforming states.

------------------------------------------------------------------------

### Q13. Customers Who Never Left a Review

**Question:**\
Identify customers who have placed orders but never left a review.

**Business Context:**\
The post-purchase engagement team wants to grow the volume of reviews on
the platform --- more reviews mean better product discoverability and
buyer trust. The first step is identifying customers who buy regularly
but never review, so the team can target them with review reminder
emails and in-app nudges.

------------------------------------------------------------------------

### Q14. Month with the Highest Number of Orders

**Question:**\
Find the month with the highest number of orders placed across the
entire platform.

**Business Context:**\
The demand forecasting team needs to know Amazon Brazil's peak order
month historically. This drives decisions about how much warehouse
capacity to reserve, how many temporary delivery staff to hire, and when
to start marketing campaigns for the next peak season.

------------------------------------------------------------------------

## Skills / SQL Concepts Covered

This project is designed to practice practical SQL analysis using
concepts such as:

-   `SELECT`
-   `WHERE`
-   `GROUP BY`
-   `ORDER BY`
-   Aggregate functions such as `COUNT()`, `SUM()`, and `AVG()`
-   `JOIN`
-   `LEFT JOIN`
-   Subqueries
-   Common Table Expressions (CTEs)
-   Window functions
-   Running / cumulative totals
-   Ranking
-   Median calculation
-   Date and time functions
-   Conditional aggregation
-   `HAVING`
-   Identifying unmatched records
-   Customer, seller, product, payment, review, and order analysis

## Business Areas Covered

-   Seller performance
-   Customer behavior
-   Revenue analysis
-   Product category performance
-   Payment method analysis
-   Customer satisfaction
-   Logistics and delivery performance
-   Catalogue management
-   Regional analysis
-   Demand forecasting
