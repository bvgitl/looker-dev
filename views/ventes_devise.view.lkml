view: ventes_devise {
  sql_table_name: `bv-prod.Matillion_Temp_Table.ventes_devise`
    ;;

  dimension: cd_devise {
    type: string
    sql: ${TABLE}.cd_devise ;;
  }

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.cd_magasin ;;
  }

  dimension: dte_vente {
    type: string
    sql: ${TABLE}.dte_vente ;;
  }

  dimension: marge {
    type: number
    sql: ${TABLE}.marge ;;
  }

  dimension: montant {
    type: number
    sql: ${TABLE}.montant ;;
  }

  dimension: nb_ticket {
    type: number
    sql: ${TABLE}.nb_ticket ;;
  }

  dimension: quantite {
    type: number
    sql: ${TABLE}.quantite ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
