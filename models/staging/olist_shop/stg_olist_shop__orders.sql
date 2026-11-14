with source as (

    select * from {{ source('raw', 'olist_orders_dataset') }}

),

renamed as (

    select
        order_id,
        substr(order_id, 1, 10) as cstm_order_id,
        customer_id,
        substr(customer_id, 1, 10) as cstm_cst_id,
        order_status,
        order_purchase_timestamp,
        order_approved_at,
        order_delivered_carrier_date,
        order_delivered_customer_date,
        order_estimated_delivery_date

    from source

)

select * from renamed
