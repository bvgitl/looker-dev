view: pdt_vente {
    derived_table: {
      sql: select
        CD_Site_Ext ,
        Dte_Vte ,
        CD_Article ,
        Typ_Vente ,
        Val_Achat_Gbl ,
        Qtite ,
        ca_ht ,
        marge_brute ,
        nb_ticket,
        row_number() OVER(ORDER BY CD_Site_Ext, Dte_Vte, CD_Article, Typ_Vente) AS primary_key
  from `bv-prod.Matillion_Perm_Table.TF_VENTE`

  UNION ALL

  select
        *,
        row_number() OVER(ORDER BY CD_SITE_EXT, DTE_VENTE, ID_ARTICLE, TYP_VENTE) AS primary_key
  from `bv-prod.Matillion_Perm_Table.GOOGLE_SHEET`
 ;;
     # datagroup_trigger: bv_vente_datagroup
    }

  dimension: primary_key {
    type: number
    primary_key: yes
    hidden: yes
    sql: ${TABLE}.primary_key ;;
  }

    dimension: cd_site_ext {
      type: string
    }

    dimension_group: dte_vte {
      type: time
      timeframes: [date, week, month, quarter, year, raw, month_name, fiscal_month_num, fiscal_quarter, fiscal_quarter_of_year, fiscal_year]
      datatype: date
      sql: ${TABLE}.Dte_Vte ;;
    }

    dimension: cd_article {
      type: string
      sql: ${TABLE}.CD_Article ;;
    }

    dimension: typ_vente {
      type: number
      sql: ${TABLE}.Typ_Vente ;;
    }

    dimension: val_achat_gbl {
      type: number
      sql: ${TABLE}.Val_Achat_Gbl ;;
    }

    dimension: qtite {
      type: number
      sql: ${TABLE}.Qtite ;;
    }

    dimension: ca_ht {
      type: number
      sql: ${TABLE}.ca_ht ;;
    }

    dimension: marge_brute {
      type: number
      sql: ${TABLE}.marge_brute ;;
    }

    dimension: nb_ticket {
      type: number
      sql: ${TABLE}.nb_ticket ;;
    }

    set: detail {
      fields: [
        cd_site_ext,
        cd_article,
        typ_vente,
        val_achat_gbl,
        qtite,
        ca_ht,
        marge_brute,
        nb_ticket
      ]
    }

  filter: date_filter {                 ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n"
    type: date
  }

  filter: date_filter_1 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-1"
    type: date
  }

  filter: date_filter_2 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-2"
    type: date
  }

  filter: date_filter_3 {               ### Choisir la période qu'on souhaite obtenir les résultats###
    label: "Période n-3"
    type: date
  }

  dimension_group: diff_date {
    type: duration
    intervals: [year]
    sql_start: ${magasins.date_ouv_date::datetime} ;;
    sql_end: {% date_end date_filter %} ;;
  }

  dimension: categorie {
    label: "Catégorie"
    sql:
        CASE
          WHEN ${magasins.ferme} = "S" THEN "P. non comparable"
          ELSE (
            CASE
              WHEN ${magasins.date_ouv_raw} < CAST ({% date_start date_filter_3 %} AS DATETIME) THEN "P.Comparable"
              ELSE "P. non Comparable"
            END )
        END
     ;;
  }

  dimension: anciennete {
    label: "Ancienneté"
    sql:
        CASE
          WHEN  ${years_diff_date} <= 2 THEN "A≤2 ans"
          WHEN  ${years_diff_date}  <= 5 AND ${years_diff_date} > 2 THEN "2 ans<A≤ 5 ans"
          WHEN  ${years_diff_date}  <= 10 AND ${years_diff_date}  > 5 THEN "5 ans<A≤10 ans"
          WHEN  ${years_diff_date}  > 10 THEN "A>10 ans"
        END
      ;;
  }



  # dimension: select_region {
  #   sql: CASE
  #         WHEN ${cd_pays} = "FR" THEN "France"
  #         ELSE "International"
  #       END ;;
  # }


