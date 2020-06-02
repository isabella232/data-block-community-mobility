#### Google Community Mobility Data ####

connection: "@{CONNECTION_NAME}"

include: "/views/*.view.lkml"
include: "/dashboards/*.dashboard.lookml"

include: "//@{CONFIG_PROJECT_NAME}/*.model.lkml"
include: "//@{CONFIG_PROJECT_NAME}/*.dashboard"
include: "//@{CONFIG_PROJECT_NAME}/*.view.lkml"

#map layers
include: "map_layers.lkml"

############ Explores ############

explore: mobility {
  extends: [mobility_config]
  extends: [mobility_core]
}

explore: mobility_core {
  from: mobility_data
  extension: required
  group_label: "Community Mobility Reports"
  description: "This Explore uses data from Google's COVID-19 Community Mobility Reports. Full information about these are available at: https://www.google.com/covid19/mobility/"
  sql_always_where: ${geo_level_output} = ${geo_level};;
  # always_filter: {
  #   filters: [geography_level: "country"]
  # }

  join: max_date_mobility {
    sql_on: ${mobility.country_region_code} = ${max_date_mobility.country_region_code}
            AND IFNULL(${mobility.sub_region_1}, '') = ${max_date_mobility.province_state}
            AND IFNULL(${mobility.sub_region_2}, '') = ${max_date_mobility.county};;
    relationship: many_to_one
  }
}

############ Caching Logic ############

persist_with: mobility_data

### PDT Timeframes

datagroup: mobility_data {
  max_cache_age: "12 hours"
  sql_trigger:
    SELECT min(max_date) as max_date
    FROM
    (
      SELECT max(cast(date as date)) as max_date FROM `bigquery-public-data.covid19_google_mobility.mobility_report`
    ) a
  ;;
}
