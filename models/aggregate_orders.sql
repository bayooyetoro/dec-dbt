{{ config(materialized='table') }}

SELECT
    s.USER_ID,
    COUNT(*) AS totalNumberOfOrders,
    SUM(amount) AS totalAmountSpent
FROM {{ ref('payments') }} AS p
LEFT JOIN {{ ref('shipped_orders') }} AS s ON s.ID = p.orderid
WHERE s.USER_ID IS NOT NULL
GROUP BY s.USER_ID
