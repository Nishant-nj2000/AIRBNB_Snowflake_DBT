{{
    config(
        materialized='incremental',
        unique_key='BOOKING_ID',
        incremental_strategy='merge'
    )
}}

SELECT
    BOOKING_ID,
    LISTING_ID,
    BOOKING_DATE,
    {{ multiply('BOOKING_AMOUNT', 'NIGHTS_BOOKED', 2) }} AS TOTAL_BOOKING_AMOUNT,
    SERVICE_FEE,
    CLEANING_FEE,
    BOOKING_STATUS,
    CREATED_AT
FROM {{ ref('bronze_bookings') }}
