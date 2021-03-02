- dashboard: courbes
  title: Courbes
  layout: newspaper
  preferred_viewer: dashboards-next
  elements:
  - title: Progression du CA
    name: Progression du CA
    model: bureauvallee_dev
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.prog_ca_select_mois_N2,
      dv_vente.prog_ca_select_mois_N1, dv_vente.prog_CA_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    y_axes: [{label: Prog ca n vs n-1, orientation: left, series: [{axisId: dv_vente.prog_CA_select_mois,
            id: dv_vente.prog_CA_select_mois, name: 2020-2019}, {axisId: dv_vente.prog_ca_select_mois_N1,
            id: dv_vente.prog_ca_select_mois_N1, name: 2019-2018}, {axisId: dv_vente.prog_ca_select_mois_N2,
            id: dv_vente.prog_ca_select_mois_N2, name: 2018-2017}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_labels:
      dv_vente.prog_CA_select_mois: 2019-2020
      dv_vente.prog_ca_select_mois_N1: 2018-2019
      dv_vente.prog_ca_select_mois_N2: 2017-2018
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 0
    col: 0
    width: 12
    height: 8
  - title: CA / Jour moyen
    name: CA / Jour moyen
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.ca_par_jour_select_mois_N2,
      dv_vente.ca_par_jour_select_mois_N1, dv_vente.ca_par_jour_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    y_axes: [{label: Prog ca n vs n-1, orientation: left, series: [{axisId: dv_vente.prog_CA_select_mois,
            id: dv_vente.prog_CA_select_mois, name: 2020-2019}, {axisId: dv_vente.prog_ca_select_mois_N1,
            id: dv_vente.prog_ca_select_mois_N1, name: 2019-2018}, {axisId: dv_vente.prog_ca_select_mois_N2,
            id: dv_vente.prog_ca_select_mois_N2, name: 2018-2017}], showLabels: true,
        showValues: true, unpinAxis: false, tickDensity: default, tickDensityCustom: 5,
        type: linear}]
    series_types: {}
    series_labels:
      dv_vente.prog_CA_select_mois: 2020-2019
      dv_vente.prog_ca_select_mois_N1: 2019-2018
      dv_vente.prog_ca_select_mois_N2: 2018-2017
      dv_vente.ca_par_jour_select_mois: 2019-2020
      dv_vente.ca_par_jour_select_mois_N1: 2018-2019
      dv_vente.ca_par_jour_select_mois_N2: 2017-2018
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 8
    col: 0
    width: 12
    height: 7
  - title: Progression CA / jr moyen
    name: Progression CA / jr moyen
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.prog_ca_jour_select_mois_N2,
      dv_vente.prog_ca_jour_select_mois_N1, dv_vente.prog_ca_jour_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_jour_select_mois_N2: 2017-2018
      dv_vente.prog_ca_jour_select_mois_N1: 2018-2019
      dv_vente.prog_ca_jour_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 8
    col: 12
    width: 12
    height: 7
  - title: Clients / jr moyen
    name: Clients / jr moyen
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.client_par_jour_select_mois_N2,
      dv_vente.client_par_jour_select_mois_N1, dv_vente.client_par_jour_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_jour_select_mois_N2: 2017-2018
      dv_vente.prog_ca_jour_select_mois_N1: 2018-2019
      dv_vente.prog_ca_jour_select_mois: 2019-2020
      dv_vente.client_par_jour_select_mois_N2: 2017-2018
      dv_vente.client_par_jour_select_mois_N1: 2018-2019
      dv_vente.client_par_jour_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 15
    col: 0
    width: 12
    height: 7
  - title: Progression Clients / jr moyen
    name: Progression Clients / jr moyen
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.prog_Clients_select_mois_N2,
      dv_vente.prog_Clients_select_mois_N1, dv_vente.prog_Clients_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_jour_select_mois_N2: 2017-2018
      dv_vente.prog_ca_jour_select_mois_N1: 2018-2019
      dv_vente.prog_ca_jour_select_mois: 2019-2020
      dv_vente.client_par_jour_select_mois_N2: 2017-2018
      dv_vente.client_par_jour_select_mois_N1: 2018-2019
      dv_vente.client_par_jour_select_mois: 2019-2020
      dv_vente.prog_Clients_select_mois_N2: 2017-2018
      dv_vente.prog_Clients_select_mois_N1: 2018-2019
      dv_vente.prog_Clients_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 15
    col: 12
    width: 12
    height: 7
  - title: Panier Moyen
    name: Panier Moyen
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.panier_moyen_select_mois_N2,
      dv_vente.panier_moyen_select_mois_N1, dv_vente.panier_moyen_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_jour_select_mois_N2: 2017-2018
      dv_vente.prog_ca_jour_select_mois_N1: 2018-2019
      dv_vente.prog_ca_jour_select_mois: 2019-2020
      dv_vente.client_par_jour_select_mois_N2: 2017-2018
      dv_vente.client_par_jour_select_mois_N1: 2018-2019
      dv_vente.client_par_jour_select_mois: 2019-2020
      dv_vente.prog_Clients_select_mois_N2: 2017-2018
      dv_vente.prog_Clients_select_mois_N1: 2018-2019
      dv_vente.prog_Clients_select_mois: 2019-2020
      dv_vente.panier_moyen_select_mois_N2: 2017-2018
      dv_vente.panier_moyen_select_mois_N1: 2018-2019
      dv_vente.panier_moyen_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 22
    col: 0
    width: 12
    height: 7
  - title: Progression du PM
    name: Progression du PM
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.prog_PM_select_mois_N2,
      dv_vente.prog_PM_select_mois_N1, dv_vente.prog_PM_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_jour_select_mois_N2: 2017-2018
      dv_vente.prog_ca_jour_select_mois_N1: 2018-2019
      dv_vente.prog_ca_jour_select_mois: 2019-2020
      dv_vente.client_par_jour_select_mois_N2: 2017-2018
      dv_vente.client_par_jour_select_mois_N1: 2018-2019
      dv_vente.client_par_jour_select_mois: 2019-2020
      dv_vente.prog_Clients_select_mois_N2: 2017-2018
      dv_vente.prog_Clients_select_mois_N1: 2018-2019
      dv_vente.prog_Clients_select_mois: 2019-2020
      dv_vente.panier_moyen_select_mois_N2: 2017-2018
      dv_vente.panier_moyen_select_mois_N1: 2018-2019
      dv_vente.panier_moyen_select_mois: 2019-2020
      dv_vente.prog_PM_select_mois_N2: 2017-2018
      dv_vente.prog_PM_select_mois_N1: 2018-2019
      dv_vente.prog_PM_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 22
    col: 12
    width: 12
    height: 7
  - title: Progression de la marge
    name: Progression de la marge
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.prog_marge_select_mois_N2,
      dv_vente.prog_marge_select_mois_N1, dv_vente.prog_marge_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_jour_select_mois_N2: 2017-2018
      dv_vente.prog_ca_jour_select_mois_N1: 2018-2019
      dv_vente.prog_ca_jour_select_mois: 2019-2020
      dv_vente.client_par_jour_select_mois_N2: 2017-2018
      dv_vente.client_par_jour_select_mois_N1: 2018-2019
      dv_vente.client_par_jour_select_mois: 2019-2020
      dv_vente.prog_Clients_select_mois_N2: 2017-2018
      dv_vente.prog_Clients_select_mois_N1: 2018-2019
      dv_vente.prog_Clients_select_mois: 2019-2020
      dv_vente.panier_moyen_select_mois_N2: 2017-2018
      dv_vente.panier_moyen_select_mois_N1: 2018-2019
      dv_vente.panier_moyen_select_mois: 2019-2020
      dv_vente.prog_PM_select_mois_N2: 2017-2018
      dv_vente.prog_PM_select_mois_N1: 2018-2019
      dv_vente.prog_PM_select_mois: 2019-2020
      dv_vente.prog_marge_select_mois_N2: 2017-2018
      dv_vente.prog_marge_select_mois_N1: 2018-2019
      dv_vente.prog_marge_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 36
    col: 0
    width: 12
    height: 7
  - title: Marge sur clients
    name: Marge sur clients
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.marge_par_client_select_mois_N2,
      dv_vente.marge_par_client_select_mois_N1, dv_vente.marge_par_client_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_jour_select_mois_N2: 2017-2018
      dv_vente.prog_ca_jour_select_mois_N1: 2018-2019
      dv_vente.prog_ca_jour_select_mois: 2019-2020
      dv_vente.client_par_jour_select_mois_N2: 2017-2018
      dv_vente.client_par_jour_select_mois_N1: 2018-2019
      dv_vente.client_par_jour_select_mois: 2019-2020
      dv_vente.prog_Clients_select_mois_N2: 2017-2018
      dv_vente.prog_Clients_select_mois_N1: 2018-2019
      dv_vente.prog_Clients_select_mois: 2019-2020
      dv_vente.panier_moyen_select_mois_N2: 2017-2018
      dv_vente.panier_moyen_select_mois_N1: 2018-2019
      dv_vente.panier_moyen_select_mois: 2019-2020
      dv_vente.prog_PM_select_mois_N2: 2017-2018
      dv_vente.prog_PM_select_mois_N1: 2018-2019
      dv_vente.prog_PM_select_mois: 2019-2020
      dv_vente.prog_marge_select_mois_N2: 2017-2018
      dv_vente.prog_marge_select_mois_N1: 2018-2019
      dv_vente.prog_marge_select_mois: 2019-2020
      dv_vente.marge_par_client_select_mois_N2: 2017-2018
      dv_vente.marge_par_client_select_mois_N1: 2018-2019
      dv_vente.marge_par_client_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 29
    col: 0
    width: 12
    height: 7
  - title: Progression marge / clients
    name: Progression marge / clients
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.prog_marge_client_select_mois_N2,
      dv_vente.prog_marge_client_select_mois_N1, dv_vente.prog_marge_client_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_jour_select_mois_N2: 2017-2018
      dv_vente.prog_ca_jour_select_mois_N1: 2018-2019
      dv_vente.prog_ca_jour_select_mois: 2019-2020
      dv_vente.client_par_jour_select_mois_N2: 2017-2018
      dv_vente.client_par_jour_select_mois_N1: 2018-2019
      dv_vente.client_par_jour_select_mois: 2019-2020
      dv_vente.prog_Clients_select_mois_N2: 2017-2018
      dv_vente.prog_Clients_select_mois_N1: 2018-2019
      dv_vente.prog_Clients_select_mois: 2019-2020
      dv_vente.panier_moyen_select_mois_N2: 2017-2018
      dv_vente.panier_moyen_select_mois_N1: 2018-2019
      dv_vente.panier_moyen_select_mois: 2019-2020
      dv_vente.prog_PM_select_mois_N2: 2017-2018
      dv_vente.prog_PM_select_mois_N1: 2018-2019
      dv_vente.prog_PM_select_mois: 2019-2020
      dv_vente.prog_marge_select_mois_N2: 2017-2018
      dv_vente.prog_marge_select_mois_N1: 2018-2019
      dv_vente.prog_marge_select_mois: 2019-2020
      dv_vente.prog_marge_client_select_mois_N2: 2017-2018
      dv_vente.prog_marge_client_select_mois_N1: 2018-2019
      dv_vente.prog_marge_client_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 29
    col: 12
    width: 12
    height: 7
  - title: CA / m²
    name: CA / m²
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.ca_par_m_carre_select_mois_N2,
      dv_vente.ca_par_m_carre_select_mois_N1, dv_vente.ca_par_m_carre_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_par_m_carre_select_mois_N2: 2017-2018
      dv_vente.prog_ca_par_m_carre_select_mois_N1: 2018-2019
      dv_vente.prog_ca_par_m_carre_select_mois: 2019-2020
      dv_vente.ca_par_m_carre_select_mois_N2: 2017-2018
      dv_vente.ca_par_m_carre_select_mois_N1: 2018-2019
      dv_vente.ca_par_m_carre_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 36
    col: 12
    width: 12
    height: 7
  - title: Progression du nb clients
    name: Progression du nb clients
    model: bureauvallee_poc
    explore: dv_vente
    type: looker_line
    fields: [dv_vente.dte_vente_fiscal_month_num, dv_vente.dte_vente_month_name, dv_vente.prog_nb_Clients_select_mois_N3,
      dv_vente.prog_nb_Clients_select_mois_N1, dv_vente.prog_nb_Clients_select_mois]
    filters: {}
    sorts: [dv_vente.dte_vente_fiscal_month_num]
    limit: 500
    x_axis_gridlines: false
    y_axis_gridlines: false
    show_view_names: false
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: false
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    limit_displayed_rows: false
    legend_position: center
    point_style: circle
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    color_application:
      collection_id: 5591d8d1-6b49-4f8e-bafa-b874d82f8eb7
      palette_id: 18d0c733-1d87-42a9-934f-4ba8ef81d736
      options:
        steps: 5
    series_types: {}
    series_labels:
      dv_vente.prog_ca_par_m_carre_select_mois_N2: 2017-2018
      dv_vente.prog_ca_par_m_carre_select_mois_N1: 2018-2019
      dv_vente.prog_ca_par_m_carre_select_mois: 2019-2020
      dv_vente.ca_par_m_carre_select_mois_N2: 2017-2018
      dv_vente.ca_par_m_carre_select_mois_N1: 2018-2019
      dv_vente.ca_par_m_carre_select_mois: 2019-2020
      dv_vente.taux_de_marge_select_mois_N2: 2017-2018
      dv_vente.taux_de_marge_select_mois_N1: 2018-2019
      dv_vente.taux_de_marge_select_mois: 2019-2020
      dv_vente.prog_nb_Clients_select_mois_N3: 2017-2018
      dv_vente.prog_nb_Clients_select_mois_N1: 2018-2019
      dv_vente.prog_nb_Clients_select_mois: 2019-2020
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_fields: [dv_vente.dte_vente_fiscal_month_num]
    listen:
      Période n: dv_vente.date_filter
      Période n-1: dv_vente.date_filter_1
      Période n-2: dv_vente.date_filter_2
      Période n-3: dv_vente.date_filter_3
    row: 0
    col: 12
    width: 12
    height: 8
  filters:
  - name: Magasin
    title: Magasin
    type: field_filter
    default_value: ''
    allow_multiple_values: true
    required: false
    ui_config:
      type: dropdown_menu
      display: overflow
      options: []
    model: bureauvallee_poc
    explore: dv_vente
    listens_to_filters: []
    field: dv_web.magasin
  - name: Période n
    title: Période n
    type: field_filter
    default_value: 2020/04/01 to 2021/03/31
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: overflow
      options: []
    model: bureauvallee_poc
    explore: dv_vente
    listens_to_filters: []
    field: dv_vente.date_filter
  - name: Période n-1
    title: Période n-1
    type: field_filter
    default_value: 2019/04/01 to 2020/03/31
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: overflow
      options: []
    model: bureauvallee_poc
    explore: dv_vente
    listens_to_filters: []
    field: dv_vente.date_filter_1
  - name: Période n-2
    title: Période n-2
    type: field_filter
    default_value: 2018/04/01 to 2019/03/31
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: overflow
      options: []
    model: bureauvallee_poc
    explore: dv_vente
    listens_to_filters: []
    field: dv_vente.date_filter_2
  - name: Période n-3
    title: Période n-3
    type: field_filter
    default_value: 2017/04/01 to 2018/03/31
    allow_multiple_values: true
    required: true
    ui_config:
      type: advanced
      display: overflow
      options: []
    model: bureauvallee_poc
    explore: dv_vente
    listens_to_filters: []
    field: dv_vente.date_filter_3
