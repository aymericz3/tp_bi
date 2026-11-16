SELECT
    orderid,
    orderdate,
    customerid,
    employeeid,
    storeid,
    status,
    CASE status WHEN '01' THEN 'En cours' WHEN '02' THEN 'Terminée' WHEN '03' THEN 'Annulée' END AS StatusDescription,
    updated_at
    from {{ source('bronze', 'orders') }}
