SELECT 
    orderid,
    SUM(amount) AS totalAmount
FROM {{ ref('stg_stripe__payment') }}
GROUP BY orderid
HAVING SUM(amount) < 0 