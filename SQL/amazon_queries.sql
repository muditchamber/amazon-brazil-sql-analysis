use amazon;

-- FIND THE TOTAL NUMBER OF ORDERS FULFILLED BY EACH SELLER STATE.

SELECT 
    s.seller_state, COUNT(DISTINCT oi.order_id) AS total_orders
FROM
    order_items oi
        JOIN
    sellers s ON oi.seller_id = s.seller_id
GROUP BY s.seller_state
ORDER BY total_orders DESC;  


-- FOR EACH PRODUCT CATEGORY, CALCULATE THE CUMULATIVE REVENUE GENERATED AS ORDERS COME IN OVER TIME. 

SELECT
    pct.product_category_name_english,
    o.order_purchase_timestamp,
    SUM(oi.price) AS revenue,
    SUM(SUM(oi.price)) OVER (
        PARTITION BY pct.product_category_name_english
        ORDER BY o.order_purchase_timestamp
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
    ) AS cumulative_revenue
FROM order_items oi

JOIN products p
    ON oi.product_id = p.product_id

JOIN product_category_name_translation pct
    ON p.product_category_name = pct.product_category_name

JOIN orders o
    ON oi.order_id = o.order_id

WHERE pct.product_category_name_english IS NOT NULL

GROUP BY
    pct.product_category_name_english,
    o.order_purchase_timestamp

ORDER BY
    pct.product_category_name_english,
    o.order_purchase_timestamp;
    
    
-- WHICH PAYMENT METHOD DO CUSTOMERS USE THE MOST AND WHAT IS THE AVERAGE ORDER VALUE FOR EACH PAYMENT TYPE.  

SELECT 
    payment_type,
    COUNT(DISTINCT order_id) AS total_orders,
    ROUND(SUM(payment_value) / COUNT(DISTINCT order_id),
            2) AS average_order_value
FROM
    order_payments
GROUP BY payment_type
ORDER BY total_orders DESC;      


-- FIND THE CUSTOMER WHO HAS SPENT THE MOST MONEY ACROSS ALL THEIR ORDERS.  

SELECT 
    o.customer_id, SUM(oi.price) AS total_spent
FROM
    orders o
        JOIN
    order_items oi ON o.order_id = oi.order_id
GROUP BY o.customer_id
ORDER BY total_spent DESC
LIMIT 1;


-- FIND THE AVERAGE REVIEW SCORE FOR EACH PRODUCT CATEGORY.

SELECT 
    t.product_category_name_english AS product_category,
    ROUND(AVG(r.review_score), 2) AS average_review_score
FROM
    products p
        JOIN
    order_items oi ON p.product_id = oi.product_id
        JOIN
    order_reviews r ON oi.order_id = r.order_id
        LEFT JOIN
    product_category_name_translation t ON p.product_category_name = t.product_category_name
WHERE
    t.product_category_name_english IS NOT NULL
GROUP BY t.product_category_name_english
ORDER BY average_review_score DESC;


-- FIND THE TOTAL NUMBER OF ORDERS PLACED BY EACH CUSTOMER BROKEN DOWN BY THE STATE THEY LIVE IN.

SELECT 
    c.customer_id,
    c.customer_state,
    COUNT(o.order_id) AS total_orders
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id , c.customer_state
ORDER BY c.customer_state , total_orders DESC;


-- IDENTIFY SELLERS WHO REGISTERED ON THE PLATFORM BUT HAVE NEVER FULFILLED A SINGLE ORDER.

SELECT 
    s.seller_id, s.seller_city, s.seller_state
FROM
    sellers s
        LEFT JOIN
    order_items oi ON s.seller_id = oi.seller_id
WHERE
    oi.seller_id IS NULL;      
    
    
-- FIND THE TOP 5 PRODUCT CATEGORY BY TOTAL REVENUE.   

SELECT 
    t.product_category_name_english AS product_category,
    SUM(oi.price) AS total_revenue
FROM
    order_items oi
        JOIN
    products p ON oi.product_id = p.product_id
        JOIN
    product_category_name_translation t ON p.product_category_name = t.product_category_name
GROUP BY t.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 5;


-- FIND THE MEDIAN DELIVERY TIME IN DATS BETWEEN ORDER PLACEMENT AND ACTUAL DELIVERY.

WITH delivery_time AS (
    SELECT
        order_id,
        DATEDIFF(
            order_delivered_customer_date,
            order_purchase_timestamp
        ) AS delivery_days
    FROM orders
    WHERE order_delivered_customer_date IS NOT NULL
),
ranked AS (
    SELECT
        delivery_days,
        ROW_NUMBER() OVER (ORDER BY delivery_days) AS rn,
        COUNT(*) OVER () AS total_rows
    FROM delivery_time
)
SELECT
    AVG(delivery_days) AS median_delivery_days
FROM ranked
WHERE rn IN (
    FLOOR((total_rows + 1) / 2),
    CEIL((total_rows + 1) / 2)
);


-- FIND ALL PRODUCT THAT HAVE NEVER BEEN ORDERED. 

SELECT 
    p.product_id, p.product_category_name
FROM
    products p
        LEFT JOIN
    order_items oi ON p.product_id = oi.product_id
WHERE
    oi.product_id IS NULL;
    
    
-- FIND THE SELLERS WHO HAVE FULFILLED MORE ORDERS THAN THE AVERAGE SELLER ON THE PLATFORM.

WITH seller_orders AS (
    SELECT
        s.seller_id,
        COUNT(DISTINCT oi.order_id) AS total_orders
    FROM sellers s
    JOIN order_items oi
        ON s.seller_id = oi.seller_id
    GROUP BY
        s.seller_id
),
average_orders AS (
    SELECT
        AVG(total_orders) AS avg_seller_orders
    FROM seller_orders
)
SELECT
    so.seller_id,
    so.total_orders,
    ao.avg_seller_orders
FROM seller_orders so
CROSS JOIN average_orders ao
WHERE so.total_orders > ao.avg_seller_orders
ORDER BY so.total_orders DESC;


-- FIND WHICH BRAZILIAN STATES HAVE THE HIGHEST AVERAGE CUSTOMER REVIEW SCORE FOR ORDERS DELIVERED THERE.  

WITH state_reviews AS (
    SELECT
        c.customer_state,
        AVG(r.review_score) AS avg_review_score
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    JOIN order_reviews r
        ON o.order_id = r.order_id
    WHERE o.order_delivered_customer_date IS NOT NULL
    GROUP BY c.customer_state
)
SELECT
    customer_state,
    ROUND(avg_review_score, 2) AS avg_review_score
FROM state_reviews
WHERE avg_review_score = (
    SELECT MAX(avg_review_score)
    FROM state_reviews
);


-- IDENTIFY CUSTOMERS WHO HAVE PLACED ORDER BUT NEVER LEFT A REVIEW.

SELECT DISTINCT
    c.customer_id
FROM
    customers c
        JOIN
    orders o ON c.customer_id = o.customer_id
        LEFT JOIN
    order_reviews r ON o.order_id = r.order_id
WHERE
    r.order_id IS NULL;

    
-- FIND THE MONTH WITH THE HIGHEST NUMBER OF ORDER PLACEMENTS ACROSS THE ENTIRE PLATFORM.

SELECT 
    MONTHNAME(order_purchase_timestamp) AS month,
    COUNT(order_id) AS total_orders
FROM
    orders
WHERE
    order_purchase_timestamp IS NOT NULL
GROUP BY month
ORDER BY total_orders DESC
LIMIT 1;