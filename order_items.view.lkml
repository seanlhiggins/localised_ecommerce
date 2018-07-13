view: order_items {
  view_label: "order_items_view_label"
  sql_table_name: public.order_items ;;

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }

  dimension_group: created {
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
    sql: ${TABLE}.created_at ;;
  }

  # dimension_group: delivered {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.delivered_at ;;
  # }
  dimension: delivered_date {
    label: "date_label"
    type: date
    sql: ${TABLE}.created_at ;;
    group_label: "delivered_date_group_label"
  }

  dimension: delivered_week {
    label: "week_label"
    type: date_week
    sql: ${TABLE}.created_at ;;
    group_label: "delivered_date_group_label"
  }

  dimension: delivered_month {
    label: "month_label"
    type: date_month
    sql: ${TABLE}.created_at ;;
    group_label: "delivered_date_group_label"
  }

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    sql: ${TABLE}.order_id ;;
  }

  # dimension_group: returned {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.returned_at ;;
  # }
  dimension: returned_date {
    label: "date_label"
    type: date
    sql: ${TABLE}.returned_at ;;
    group_label: "returned_date_group_label"
  }

  dimension: returned_week {
    label: "week_label"
    type: date_week
    sql: ${TABLE}.returned_at ;;
    group_label: "returned_date_group_label"
  }

  dimension: returned_month {
    label: "month_label"
    type: date_month
    sql: ${TABLE}.returned_at ;;
    group_label: "returned_date_group_label"
  }
  dimension: sale_price {
    type: number
    sql: ${TABLE}.sale_price ;;
  }

  # dimension_group: shipped {
  #   type: time
  #   timeframes: [
  #     raw,
  #     time,
  #     date,
  #     week,
  #     month,
  #     quarter,
  #     year
  #   ]
  #   sql: ${TABLE}.shipped_at ;;
  # }
  dimension: shipped_date {
    label: "date_label"
    type: date
    sql: ${TABLE}.shipped_at ;;
    group_label: "shipped_date_group_label"
  }

  dimension: shipped_week {
    label: "week_label"
    type: date_week
    sql: ${TABLE}.shipped_at ;;
    group_label: "shipped_date_group_label"
  }

  dimension: shipped_month {
    label: "month_label"
    type: date_month
    sql: ${TABLE}.shipped_at ;;
    group_label: "shipped_date_group_label"
  }
  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }

  measure: total_sale_price {
    label: "revenue_label"
    type: sum
    sql: ${sale_price} ;;
  }
  measure: total_gross_margin {
    label: "gross_margin_label"
    description: "gross_margin_description"
    type: number
    sql: ${total_sale_price} - ${inventory_items.total_cost} ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      users.id,
      users.first_name,
      users.last_name,
      inventory_items.id,
      inventory_items.product_name
    ]
  }
}
