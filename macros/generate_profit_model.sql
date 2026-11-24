{% macro generate_profit_model(table_name, eur_rate) %}

select
    sales_date,
    SUM(quantity_sold * unit_sell_price) AS total_revenue,
    SUM(quantity_sold * unit_purchase_cost) AS total_cost,
    SUM(quantity_sold * unit_sell_price)
        - SUM(quantity_sold * unit_purchase_cost) AS total_profit,
    ROUND(
        (SUM(quantity_sold * unit_sell_price)
         - SUM(quantity_sold * unit_purchase_cost)) * {{ eur_rate }},
        2
    ) AS total_profit_eur
from {{ source('training', table_name) }}
group by sales_date

{% endmacro %}