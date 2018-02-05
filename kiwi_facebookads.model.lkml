connection: "kiwi_facebookads"

# include all the views
include: "*.view"

# include all the dashboards
include: "*.dashboard"

datagroup: kiwi_facebookads_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: kiwi_facebookads_default_datagroup

explore: ad_accounts {}

explore: ad_accounts_view {}

explore: ad_sets {
  join: campaigns {
    type: left_outer
    sql_on: ${ad_sets.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
}

explore: ad_sets_view {
  join: campaigns {
    type: left_outer
    sql_on: ${ad_sets_view.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
}

explore: ads {
  join: campaigns {
    type: left_outer
    sql_on: ${ads.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
}

explore: ads_view {
  join: campaigns {
    type: left_outer
    sql_on: ${ads_view.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
}

explore: campaigns {}

explore: campaigns_view {}

explore: insights {
  join: ads {
    type: left_outer
    sql_on: ${insights.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer
    sql_on: ${ads.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
}

explore: insights_view {
  join: ads {
    type: left_outer
    sql_on: ${insights_view.ad_id} = ${ads.id} ;;
    relationship: many_to_one
  }

  join: campaigns {
    type: left_outer
    sql_on: ${ads.campaign_id} = ${campaigns.id} ;;
    relationship: many_to_one
  }
}
