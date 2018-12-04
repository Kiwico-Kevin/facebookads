view: last_adset {
    derived_table: {
      sql:
      SELECT
        id,
        last_value(name) OVER (PARTITION BY id ORDER BY start_time ASC)
          AS name
      FROM
        ad_sets ;;
#       sql_trigger_value: SELECT CURRENT_DATE() ;;
    }


    dimension: id {
      type: string
      sql: ${TABLE}.id ;;
      primary_key: yes
    }
    dimension: name {
      type: string
      sql: ${TABLE}.name ;;
    }
  }