########################## Calcul global des KPIs ################################

  measure: sum_ca_ht {
    type: sum
    value_format_name: eur
    sql: ${ca_ht} ;;
  }

  measure: count_dte_vente {
    hidden: yes
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
    hidden: yes
    value_format_name: eur
    type: sum
    sql: ${marge_brute} ;;
  }

  measure: sum_nb_ticket {
    hidden: yes
    value_format_name: decimal_0
    type: sum
    sql: ${nb_ticket} ;;
  }

  measure: sum_qtite {
    hidden: yes
    value_format_name: decimal_0
    type: sum
    sql: ${qtite};;
  }

  measure: sum_val_achat_gbl {
    hidden: yes
    value_format_name: eur
    type: sum
    sql: ${val_achat_gbl} ;;
  }


  ############## calcul des KPIs à la période sélectionnée au niveau du filtre  ############

  measure: sum_CA_select_mois {
    type: sum
    value_format_name: eur
    label: "CA HT"
    sql: CASE
            WHEN {% condition date_filter %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${ca_ht}
          END ;;
  }

  measure: sum_marge_select_mois {
    label: "Marge"
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${marge_brute}
          END ;;
  }

  measure: sum_nb_ticket_select_mois {
    label: "Nb clts"
    type: sum
    value_format_name: decimal_0
    sql: CASE
            WHEN {% condition date_filter %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${nb_ticket}
          END ;;
  }

  measure: sum_nb_jour_select_mois {
    label: "Nb jr"
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
            WHEN {% condition date_filter %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${TABLE}.DTE_VENTE
          END ;;
  }

  measure: sum_val_achat_gbl_select_mois {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${val_achat_gbl}
          END ;;
  }

  measure: sum_surf_select_mois {
    type: average
    sql: ${magasins.surf_vte};;
  }

  measure: ecarts_jour_select_mois {
    label: "écart jr"
    type: number
    sql:  ${sum_nb_jour_select_mois}-${sum_nb_jour_select_mois_N1} ;;
  }


  ############ calcul des KPIs à n-1 de la période sélectionnée au niveau du filtre ###############



  measure: sum_CA_select_mois_N1 {
    label: "CA HT n-1"
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_1 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${ca_ht}
          END ;;
  }

  measure: sum_marge_select_mois_N1 {
    label: "Marge n-1"
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_1 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${marge_brute}
          END ;;
  }

  measure: sum_nb_ticket_select_mois_N1 {
    label: "Nb clts n-1"
    type: sum
    value_format_name: decimal_0
    sql: CASE
            WHEN {% condition date_filter_1 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${nb_ticket}
          END ;;
  }

  measure: sum_nb_jour_select_mois_N1 {
    label: "Nb jr n-1"
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
            WHEN {% condition date_filter_1 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${TABLE}.DTE_VENTE
          END ;;
  }

  measure: sum_val_achat_gbl_select_mois_N1 {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_1 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${val_achat_gbl}
          END ;;
  }


  ############## calcul des KPIs à n-2 de la période sélectionnée au niveau du filtre ##############


  measure: sum_CA_select_mois_N2 {
    label: "CA HT n-2"
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_2 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${ca_ht}
          END ;;
  }

  measure: sum_marge_select_mois_N2 {
    label: "Marge n-2"
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_2 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${marge_brute}
          END ;;
  }

  measure: sum_nb_ticket_select_mois_N2 {
    label: "Nb clts n-2"
    type: sum
    value_format_name: decimal_0
    sql: CASE
           WHEN {% condition date_filter_2 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${nb_ticket}
          END ;;
  }

  measure: sum_nb_jour_select_mois_N2 {
    hidden: yes
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
            WHEN {% condition date_filter_2 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${TABLE}.DTE_VENTE
          END ;;
  }

  measure: sum_val_achat_gbl_select_mois_N2 {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_2 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${val_achat_gbl}
          END ;;
  }


  ############ calcul des KPIs à n-3 de la période sélectionnée au niveau du filtre ###############


  measure: sum_CA_select_mois_N3 {
    label: "CA HT n-3"
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_3 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${ca_ht}
          END ;;
  }

  measure: sum_marge_select_mois_N3 {
    label: "Marge n-3"
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_3 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${marge_brute}
          END ;;
  }

  measure: sum_nb_ticket_select_mois_N3 {
    label: "Nb clts n-3"
    type: sum
    value_format_name: decimal_0
    sql: CASE
            WHEN {% condition date_filter_3 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${nb_ticket}
          END ;;
  }

  measure: sum_nb_jour_select_mois_N3 {
    hidden: yes
    type: count_distinct
    value_format_name: decimal_0
    sql: CASE
            WHEN {% condition date_filter_3 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${TABLE}.DTE_VENTE
          END ;;
  }

  measure: sum_val_achat_gbl_select_mois_N3 {
    hidden: yes
    type: sum
    value_format_name: eur
    sql: CASE
            WHEN {% condition date_filter_3 %} CAST(${dte_vte_date} AS TIMESTAMP)  {% endcondition %}
            THEN ${val_achat_gbl}
          END ;;
  }


  ######### calcul des rapports entre les KPIs à la période n sélectionnée au niveau du filtre  ##########


  measure: client_par_jour_select_mois {
    label: "clts / jour"
    value_format_name: decimal_0
    type: number
    sql: ${sum_nb_ticket_select_mois}/NULLIF(${sum_nb_jour_select_mois},0) ;;
  }

  measure: ca_par_jour_select_mois {
    label: "CA / jour"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois}/NULLIF(${sum_nb_jour_select_mois},0) ;;
  }

  measure: ca_par_m_carre_select_mois {
    label: "CA / m²"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois}/NULLIF(${sum_surf_select_mois},0) ;;
  }

  measure: taux_de_marge_select_mois {
    label: "% marge"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ${sum_marge_select_mois}/NULLIF(${sum_CA_select_mois},0);;
  }

  measure: panier_moyen_select_mois {
    label: "PM"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_CA_select_mois}/NULLIF(${sum_nb_ticket_select_mois},0) ;;
  }

  measure: marge_par_client_select_mois {
    label: "marge / clts"
    value_format_name: decimal_2
    type: number
    sql: ${sum_marge_select_mois}/NULLIF(${sum_nb_ticket_select_mois},0) ;;
  }


  ######### calcul des rapports entre les KPIs à la période n-1 sélectionnée au niveau du filtre  ##########

  measure: client_par_jour_select_mois_N1 {
    label: "clts/jr n-1"
    value_format_name: decimal_0
    type: number
    sql: ${sum_nb_ticket_select_mois_N1}/NULLIF(${sum_nb_jour_select_mois_N1},0) ;;
  }

  measure: ca_par_jour_select_mois_N1 {
    label: "CA/jr n-1"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois_N1}/NULLIF(${sum_nb_jour_select_mois_N1},0) ;;
  }

  measure: ca_par_m_carre_select_mois_N1 {
    label: "CA/m² n-1"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois_N1}/NULLIF(${sum_surf_select_mois},0) ;;
  }

  measure: taux_de_marge_select_mois_N1 {
    label: "% marge n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ${sum_marge_select_mois_N1}/NULLIF(${sum_CA_select_mois_N1},0);;
  }

  measure: panier_moyen_select_mois_N1 {
    label: "PM n-1"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_CA_select_mois_N1}/NULLIF(${sum_nb_ticket_select_mois_N1},0) ;;
  }

  measure: marge_par_client_select_mois_N1 {
    label: "marge/clts n-1"
    value_format_name: decimal_2
    type: number
    sql: ${sum_marge_select_mois_N1}/NULLIF(${sum_nb_ticket_select_mois_N1},0) ;;
  }



  ######### calcul des rapports entre les KPIs à la période n-2 sélectionnée au niveau du filtre  ##########


  measure: client_par_jour_select_mois_N2 {
    label: "clts/jr n-2"
    value_format_name: decimal_0
    type: number
    sql: ${sum_nb_ticket_select_mois_N2}/NULLIF(${sum_nb_jour_select_mois_N2},0) ;;
  }

  measure: ca_par_jour_select_mois_N2 {
    label: "CA/jr n-2"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois_N2}/NULLIF(${sum_nb_jour_select_mois_N2},0) ;;
  }

  measure: ca_par_m_carre_select_mois_N2 {
    label: "CA/m² n-2"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois_N2}/NULLIF(${sum_surf_select_mois},0) ;;
  }

  measure: taux_de_marge_select_mois_N2 {
    label: "% marge n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ${sum_marge_select_mois_N2}/NULLIF(${sum_CA_select_mois_N2},0);;
  }

  measure: panier_moyen_select_mois_N2 {
    label: "PM n-2"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_CA_select_mois_N2}/NULLIF(${sum_nb_ticket_select_mois_N2},0) ;;
  }

  measure: marge_par_client_select_mois_N2 {
    label: "marge/clts n-2"
    value_format_name: decimal_2
    type: number
    sql: ${sum_marge_select_mois_N2}/NULLIF(${sum_nb_ticket_select_mois_N2},0) ;;
  }



  ######### calcul des rapports entre les KPIs à la période n-3 sélectionnée au niveau du filtre  ##########


  measure: client_par_jour_select_mois_N3 {
    label: "clts/jr n-3"
    value_format_name: decimal_0
    type: number
    sql: ${sum_nb_ticket_select_mois_N3}/NULLIF(${sum_nb_jour_select_mois_N3},0) ;;
  }

  measure: ca_par_jour_select_mois_N3 {
    label: "CA/jr n-3"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois_N3}/NULLIF(${sum_nb_jour_select_mois_N3},0) ;;
  }

  measure: ca_par_m_carre_select_mois_N3 {
    label: "CA/m² n-3"
    value_format_name: eur
    type: number
    sql:  ${sum_CA_select_mois_N3}/NULLIF(${sum_surf_select_mois},0) ;;
  }

  measure: taux_de_marge_select_mois_N3 {
    label: "% marge n-3"
    value_format_name: percent_2
    type: number
    sql: 1.0 * ${sum_marge_select_mois_N3}/NULLIF(${sum_CA_select_mois_N3},0);;
  }

  measure: panier_moyen_select_mois_N3 {
    label: "PM n-3"
    value_format_name: decimal_2
    type: number
    sql:  ${sum_CA_select_mois_N3}/NULLIF(${sum_nb_ticket_select_mois_N3},0) ;;
  }

  measure: marge_par_client_select_mois_N3 {
    label: "marge/clts n-3"
    value_format_name: decimal_2
    type: number
    sql: ${sum_marge_select_mois_N3}/NULLIF(${sum_nb_ticket_select_mois_N3},0) ;;
  }


  ########### Calcul des progressions n vs n-1 à la péridode sélectionée au niveau du filtre ###########


  measure: prog_CA_select_mois {
    label: "prog CA"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_CA_select_mois}-${sum_CA_select_mois_N1})/NULLIF(${sum_CA_select_mois_N1},0);;
  }

  measure: prog_marge_select_mois {
    label: "prog marge"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${sum_marge_select_mois}-${sum_marge_select_mois_N1})/NULLIF(${sum_marge_select_mois_N1},0);;
  }

  measure: prog_taux_marge_select_mois {
    label: "prog %marge"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${taux_de_marge_select_mois}-${taux_de_marge_select_mois_N1})/NULLIF(${taux_de_marge_select_mois_N1},0);;
  }

  measure: prog_ca_par_m_carre_select_mois {
    label: "prog CA/m²"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${ca_par_m_carre_select_mois}-${ca_par_m_carre_select_mois_N1})/NULLIF(${ca_par_m_carre_select_mois_N1},0);;
  }

  measure: prog_Clients_select_mois {
    label: "prog clts/jr"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${client_par_jour_select_mois}-${client_par_jour_select_mois_N1})/NULLIF(${client_par_jour_select_mois_N1},0) ;;
  }

  measure: prog_nb_Clients_select_mois {
    label: "prog nb clts"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_nb_ticket_select_mois}-${sum_nb_ticket_select_mois_N1})/NULLIF(${sum_nb_ticket_select_mois_N1},0) ;;
  }

  measure: prog_ca_jour_select_mois {
    label: "prog CA / jr"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${ca_par_jour_select_mois}-${ca_par_jour_select_mois_N1})/NULLIF(${ca_par_jour_select_mois_N1},0) ;;
  }

  measure: prog_PM_select_mois {
    label: "prog PM"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${panier_moyen_select_mois}-${panier_moyen_select_mois_N1})/(NULLIF(${panier_moyen_select_mois_N1},0));;
  }

  measure: prog_marge_client_select_mois {
    label: "prog marge/clt"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${marge_par_client_select_mois}-${marge_par_client_select_mois_N1})/NULLIF(${marge_par_client_select_mois_N1},0);;
  }



  ######### Calcul des progressions n-1 vs n-2 à la péridode sélectionée au niveau du filtre #########

  measure:prog_ca_select_mois_N1 {
    label: "prog CA n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_CA_select_mois_N1}-${sum_CA_select_mois_N2})/NULLIF(${sum_CA_select_mois_N2},0);;
  }

  measure: prog_marge_select_mois_N1 {
    label: "prog marge n-1"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${sum_marge_select_mois_N1}-${sum_marge_select_mois_N2})/NULLIF(${sum_marge_select_mois_N2},0);;
  }

  measure: prog_ca_par_m_carre_select_mois_N1 {
    label: "prog CA/m² n-1"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${ca_par_m_carre_select_mois_N1}-${ca_par_m_carre_select_mois_N2})/NULLIF(${ca_par_m_carre_select_mois_N2},0);;
  }

  measure: prog_nb_Clients_select_mois_N1 {
    label: "prog nb clts n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_nb_ticket_select_mois_N1}-${sum_nb_ticket_select_mois_N2})/NULLIF(${sum_nb_ticket_select_mois_N2},0) ;;
  }

  measure: prog_taux_marge_select_mois_N1 {
    label: "prog %marge n-1"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${taux_de_marge_select_mois_N1}-${taux_de_marge_select_mois_N2})/NULLIF(${taux_de_marge_select_mois_N2},0);;
  }

  measure: prog_Clients_select_mois_N1 {
    label: "prog clts/jr n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${client_par_jour_select_mois_N1}-${client_par_jour_select_mois_N2})/NULLIF(${client_par_jour_select_mois_N2},0) ;;
  }

  measure: prog_ca_jour_select_mois_N1 {
    label: "prog CA/jr n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${ca_par_jour_select_mois_N1}-${ca_par_jour_select_mois_N2})/NULLIF(${ca_par_jour_select_mois_N2},0) ;;
  }

  measure: prog_PM_select_mois_N1 {
    label: "prog PM n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${panier_moyen_select_mois_N1}-${panier_moyen_select_mois_N2})/(NULLIF(${panier_moyen_select_mois_N2},0));;
  }

  measure: prog_marge_client_select_mois_N1 {
    label: "prog marge/clt n-1"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${marge_par_client_select_mois_N1}-${marge_par_client_select_mois_N2})/NULLIF(${marge_par_client_select_mois_N2},0);;
  }


  ######### Calcul des progressions n-2 vs n-3 à la péridode sélectionée au niveau du filtre #########

  measure:prog_ca_select_mois_N2 {
    label: "prog CA n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_CA_select_mois_N2}-${sum_CA_select_mois_N3})/NULLIF(${sum_CA_select_mois_N3},0);;
  }

  measure: prog_marge_select_mois_N2 {
    label: "prog marge n-2"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${sum_marge_select_mois_N2}-${sum_marge_select_mois_N3})/NULLIF(${sum_marge_select_mois_N3},0);;
  }

  measure: prog_ca_par_m_carre_select_mois_N2 {
    label: "prog CA/m² n-2"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${ca_par_m_carre_select_mois_N2}-${ca_par_m_carre_select_mois_N3})/NULLIF(${ca_par_m_carre_select_mois_N3},0);;
  }

  measure: prog_taux_marge_select_mois_N2 {
    label: "prog %marge n-2"
    value_format_name: percent_2
    type: number
    sql:  1.0 * (${taux_de_marge_select_mois_N2}-${taux_de_marge_select_mois_N3})/NULLIF(${taux_de_marge_select_mois_N3},0);;
  }

  measure: prog_Clients_select_mois_N2 {
    label: "prog clts/jr n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${client_par_jour_select_mois_N2}-${client_par_jour_select_mois_N3})/NULLIF(${client_par_jour_select_mois_N3},0) ;;
  }

  measure: prog_nb_Clients_select_mois_N3 {
    label: "prog nb clts n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${sum_nb_ticket_select_mois_N2}-${sum_nb_ticket_select_mois_N3})/NULLIF(${sum_nb_ticket_select_mois_N3},0) ;;
  }

  measure: prog_ca_jour_select_mois_N2 {
    label: "prog CA/jr n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${ca_par_jour_select_mois_N2}-${ca_par_jour_select_mois_N3})/NULLIF(${ca_par_jour_select_mois_N3},0) ;;
  }

  measure: prog_PM_select_mois_N2 {
    label: "prog PM n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${panier_moyen_select_mois_N2}-${panier_moyen_select_mois_N3})/(NULLIF(${panier_moyen_select_mois_N3},0));;
  }

  measure: prog_marge_client_select_mois_N2 {
    label: "prog marge/clt n-2"
    value_format_name: percent_2
    type: number
    sql: 1.0 * (${marge_par_client_select_mois_N2}-${marge_par_client_select_mois_N3})/NULLIF(${marge_par_client_select_mois_N3},0);;
  }
}
