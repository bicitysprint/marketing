view: vw_credit_card_bookings {
  sql_table_name: CC.VW_CREDIT_CARD_BOOKINGS ;;

  dimension: booking_type {
    type: string
    sql: ${TABLE}."Booking Type" ;;
  }

  dimension: bookings {
    type: number
    sql: ${TABLE}."BOOKINGS" ;;
  }

  dimension: cc_account_type {
    type: string
    sql: ${TABLE}."CC_ACCOUNT_TYPE" ;;
  }

  dimension_group: date {
    type: time
    timeframes: [
      raw,
      time,
      time_of_day,
      date,
      day_of_week,
      week,
      month,
      quarter,
      year
    ]
    sql: ${TABLE}."DATE" ;;
  }

  dimension: day {
    type: number
    sql: ${TABLE}."DAY" ;;
  }

  dimension: day_type {
    type: string
    sql: ${TABLE}."DAY_TYPE" ;;
  }

  dimension: followons {
    type: string
    sql: ${TABLE}."FOLLOWONS" ;;
  }

  dimension: from_suburb_code {
    label: "From Postcode"
    type: string
    sql: ${TABLE}."FROM_SUBURB_CODE" ;;
  }

  dimension: gm {
    label: "GM£"
    type: number
    sql: ${TABLE}."GM£" ;;
  }

  dimension: job_no {
    type: number
    sql: ${TABLE}."JOB_NO" ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: prebook_flag {
    type: string
    sql: ${TABLE}."Pre-Book Flag" ;;
  }

  dimension: revenue {
    type: number
    sql: ${TABLE}."REVENUE" ;;
    value_format_name: gbp
  }

  dimension: service {
    label: "Service - Vehicle Type"
    type: string
    sql: ${TABLE}."SERVICE" ;;
  }

  dimension: service_centre {
    type: string
    sql: ${TABLE}."SERVICE_CENTRE" ;;
  }

  dimension: to_suburb_code {
    label: "To Postcode"
    type: string
    sql: ${TABLE}."TO_SUBURB_CODE" ;;
  }

  dimension: umbrella_group {
    hidden: yes
    type: string
    sql: ${TABLE}."UMBRELLA_GROUP" ;;
  }

  dimension: umbrella_service {
    hidden:  yes
    type: string
    sql: ${TABLE}."UMBRELLA_SERVICE" ;;
  }

  dimension: week {
    type: number
    sql: case
    when ${TABLE}."WEEK" = '1' then '01'
    when ${TABLE}."WEEK" = '2' then '02'
    when ${TABLE}."WEEK" = '3' then '03'
    when ${TABLE}."WEEK" = '4' then '04'
    when ${TABLE}."WEEK" = '5' then '05'
    when ${TABLE}."WEEK" = '6' then '06'
    when ${TABLE}."WEEK" = '7' then '07'
    when ${TABLE}."WEEK" = '8' then '08'
    when ${TABLE}."WEEK" = '9' then '09'
    else ${TABLE}."WEEK"
    END ;;
    value_format_name: id
  }


  dimension: weekday {
    type: string
    sql: ${TABLE}."WEEKDAY" ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}."YEAR" ;;
  }

  measure: count {
    type: count
    drill_fields: [count_fields*]
##    link: {label: "Drill Sorted by count" url: "{{ count_id._link}}&sorts=vw_credit_card_bookings.year+month+week+day" }
  }

##  measure: count_of_bookings {
##    label: "Count of Bookings"
##    sql: ${TABLE}.BOOKINGS ;;
##    type: count_distinct
##  }

  measure: sum_of_revenue {
    label: "Sum of Revenue"
    type: sum
    sql: ${TABLE}."REVENUE" ;;
    value_format_name: gbp
    drill_fields: [revenue_fields*]
  }

  measure: sum_of_GM {
    label: "Sum of GM"
    type: sum
    sql: ${TABLE}."GM£" ;;
    value_format_name: gbp
  }

  measure: Percentage_of_GM {
    label: "% of GM"
    type: number
    sql: ${sum_of_GM} / ${sum_of_revenue} ;;
    value_format_name: percent_2
  }

  set: revenue_fields {
    fields: [
      year,
      month,
      week,
      day,
      service_centre,
      service,
      bookings,
      revenue
    ]
  }

 set: count_fields {
   fields: [
     year,
      month,
      week,
      day,
      service_centre,
      count
   ]
 }






}
