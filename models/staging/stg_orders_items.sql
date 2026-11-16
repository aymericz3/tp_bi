SELECT
    orderid,
    orderitemid,
    productid,
    quantity,
    unitprice,
    quantity * unitprice as TotalPrice,
    updated_at
    from {{ source('bronze', 'orderitems') }}
