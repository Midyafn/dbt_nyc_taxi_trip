{% snapshot students_snapshot %}

{{
    config(
      target_schema='snapshots',
      unique_key='id',

      strategy='check',
      check_cols=['name', 'birth_date'],
    )
}}

select * from {{ source('playground', 'students') }}

{% endsnapshot %}