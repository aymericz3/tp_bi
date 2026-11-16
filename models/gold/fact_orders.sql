{{ config(materialized='table', schema='gold') }}

SELECT o.customerid, o.employeeid, o.storeid, o.StatusDescription, COUNT(DISTINCT o.orderid) AS nb_orders, SUM(i.TotalPrice) AS total_amount
FROM {{ ref('stg_orders') }} o
JOIN {{ ref('stg_orders_items') }} i ON o.orderid = i.orderid
GROUP BY o.customerid, o.employeeid, o.storeid, o.StatusDescription
