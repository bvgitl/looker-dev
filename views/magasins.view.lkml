view: magasins {
  sql_table_name: `bv-prod.Matillion_Perm_Table.Magasins`
    ;;

  dimension: cd_magasin {
    primary_key: yes
    type: string
    sql: ${TABLE}.CD_Magasin ;;
  }

  dimension: adresse {
    type: string
    sql: ${TABLE}.Adresse ;;
  }

  dimension: adresse_url {
    type: string
    sql: ${TABLE}.adresse_url ;;
  }

  dimension: animateur {
    type: string
    sql: ${TABLE}.Animateur ;;
  }

  dimension: assistance_informatiq {
    hidden: yes
    type: string
    sql: ${TABLE}.assistance_informatiq ;;
  }

  dimension: capital_social {
    hidden: yes
    type: string
    sql: ${TABLE}.Capital_social ;;
  }

  dimension: carte_american_express {
    hidden: yes
    type: string
    sql: ${TABLE}.carte_american_express ;;
  }

  dimension: carte_kdeos {
    hidden: yes
    type: string
    sql: ${TABLE}.carte_kdeos ;;
  }

  dimension: cd_comptable {
    type: string
    sql: ${TABLE}.CD_Comptable ;;
  }

  dimension: cd_logiciel {
    type: string
    sql: ${TABLE}.CD_Logiciel ;;
  }


  dimension: click_collect {
    type: string
    sql: ${TABLE}.click_collect ;;
  }

  dimension: code_postal {
    type: string
    sql: ${TABLE}.Code_postal ;;
  }

  dimension: complement_adr {
    type: string
    sql: ${TABLE}.Complement_Adr ;;
  }

  dimension: couverture_livre {
    hidden: yes
    type: string
    sql: ${TABLE}.couverture_livre ;;
  }

  dimension_group: date_ouv {
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
    sql: ${TABLE}.DATE_OUV ;;
  }

  dimension: delai_min_prep_cde {
    hidden: yes
    type: string
    sql: ${TABLE}.delai_min_prep_cde ;;
  }

  dimension: delais_livraison_jr_ouvr {
    hidden: yes
    type: string
    sql: ${TABLE}.delais_livraison_jr_ouvr ;;
  }

  dimension: directeur {
    hidden: yes
    type: string
    sql: ${TABLE}.Directeur ;;
  }

  dimension: email_clients {
    hidden: yes
    type: string
    sql: ${TABLE}.Email_clients ;;
  }

  dimension: email_confirm_engag {
    hidden: yes
    type: string
    sql: ${TABLE}.Email_confirm_engag ;;
  }

  dimension: email_franchise {
    hidden: yes
    type: string
    sql: ${TABLE}.Email_franchise ;;
  }

  dimension: email_recep_com {
    hidden: yes
    type: string
    sql: ${TABLE}.Email_recep_com ;;
  }

  dimension: email_reservation {
    hidden: yes
    type: string
    sql: ${TABLE}.Email_reservation ;;
  }

  dimension: fax {
    hidden: yes
    type: string
    sql: ${TABLE}.Fax ;;
  }

  dimension: ferme {
    type: string
    sql: ${TABLE}.Ferme ;;
  }

  dimension: format {
    hidden: yes
    type: string
    sql: ${TABLE}.Format ;;
  }

  dimension: franchise {
    type: string
    sql: ${TABLE}.Franchise ;;
  }

  dimension: horaires_dimanche {
    hidden: yes
    type: string
    sql: ${TABLE}.Horaires_dimanche ;;
  }

  dimension: horaires_jeudi {
    hidden: yes
    type: string
    sql: ${TABLE}.Horaires_jeudi ;;
  }

  dimension: horaires_lundi {
    hidden: yes
    type: string
    sql: ${TABLE}.Horaires_lundi ;;
  }

  dimension: horaires_mardi {
    hidden: yes
    type: string
    sql: ${TABLE}.Horaires_mardi ;;
  }

  dimension: horaires_mercredi {
    hidden: yes
    type: string
    sql: ${TABLE}.Horaires_mercredi ;;
  }

  dimension: horaires_samedi {
    hidden: yes
    type: string
    sql: ${TABLE}.Horaires_samedi ;;
  }

  dimension: horaires_vendredi {
    hidden: yes
    type: string
    sql: ${TABLE}.Horaires_vendredi ;;
  }

  dimension: impression_copieur {
    hidden: yes
    type: string
    sql: ${TABLE}.impression_copieur ;;
  }

  dimension: impression_grd_format {
    hidden: yes
    type: string
    sql: ${TABLE}.impression_grd_format ;;
  }

  dimension: latitude {
    hidden: yes
    type: string
    sql: ${TABLE}.Latitude ;;
  }

  dimension: lien_visite_virtuelle {
    hidden: yes
    type: string
    sql: ${TABLE}.lien_visite_virtuelle ;;
  }

  dimension: livraison_depart_mag {
    hidden: yes
    type: string
    sql: ${TABLE}.livraison_depart_mag ;;
  }

  dimension: location_materiel {
    hidden: yes
    type: string
    sql: ${TABLE}.location_materiel ;;
  }

  dimension: longitude {
    hidden: yes
    type: string
    sql: ${TABLE}.Longitude ;;
  }

  dimension: montage_meuble {
    hidden: yes
    type: string
    sql: ${TABLE}.montage_meuble ;;
  }

  dimension: mtant_min_cde_ttc {
    hidden: yes
    type: string
    sql: ${TABLE}.Mtant_min_cde_TTC ;;
  }

  dimension: nom {
    type: string
    sql: ${TABLE}.NOM ;;
  }

  dimension: nom_tbe {
    type: string
    sql: ${TABLE}.Nom_TBE ;;
  }

  dimension: num_cpte_ingenico {
    hidden: yes
    type: string
    sql: ${TABLE}.Num_cpte_ingenico ;;
  }

  dimension: num_rcs {
    hidden: yes
    type: string
    sql: ${TABLE}.Num_RCS ;;
  }

  dimension: num_tva {
    hidden: yes
    type: string
    sql: ${TABLE}.Num_TVA ;;
  }

  dimension: objets_perso {
    hidden: yes
    type: string
    sql: ${TABLE}.objets_perso ;;
  }

  dimension: paiement_plusieurs_fois {
    hidden: yes
    type: string
    sql: ${TABLE}.paiement_plusieurs_fois ;;
  }

  dimension: pays {
    type: string
    sql: ${TABLE}.Pays ;;
  }

  dimension: pays_tbe {
    type: string
    sql: ${TABLE}.Pays_TBE ;;
  }

  dimension: phone_magasin {
    hidden: yes
    type: string
    sql: ${TABLE}.Phone_Magasin ;;
  }

  dimension: photocopie_noir_blanc {
    hidden: yes
    type: string
    sql: ${TABLE}.photocopie_noir_blanc ;;
  }

  dimension: portable {
    hidden: yes
    type: string
    sql: ${TABLE}.Portable ;;
  }

  dimension: portable_2 {
    hidden: yes
    type: string
    sql: ${TABLE}.Portable_2 ;;
  }

  dimension: portable_3 {
    hidden: yes
    type: string
    sql: ${TABLE}.Portable_3 ;;
  }

  dimension: rachat_calculatrice {
    hidden: yes
    type: string
    sql: ${TABLE}.rachat_calculatrice ;;
  }

  dimension: rachat_cartouche {
    hidden: yes
    type: string
    sql: ${TABLE}.rachat_cartouche ;;
  }

  dimension: raison_sociale {
    hidden: yes
    type: string
    sql: ${TABLE}.Raison_sociale ;;
  }

  dimension: region {
    type: string
    sql: ${TABLE}.Region ;;
  }

  dimension: reliure_doc_plastification {
    hidden: yes
    type: string
    sql: ${TABLE}.reliure_doc_plastification ;;
  }

  dimension: reproduction_cles {
    hidden: yes
    type: string
    sql: ${TABLE}.reproduction_cles ;;
  }

  dimension: siret {
    hidden: yes
    type: string
    sql: ${TABLE}.Siret ;;
  }

  dimension: support_com_event {
    hidden: yes
    type: string
    sql: ${TABLE}.support_com_event ;;
  }

  dimension: supports_com_insti {
    hidden: yes
    type: string
    sql: ${TABLE}.supports_com_insti ;;
  }

  dimension: supports_plv {
    hidden: yes
    type: string
    sql: ${TABLE}.supports_PLV ;;
  }

  dimension: surf_vte {
    type: number
    sql: ${TABLE}.SURF_VTE ;;
  }

  dimension: tampons_plaques {
    hidden: yes
    type: string
    sql: ${TABLE}.tampons_plaques ;;
  }

  dimension: tarif_livraison_ttc {
    hidden: yes
    type: string
    sql: ${TABLE}.tarif_livraison_TTC ;;
  }

  dimension: tranche_age {
    type: string
    sql: ${TABLE}.Tranche_age ;;
  }

  dimension: typ_mag {
    type: string
    sql: ${TABLE}.TYP_MAG ;;
  }

  dimension: type_tbe {
    type: string
    sql: ${TABLE}.Type_TBE ;;
  }

  dimension: ville {
    type: string
    sql: ${TABLE}.Ville ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
