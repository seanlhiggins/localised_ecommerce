view: users {
  view_label: "users_view_label"
  sql_table_name: public.users ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension: age {
    label: "age_label"
    type: number
    sql: ${TABLE}.age ;;
  }

  dimension: city {
    label: "city"
    type: string
    sql: ${TABLE}.city ;;
  }

  dimension: country {
    label: "country"
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }

  dimension: date {
    label: "date_label"
    type: date
    sql: ${TABLE}.created_at ;;
    group_label: "date_group_label"
  }

  dimension: week {
    label: "week_label"
    type: date_week
    sql: ${TABLE}.created_at ;;
    group_label: "date_group_label"
  }

  dimension: month {
    label: "month_label"
    type: date_month
    sql: ${TABLE}.created_at ;;
    group_label: "date_group_label"
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    label: "first_name_label"
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    label: "gender_label"
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: latitude {
    type: number
    sql: ${TABLE}.latitude ;;
  }

  dimension: longitude {
    type: number
    sql: ${TABLE}.longitude ;;
  }

  dimension: state {
    type: string
    sql: ${TABLE}.state ;;
  }

  dimension: traffic_source {
    type: string
    sql: ${TABLE}.traffic_source ;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }

  measure: count {
    type: count
    drill_fields: [id, first_name, last_name, events.count, order_items.count]
  }
}
