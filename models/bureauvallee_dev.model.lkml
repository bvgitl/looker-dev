connection: "bigquery_prod"

# include all the views
include: "/views/**/*.view"
#fiscal_month_offset: 3

datagroup: bureauvallee_dev_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: bureauvallee_dev_default_datagroup


explore: produit_commande {
  join: commandes {
    type: left_outer
    relationship: many_to_one
    sql_on: ${produit_commande.cd_commande}=${commandes.cd_commande} ;;
  }
}

explore: tf_vente {
  join: magasins {
    type: left_outer
    relationship: many_to_one
    sql_on: ${tf_vente.cd_site_ext}=${magasins.cd_comptable} ;;
  }
}

explore: pdt_vente {
  join: magasins {
    type: left_outer
    relationship: many_to_one
    sql_on: ${pdt_vente.cd_site_ext}=${magasins.cd_comptable} ;;
  }
}

explore: tf_vente_mag {}

explore: ventes_devise {}

explore: commandes {}

explore: magasins {}
