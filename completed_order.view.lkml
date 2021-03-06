view: completed_order {
  sql_table_name: javascript.completed_order ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: affiliation {
    type: string
    sql: ${TABLE}.affiliation ;;
  }

  dimension: anonymous_id {
    type: string
    sql: ${TABLE}.anonymous_id ;;
  }

  dimension: context_ip {
    type: string
    sql: ${TABLE}.context_ip ;;
  }

#   dimension: context_library_name {
#     type: string
#     sql: ${TABLE}.context_library_name ;;
#   }
#
#   dimension: context_library_version {
#     type: string
#     sql: ${TABLE}.context_library_version ;;
#   }

  dimension: context_page_path {
    type: string
    sql: ${TABLE}.context_page_path ;;
  }

  dimension: context_page_referrer {
    type: string
    sql: ${TABLE}.context_page_referrer ;;
  }

  dimension: context_page_title {
    type: string
    sql: ${TABLE}.context_page_title ;;
  }

  dimension: context_page_url {
    type: string
    sql: ${TABLE}.context_page_url ;;
  }

  dimension: context_user_agent {
    type: string
    sql: ${TABLE}.context_user_agent ;;
  }

  dimension: currency {
    type: string
    sql: ${TABLE}.currency ;;
  }

  dimension: event {
    type: string
    sql: ${TABLE}.event ;;
  }

  dimension: event_text {
    type: string
    sql: ${TABLE}.event_text ;;
  }

#   dimension_group: loaded {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.loaded_at ;;
#   }

  measure: oldrevenue {
    type: sum_distinct
    sql: ${TABLE}.oldrevenue ;;
  }

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

#   dimension_group: original_timestamp {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.original_timestamp ;;
#   }

  dimension: products {
    type: string
    sql: ${TABLE}.products ;;
  }

#   dimension_group: received {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.received_at ;;
#   }

  measure: revenue {
    type: sum_distinct
    value_format: "$#,##0.00"
    sql: ${TABLE}.revenue ;;
  }

#   dimension_group: sent {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.sent_at ;;
#   }

  dimension: session_id {
    type: string
    sql: ${TABLE}.session_id ;;
  }

  measure: shipping {
    type: sum_distinct
    value_format: "$#,##0.00"
    sql: ${TABLE}.shipping ;;
  }

  measure: tax {
    type: sum_distinct
    value_format: "$#,##0.00"
    sql: ${TABLE}.tax ;;
  }

  dimension_group: timestamp {
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
    sql: ${TABLE}.timestamp ;;
  }

  measure: total {
    type: sum_distinct
    value_format: "$#,##0.00"
    sql: ${TABLE}.total ;;
  }

  dimension: user_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

#   dimension_group: uuid_ts {
#     type: time
#     timeframes: [
#       raw,
#       time,
#       date,
#       week,
#       month,
#       quarter,
#       year
#     ]
#     sql: ${TABLE}.uuid_ts ;;
#   }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: distinct_orders {
    type: count_distinct
    sql: ${order_id} ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.context_campaign_name,
      users.id,
      users.context_library_name,
      users.name
    ]
  }
}
