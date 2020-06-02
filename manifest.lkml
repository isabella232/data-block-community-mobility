project_name: "data-block-community-mobility"

################ Constants ################

constant: CONFIG_PROJECT_NAME {
  value: "data-block-community-mobility-config"
  export: override_required
}

constant: CONNECTION_NAME {
  value: "lookerdata"
  export: override_required
}

constant: MAPBOX_API_KEY {
  value: "pk.eyJ1IjoibG9va2VyLW1hcHMiLCJhIjoiY2sxODBsbnBiMWx1aDNndGpieGtxN2p3NiJ9.hmqB9XRdFX29m1U6sOffLw"
}

################ Dependencies ################

local_dependency: {
  project: "@{CONFIG_PROJECT_NAME}"
}
