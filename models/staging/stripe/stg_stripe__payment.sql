SELECT 
    orderid,
    amount
FROM {{ source('stripe', 'payment') }}