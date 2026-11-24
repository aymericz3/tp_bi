-- Expected minimum number of rows for each table
{% set expected_counts = {
    'customers': 50,
    'employees': 20,
    'stores': 10,
    'suppliers': 5,
    'products': 100,
    'orderitems': 1000,
    'orders': 200
} %}

-- Return the tables that have fewer rows than expected
{% for table, expected_count in expected_counts.items() %}
SELECT
    '{{ table }}' AS table_name,
    (SELECT COUNT(*) FROM {{ source('bronze', table) }}) AS record_count,
    {{ expected_count }} AS expected_count
FROM DUAL
WHERE (SELECT COUNT(*) FROM {{ source('bronze', table) }}) < {{ expected_count }}
{% if not loop.last %} UNION ALL {% endif %}
{% endfor %}