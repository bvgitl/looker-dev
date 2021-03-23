connection: "bigquery_prod"

# include all the views
#include: "/views/**/*.view"
#fiscal_month_offset: 3

datagroup: bureauvallee_dev_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "24 hour"
}

persist_with: bureauvallee_dev_default_datagroup
