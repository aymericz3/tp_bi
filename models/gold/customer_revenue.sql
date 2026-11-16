SELECT cuh.customerid, cuh.fullname, SUM(nb_orders) as nb_orders, SUM(total_amount) as revenue_generated, SUM(total_amount)/SUM(nb_orders) as amount_per_order
FROM {{ ref('fact_orders') }} foh
JOIN {{ ref('stg_customers') }} cuh ON foh.customerid = cuh.customerid
GROUP BY cuh.customerid, cuh.fullname