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
        nb_ticket
  from `bv-prod.Matillion_Perm_Table.TF_VENTE`

  UNION ALL

  select *
  from `bv-prod.Matillion_Perm_Table.GOOGLE_SHEET`
 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: cd_site_ext {
      type: string
      sql: ${TABLE}.CD_Site_Ext ;;
    }

    dimension: dte_vte {
      type: date
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
        dte_vte,
        cd_article,
        typ_vente,
        val_achat_gbl,
        qtite,
        ca_ht,
        marge_brute,
        nb_ticket
      ]
    }
  }
