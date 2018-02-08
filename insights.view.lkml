view: insights {
  sql_table_name: facebookads.insights ;;

  dimension: id {
    primary_key: yes
    type: string
    sql: ${TABLE}.id ;;
  }

  dimension: ad_id {
    type: string
    # hidden: yes
    sql: ${TABLE}.ad_id ;;
  }

  measure: call_to_action_clicks {
    type:sum_distinct
    sql: ${TABLE}.call_to_action_clicks ;;
  }

  measure: clicks {
    type: sum_distinct
    sql: ${TABLE}.clicks ;;
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
    sql: ${TABLE}.date_start ;;
  }

#   dimension_group: date_stop {
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
#     sql: ${TABLE}.date_stop ;;
#   }

  dimension: deeplink_clicks {
    type: number
    sql: ${TABLE}.deeplink_clicks ;;
  }

  dimension: frequency {
    type: number
    sql: ${TABLE}.frequency ;;
  }

  measure: impressions {
    type: sum_distinct
    sql: ${TABLE}.impressions ;;
  }

  dimension: inline_post_engagements {
    type: number
    sql: ${TABLE}.inline_post_engagements ;;
  }

  measure: link_clicks {
    type: sum_distinct
    sql: ${TABLE}.link_clicks ;;
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

  measure: newsfeed_clicks {
    type: sum_distinct
    sql: ${TABLE}.newsfeed_clicks ;;
  }

  measure: newsfeed_impressions {
    type: sum_distinct
    sql: ${TABLE}.newsfeed_impressions ;;
  }

  measure: reach {
    type: sum_distinct
    sql: ${TABLE}.reach ;;
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

  measure: social_clicks {
    type: sum_distinct
    sql: ${TABLE}.social_clicks ;;
  }

  measure: social_impressions {
    type: sum_distinct
    sql: ${TABLE}.social_impressions ;;
  }

  measure: social_spend {
    type: sum_distinct
    sql: ${TABLE}.social_spend ;;
  }

  dimension: spend {
    type: number
    sql: ${TABLE}.spend ;;
  }

  measure: total_spend {
    type: sum_distinct
    value_format: "$#,##0.00"
    sql: ${TABLE}.spend ;;
  }

  measure: unique_clicks {
    type: sum_distinct
    sql: ${TABLE}.unique_clicks ;;
  }

  measure: unique_impressions {
    type: sum_distinct
    sql: ${TABLE}.unique_impressions ;;
  }

  measure: unique_social_clicks {
    type: sum_distinct
    sql: ${TABLE}.unique_social_clicks ;;
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

  measure: website_clicks {
    type: sum_distinct
    sql: ${TABLE}.website_clicks ;;
  }

  measure: count {
    type: count
    drill_fields: [id, ads.name, ads.id]
  }
}