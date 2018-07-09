view: last_insight {
    derived_table: {
      sql:
      SELECT
        id,
        last_value(ad_id) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS ad_id,
        last_value(call_to_action_clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS call_to_action_clicks,
        last_value(clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS clicks,
        last_value(date_start) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS date_start,
        last_value(deeplink_clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS deeplink_clicks,
        last_value(frequency) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS frequency,
        last_value(inline_post_engagements) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS inline_post_engagements,
        last_value(link_clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS link_clicks,
        last_value(newsfeed_clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS newsfeed_clicks,
        last_value(reach) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS reach,
        last_value(social_clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS social_clicks,
        last_value(social_impressions) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS social_impressions,
        last_value(social_spend) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS social_spend,
        last_value(spend) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS spend,
        last_value(unique_clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS unique_clicks,
        last_value(unique_impressions) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS unique_impressions,
        last_value(unique_social_clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS unique_social_clicks,
        last_value(website_clicks) OVER (PARTITION BY id ORDER BY date_start ASC)
          AS website_clicks
      FROM
        insights ;;
      sql_trigger_value: SELECT CURRENT_DATE() ;;
    }


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

measure: cost_per_acq_multi_device_channel {
  type: number
  value_format: "$#,##0.00"
  sql: ${total_spend}/NULLIF(${completed_order.distinct_orders},0) ;;
}


measure: count {
  type: count
  drill_fields: [id, ads.name, ads.id]
}
}
