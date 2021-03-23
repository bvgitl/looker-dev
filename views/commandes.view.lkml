view: commandes {
  sql_table_name: `bv-prod.Matillion_Temp_Table.commandes`
    ;;

  dimension: canal_commande {
    type: string
    sql: ${TABLE}.Canal_commande ;;
  }

  dimension: created_at {
    type: string
    sql: ${TABLE}.created_at ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}.customer_id ;;
  }

  dimension: entity_id {
    type: string
    sql: ${TABLE}.entity_id ;;
  }

  dimension: shipping_method {
    type: string
    sql: ${TABLE}.Shipping_method ;;
  }

  dimension: shop_code {
    type: string
    sql: ${TABLE}.Shop_code ;;
  }

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: store_code {
    type: string
    sql: ${TABLE}.store_code ;;
  }

  dimension: tarif_ht_livraison {
    type: number
    sql: ${TABLE}.Tarif_HT_livraison ;;
  }

  dimension: tarif_ttc_livraison {
    type: number
    sql: ${TABLE}.Tarif_TTC_livraison ;;
  }

  dimension: total_ht {
    type: number
    sql: ${TABLE}.Total_HT ;;
  }

  dimension: total_ttc {
    type: number
    sql: ${TABLE}.Total_TTC ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
