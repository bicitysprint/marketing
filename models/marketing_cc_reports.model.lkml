connection: "db"

# include all the views
include: "/views/vw_credit_card_bookings.view"

datagroup: marketing_cc_reports_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hours"
}

access_grant: citysprint_access {
  user_attribute: citysprint_explore
  allowed_values: ["yes"]
}

persist_with: marketing_cc_reports_default_datagroup

explore: vw_credit_card_bookings {
}
