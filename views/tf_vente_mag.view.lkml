view: tf_vente_mag {
  sql_table_name: `bv-prod.Matillion_Perm_Table.TF_VENTE_MAG`
    ;;

  dimension: compound_primary_key {
    primary_key: yes
    hidden: yes
    type: string
    sql: CONCAT(${cd_site_ext}, ' ',${dte_vte_date}, ' ',${typ_vente}) ;;
  }

  dimension: an_sem {
    hidden: yes
    type: string
    sql: ${TABLE}.An_Sem ;;
  }

  dimension: annee {
    hidden: yes
    type: string
    sql: ${TABLE}.Annee ;;
  }

  dimension: ca_ht {
    type: number
    sql: ${TABLE}.ca_ht ;;
  }

  dimension: ca_net {
    type: number
    sql: ${TABLE}.ca_net ;;
  }

  dimension: cd_magasin {
    type: string
    sql: ${TABLE}.CD_Magasin ;;
  }

  dimension: cd_pays {
    type: string
    sql: ${TABLE}.CD_Pays ;;
  }

  dimension: cd_site_ext {
    type: string
    sql: ${TABLE}.CD_Site_Ext ;;
  }

  dimension_group: dte_creat {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Dte_creat ;;
  }

  dimension_group: dte_vte {
    type: time
    timeframes: [
      raw,
      date,
      week,
      month,
      quarter,
      year
    ]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.Dte_Vte ;;
  }

  dimension: jour {
    hidden: yes
    type: string
    sql: ${TABLE}.Jour ;;
  }

  dimension: marge_brute {
    type: number
    sql: ${TABLE}.marge_brute ;;
  }

  dimension: mois {
    hidden: yes
    type: string
    sql: ${TABLE}.Mois ;;
  }

  dimension: nb_ticket {
    type: number
    sql: ${TABLE}.nb_ticket ;;
  }

  dimension: num_jour {
    hidden: yes
    type: string
    sql: ${TABLE}.Num_Jour ;;
  }

  dimension: qtite {
    type: number
    sql: ${TABLE}.Qtite ;;
  }

  dimension: qtite_uvc {
    hidden: yes
    type: number
    sql: ${TABLE}.Qtite_uvc ;;
  }

  dimension: typ_article {
    hidden: yes
    type: string
    sql: ${TABLE}.Typ_Article ;;
  }

  dimension: typ_vente {
    type: number
    sql: ${TABLE}.Typ_Vente ;;
  }

  dimension: val_achat_gbl {
    type: number
    sql: ${TABLE}.Val_Achat_Gbl ;;
  }

########################## Calcul global des KPIs ################################

  measure: sum_ca_ht {
    type: sum
    value_format_name: eur
    sql: ${ca_ht} ;;
  }

  measure: count_dte_vente {
    value_format_name: decimal_0
    type: count_distinct
    sql: ${TABLE}.dte_vente ;;
  }

  dimension: tot_tx_marge_brute {
    type: number
    value_format_name: percent_2
    sql:  1.0 * ${marge_brute}/NULLIF(${ca_ht},0) ;;
  }

  measure: sum_marge_brute {
    value_format_name: eur
    type: sum
    sql: ${marge_brute} ;;
  }

  measure: sum_nb_ticket {
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
  }

  measure: sum_qtite {
    value_format_name: decimal_0
    type: sum
    sql: ${qtite};;
  }

  measure: sum_val_achat_gbl {
    value_format_name: eur
    type: sum
    sql: ${val_achat_gbl} ;;
  }
}
