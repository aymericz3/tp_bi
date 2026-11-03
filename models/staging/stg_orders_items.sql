{{ config(materialized='view') }}

/*
    select orderid, orderitemid, productid, quantity, unitprice, quantity * unitprice as TotalPrice, updated_at
    from bronze.orderitems;
*/

SELECT
    orderid,
    orderitemid,
    productid,
    quantity,
    unitprice,
    quantity * unitprice as TotalPrice,
    updated_at
    from {{ source('bronze', 'orderitems') }}
