view: produit_commande {
  sql_table_name: `bv-prod.Matillion_Temp_Table.produit_commande`
    ;;

  dimension: order_id {
    type: string
    sql: ${TABLE}.order_id ;;
  }

  dimension: product_id {
    type: string
    sql: ${TABLE}.product_id ;;
  }

  dimension: quantite_commandee {
    type: number
    sql: ${TABLE}.Quantite_commandee ;;
  }

  dimension: tarif_produit_ht {
    type: number
    sql: ${TABLE}.Tarif_Produit_HT ;;
  }

  dimension: tarif_produit_ttc {
    type: number
    sql: ${TABLE}.Tarif_Produit_TTC ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
