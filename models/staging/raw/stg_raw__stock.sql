with 

source as (

    select * from {{ source('raw', 'stock') }}

),

renamed as (

    select
        model,
        model_name,
        color,
        color_name,
        size,
        forecast_stock,
        stock,
        price

    from source

)

select 
    concat(model, "_", color, "_", size) AS product_id,
    price
from renamed
