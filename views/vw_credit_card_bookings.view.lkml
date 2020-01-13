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
      date,
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
  }

  dimension: service {
    type: string
    sql: ${TABLE}."SERVICE" ;;
  }

  dimension: service_centre {
    type: string
    sql: ${TABLE}."SERVICE_CENTRE" ;;
  }

  dimension: to_suburb_code {
    type: string
    sql: ${TABLE}."TO_SUBURB_CODE" ;;
  }

  dimension: umbrella_group {
    type: string
    sql: ${TABLE}."UMBRELLA_GROUP" ;;
  }

  dimension: umbrella_service {
    type: string
    sql: ${TABLE}."UMBRELLA_SERVICE" ;;
  }

  dimension: week {
    type: number
    sql: ${TABLE}."WEEK" ;;
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
    drill_fields: []
  }

  measure: sum_of_revenue {
    label: "Sum of Revenue"
    type: sum
    sql: ${TABLE}."REVENUE" ;;
    value_format_name: gbp
  }

  measure: sum_of_GM {
    label: "Sum of GM"
    type: sum
    sql: ${TABLE}."GM£" ;;
    value_format_name: gbp

  }


}
