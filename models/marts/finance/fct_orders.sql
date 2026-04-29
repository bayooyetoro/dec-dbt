SELECT 
    o.order_id,
    o.customer_id,
    p.amount
FROM {{ ref('stg_jaffle_shop__orders') }} AS o
LEFT JOIN {{ ref('stg_stripe__payment') }} AS p ON o.order_id = p.orderid