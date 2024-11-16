WITH source AS (
    SELECT *
    FROM {{ref("stg_raw__stock")}}
    JOIN {{ref("stg_raw__sales")}}
    USING(product_id)
), renamed AS (
    SELECT *
    FROM source
)

SELECT
    product_id,
    price,
    quantity,
    quantity * price AS revenue
FROM renamed