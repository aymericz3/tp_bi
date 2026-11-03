{{ config(materialized='view') }}

/*
    full sql command: SELECT customerid, upper(firstname) as firstname, lastname, concat(UPPER(firstname), ' ', lastname) as fullname, email, phone, address, city, state, zipcode, updated_at from bronze.customers;
*/

SELECT
    customerid,
    upper(firstname) as firstname,
    lastname, concat(UPPER(firstname), ' ', lastname) as fullname,
    email,
    phone,
    address,
    city,
    state,
    zipcode,
    updated_at
    from {{ source('bronze', 'customers') }}
