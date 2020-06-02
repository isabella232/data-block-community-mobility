############ Map Layers #################

map_layer: regioni_italiani {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.61hkfosh/{z}/{x}/{y}.mvt?access_token=@{MAPBOX_API_KEY}"
  feature_key: "reg2011_g"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/1bfc4f62d29b722380cee236bdffcceebdcb06f3/regioni_italiani.json"
  min_zoom_level: 3
  max_zoom_level: 11
  property_key: "NOME_REG"
}

map_layer: province_italiane {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.4ocnvk26/{z}/{x}/{y}.mvt?access_token=@{MAPBOX_API_KEY}"
  feature_key: "province_ditalia_lowergeojson"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/1bfc4f62d29b722380cee236bdffcceebdcb06f3/province_italiane.json"
  min_zoom_level: 3
  max_zoom_level: 12
  property_key: "NOME_PRO"
}
map_layer: us_pumas {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.3ip3jv1a/{z}/{x}/{y}.mvt?access_token=@{MAPBOX_API_KEY}"
  feature_key: "ipums_puma_2010geojson"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/4a48ef77a012a9be8d9e1df7aa38e783f5f81e82/puma_extents.json"
  min_zoom_level: 3
  max_zoom_level: 13
  property_key: "GEOID"
}

# This is a map layer of the US by county (using FIPS, labeled as GEOID). However, it collapses the 5 NYC counties (Kings, Queens,
# New York, Richmond, Bronx) into a single entity called New York City, with a made-up FIPS code of 36125
map_layer: us_counties_fips_nyc {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.b80a88vi/{z}/{x}/{y}.mvt?access_token=@{MAPBOX_API_KEY}"
  feature_key: "us_counties_fips_nycgeojson"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/bb342dd473bd32bfeeaf71de71e2eb7eddcb8feb/us_counties_fips_nyc.json"
  min_zoom_level: 0
  max_zoom_level: 12
  property_key: "GEOID"
}

# This is a map layer of the US by PUMA (using FIPS, labeled as GEOID). However, it collapses the 5 NYC counties (Kings, Queens,
# New York, Richmond, Bronx) into a single entity called New York City, with a made-up FIPS code of 36125
map_layer: us_pumas_nyc_combined {
  format: "vector_tile_region"
  url: "https://a.tiles.mapbox.com/v4/looker-maps.3jjsnmvx/{z}/{x}/{y}.mvt?access_token=@{MAPBOX_API_KEY}"
  feature_key: "pumas_nyc_combinedgeojson"
  extents_json_url: "https://rawcdn.githack.com/dwmintz/looker_map_layers/c12005ce62ae986b9ba30928c64fa7e5fc1cf0fd/us_pumas_nyc_combined.json"
  min_zoom_level: 3
  max_zoom_level: 13
  property_key: "GEOID"
}
