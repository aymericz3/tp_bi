{% snapshot customers_snapshot %}

    {{
        config(
          target_schema='silver',
          strategy='timestamp',
          unique_key='customerid',
          updated_at='updated_at',
        )
    }}

    select * from {{ source('bronze', 'customers') }}

{% endsnapshot %}