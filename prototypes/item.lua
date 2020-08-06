data:extend({
  {
    type = "electric-pole",
    name = "node",
    icon = "__base__/graphics/icons/substation.png",
    icon_size = 32,
    flags = {"placeable-neutral", "player-creation"},
    minable = {mining_time = 0.1, result = "node"},
    max_health = 200,
    corpse = "substation-remnants",
    track_coverage_during_build_by_moving = true,
    collision_box = {{-0.7, -0.7}, {0.7, 0.7}},
    selection_box = {{-1, -1}, {1, 1}},
    drawing_box = {{-1, -3}, {1, 1}},
    maximum_wire_distance = 32,
    supply_area_distance = 32,
    draw_copper_wires = false,
    draw_circuit_wires = false,
    pictures =
    {
      layers =
      {

        {
          filename = "__Megastrucutres__/graphics/entity/node/node.png",
          priority = "high",
          width = 500,
          height = 500,
          direction_count = 1,
          shift = util.by_pixel(0, 1-64),
          hr_version =
          {
            filename = "__Megastructures__/graphics/entity/node/hr-node.png",
            priority = "high",
            width = 1000,
            height = 1000,
            direction_count = 1,
            shift = util.by_pixel(0, 1-64),
            scale = 0.5
          }
        }
      }
    },
    vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
    working_sound =
    {
      sound = { filename = "__base__/sound/substation.ogg" },
      apparent_volume = 1.5,
      audible_distance_modifier = 0.5,
      probability = 1 / (3 * 60) -- average pause between the sound is 3 seconds
    },
    connection_points =
    {
      {
        shadow =
        {
          copper = util.by_pixel(136, 8),
          green = util.by_pixel(124, 8),
          red = util.by_pixel(151, 9)
        },
        wire =
        {
          copper = util.by_pixel(0, -86),
          green = util.by_pixel(-21, -82),
          red = util.by_pixel(22, -81)
        }
      },
    },
    radius_visualisation_picture =
    {
      filename = "__base__/graphics/entity/small-electric-pole/electric-pole-radius-visualization.png",
      width = 12,
      height = 12,
      priority = "extra-high-no-scale"
    }
  },
{
  type = "item",
  name = "node",
  icon = "__Megastructures__/graphics/icons/node-icon.png",
  icon_size = 32,
  subgroup = "energy-pipe-distribution",
  order = "a[energy]-f[node]",
  place_result = "node",
  stack_size = 50
},
{
  type = "recipe",
  name = "node",
  enabled = false,
  ingredients =
  {
    {"uranium-235",20},
    {"uranium-238",20},
    {"substation",30},
    {"steel-plate",20},
    {"processing-unit",20}
  },
  result = "node"
},
{
  type = "technology",
  name = "wireless-energy-distribution",
  icon_size = 128,
  icon = "__base__/graphics/technology/electric-energy-distribution.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "node"
    }
  },
  prerequisites = {"electric-energy-distribution-2", "uranium-processing", "advanced-electronics"},
  unit =
  {
    count = 100,
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1}
    },
    time = 120
  },
  order = "c-e-c"
},
{
  type = "reactor",
  name = "mega-reactor",
  icon  = "__base__/graphics/icons/nuclear-reactor.png",
  icon_size = 32,
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.5, result = "mega-reactor"},
  max_health = 500,
  corpse = "nuclear-reactor-remnants",
  consumption = "500MW",
  neighbour_bonus = 1,
  energy_source =
  {
    type = "burner",
    fuel_category = "nuclear",
    effectivity = 1,
    fuel_inventory_size = 1,
    burnt_inventory_size = 1
  },
  collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  --the collision box of a reactor is increased by this on the sides where it connects to another reactor:
  --neighbour_collision_increase = 0.25,
  lower_layer_picture =
  {
    filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes.png",
    width = 156,
    height = 156,
    shift = util.by_pixel(-2, -4),
    hr_version =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes.png",
      width = 320,
      height = 316,
      scale = 0.5,
      shift = util.by_pixel(-1, -5),
    }
  },
  heat_lower_layer_picture =
  {
    filename = "__base__/graphics/entity/nuclear-reactor/reactor-pipes-heated.png",
    width = 156,
    height = 156,
    shift = util.by_pixel(-3, -4),
    hr_version =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-pipes-heated.png",
      width = 320,
      height = 316,
      scale = 0.5,
      shift = util.by_pixel(-0.5, -4.5),
    }
  },

  picture =
  {
    layers =
    {
      {
        filename = "__Megastructures__/graphics/entity/mega-reactor/mega-reactor.png",
        width = 300,
        height = 300,
        scale = 1.5,
        shift = util.by_pixel(-6, -6),
        hr_version =
        {
          filename = "__Megastructures__/graphics/entity/mega-reactor/hr-mega-reactor.png",
          width = 600,
          height = 600,
          scale = 0.75,
          shift = util.by_pixel(-5, -7),
        }
      }
    }
  },

  working_light_picture =
  {
    filename = "__base__/graphics/entity/nuclear-reactor/reactor-lights-color.png",
    width = 160,
    height = 160,
    shift = { -0.03125, -0.1875 },
    blend_mode = "additive",
    hr_version =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-lights-color.png",
      width = 320,
      height = 320,
      scale = 0.5,
      shift = { -0.03125, -0.1875 },
      blend_mode = "additive"
    }
  },

  light = {intensity = 0.6, size = 9.9, shift = {0.0, 0.0}, color = {r = 0.0, g = 1.0, b = 0.0}},
  -- use_fuel_glow_color = false, -- should use glow color from fuel item prototype as light color and tint for working_light_picture
  -- default_fuel_glow_color = { 0, 1, 0, 1 } -- color used as working_light_picture tint for fuels that don't have glow color defined

  heat_buffer =
  {
    max_temperature = 1000,
    specific_heat = "50MJ",
    max_transfer = "100GW",
    minimum_glow_temperature = 350,
    glow_alpha_modifier = 0.6,
    connections =
    {
      {
        position = {-2, -2},
        direction = defines.direction.north
      },
      {
        position = {0, -2},
        direction = defines.direction.north
      },
      {
        position = {2, -2},
        direction = defines.direction.north
      },
      {
        position = {2, -2},
        direction = defines.direction.east
      },
      {
        position = {2, 0},
        direction = defines.direction.east
      },
      {
        position = {2, 2},
        direction = defines.direction.east
      },
      {
        position = {2, 2},
        direction = defines.direction.south
      },
      {
        position = {0, 2},
        direction = defines.direction.south
      },
      {
        position = {-2, 2},
        direction = defines.direction.south
      },
      {
        position = {-2, 2},
        direction = defines.direction.west
      },
      {
        position = {-2, 0},
        direction = defines.direction.west
      },
      {
        position = {-2, -2},
        direction = defines.direction.west
      }
    },

    heat_picture =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-heated.png",
      width = 108,
      height = 128,
      shift = util.by_pixel(1, -7),
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-heated.png",
        width = 216,
        height = 256,
        scale = 0.5,
        shift = util.by_pixel(3, -6.5),
      }
    },
    heat_glow =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-heat-glow.png",
      priority = "extra-high",
      width = 188,
      height = 190,
      tint = heat_glow_tint,
      shift = util.by_pixel(-2, -4)
    }
  },

  connection_patches_connected =
  {
    sheet =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
      width = 32,
      height = 32,
      variation_count = 12,
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
        width = 64,
        height = 64,
        variation_count = 12,
        scale = 0.5
      }
    }
  },

  connection_patches_disconnected =
  {
    sheet =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches.png",
      width = 32,
      height = 32,
      variation_count = 12,
      y = 32,
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches.png",
        width = 64,
        height = 64,
        variation_count = 12,
        y = 64,
        scale = 0.5
      }
    }
  },

  heat_connection_patches_connected =
  {
    sheet =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
      width = 32,
      height = 32,
      variation_count = 12,
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
        width = 64,
        height = 64,
        variation_count = 12,
        scale = 0.5
      }
    }
  },

  heat_connection_patches_disconnected =
  {
    sheet =
    {
      filename = "__base__/graphics/entity/nuclear-reactor/reactor-connect-patches-heated.png",
      width = 32,
      height = 32,
      variation_count = 12,
      y = 32,
      hr_version =
      {
        filename = "__base__/graphics/entity/nuclear-reactor/hr-reactor-connect-patches-heated.png",
        width = 64,
        height = 64,
        variation_count = 12,
        y = 64,
        scale = 0.5
      }
    }
  },

  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65},

  meltdown_action =
  {
    type = "direct",
    action_delivery =
    {
      type = "instant",
      target_effects =
      {
        {
            repeat_count = 100,
            type = "create-trivial-smoke",
            smoke_name = "nuclear-smoke",
            offset_deviation = {{-1, -1}, {1, 1}},
            starting_frame = 3,
            starting_frame_deviation = 5,
            starting_frame_speed = 0,
            starting_frame_speed_deviation = 5,
            speed_from_center = 0.5
        },
        {
          type = "create-entity",
          entity_name = "explosion"
        },
        {
          type = "damage",
          damage = {amount = 1000, type = "explosion"}
        },
        {
          type = "create-entity",
          entity_name = "small-scorchmark",
          check_buildability = true
        },
        {
          type = "nested-result",
          action =
          {
            type = "area",
            target_entities = false,
            trigger_from_target = true,
            repeat_count = 2000,
            radius = 100,
            action_delivery =
            {
              type = "projectile",
              projectile = "atomic-bomb-wave",
              starting_speed = 1
            }
          }
        }
      }
    }
  }
},
{
  type = "item",
  name = "mega-reactor",
  icon = "__Megastructures__/graphics/icons/mega-reactor-icon.png",
  icon_size = 32,
  subgroup = "energy",
  order = "f[nuclear-energy]-b[mega-reactor]",
  place_result = "mega-reactor",
  stack_size = 5
},
{
  type = "recipe",
  name = "mega-reactor",
  energy_required = 100,
  enabled = false,
  ingredients =
  {
    {"nuclear-reactor", 10},
    {"processing-unit", 100},
    {"low-density-structure", 100},
    {"heat-pipe", 50}
  },
  result = "mega-reactor",
  requester_paste_multiplier = 1
},
{
  type = "technology",
  name = "optimised-chain-reactions",
  icon_size = 128,
  icon = "__base__/graphics/technology/nuclear-power.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "mega-reactor"
    },
    {
      type = "unlock-recipe",
      recipe = "conductive-heat-pipe"
    },
  },
  prerequisites = {"nuclear-power","low-density-structure","advanced-electronics"},
  unit =
  {
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1}
    },
    time = 120,
    count = 1000
  },
  order = "e-p-b-c"
},
{
  type = "heat-pipe",
  name = "conductive-heat-pipe",
  icon = "__base__/graphics/icons/heat-pipe.png",
  icon_size = 32,
  flags = {"placeable-neutral", "player-creation"},
  minable = {mining_time = 0.1, result = "conductive-heat-pipe"},
  max_health = 200,
  corpse = "heat-pipe-remnants",
  random_corpse_variation = true,
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  resistances =
  {
    {
      type = "fire",
      percent = 90
    },
    {
      type = "explosion",
      percent = 30
    },
    {
      type = "impact",
      percent = 30
    }
  },
  collision_box = {{-0.3, -0.3}, {0.3, 0.3}},
  selection_box = {{-0.5, -0.5}, {0.5, 0.5}},
  heat_buffer =
  {
    max_temperature = 1000,
    specific_heat = "1MJ",
    max_transfer = "2GW",
    minimum_glow_temperature = 350,
    connections =
    {
      {
        position = {0, 0},
        direction = defines.direction.north
      },
      {
        position = {0, 0},
        direction = defines.direction.east
      },
      {
        position = {0, 0},
        direction = defines.direction.south
      },
      {
        position = {0, 0},
        direction = defines.direction.west
      }
    },
    heat_glow =
    {
      filename = "__base__/graphics/entity/heat-pipe/heated-glow.png",
      priority = "extra-high",
      width = 55,
      height = 55,
      tint = heat_glow_tint
    }
  },

  connection_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heat-pipe",
    {
      single = { name = "straight-vertical-single", ommit_number = true },
      straight_vertical = { variations = 6 },
      straight_horizontal = { variations = 6 },
      corner_right_up = { name = "corner-up-right", variations = 6 },
      corner_left_up = { name = "corner-up-left", variations = 6 },
      corner_right_down = { name = "corner-down-right", variations = 6 },
      corner_left_down = { name = "corner-down-left", variations = 6 },
      t_up = {},
      t_down = {},
      t_right = {},
      t_left = {},
      cross = { name = "t" },
      ending_up = {},
      ending_down = {},
      ending_right = {},
      ending_left = {}
    }),

  heat_glow_sprites = make_heat_pipe_pictures("__base__/graphics/entity/heat-pipe/", "heated",
    {
      single = { empty = true },
      straight_vertical = { variations = 6 },
      straight_horizontal = { variations = 6 },
      corner_right_up = { name = "corner-up-right", variations = 6 },
      corner_left_up = { name = "corner-up-left", variations = 6 },
      corner_right_down = { name = "corner-down-right", variations = 6 },
      corner_left_down = { name = "corner-down-left", variations = 6 },
      t_up = {},
      t_down = {},
      t_right = {},
      t_left = {},
      cross = { name = "t" },
      ending_up = {},
      ending_down = {},
      ending_right = {},
      ending_left = {}
    })
},
{
  type = "item",
  name = "conductive-heat-pipe",
  icon = "__base__/graphics/icons/heat-pipe.png",
  icon_size = 32,
  subgroup = "energy",
  order = "f[nuclear-energy]-c[conductive-heat-pipe]",
  place_result = "conductive-heat-pipe",
  stack_size = 50
},
{
  type = "recipe",
  name = "conductive-heat-pipe",
  energy_required = 10,
  enabled = false,
  ingredients = {{"heat-pipe", 2}, {"copper-plate", 20},{"low-density-structure", 10}},
  result = "conductive-heat-pipe"
},
{
  type = "recipe-category",
  name = "drilling"
},
{
  type = "item",
  name = "uranium-drill-head",
  icon = "__base__/graphics/icons/electric-engine-unit.png",
  icon_size = 32,
  subgroup = "intermediate-product",
  order = "a[uranium-drill-head]",
  stack_size = 50
},
{
  type = "recipe",
  name = "uranium-drill-head",
  category = "crafting-with-fluid",
  energy_required = 50,
  ingredients =
  {
    {"uranium-238", 10},
    {type="fluid", name= "lubricant", amount = 20},
    {"advanced-circuit", 10},
    {"steel-plate", 10},
    {"iron-gear-wheel", 10}
  },
  result = "uranium-drill-head",
  enabled = false
},
{
  type = "assembling-machine",
  name = "deep-drill",
  icon = "__base__/graphics/icons/centrifuge.png",
  icon_size = 32,
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 1, result = "deep-drill"},
  max_health = 350,
  corpse = "centrifuge-remnants",
  dying_explosion = "medium-explosion",
  resistances = {},
  collision_box = {{-2.2, -2.2}, {2.2, 2.2}},
  selection_box = {{-2.5, -2.5}, {2.5, 2.5}},
  drawing_box = {{-2.5, -2.8}, {2.5, 2.5}},

  animation = 
  {
    layers = 
    {
      {
        filename = "__Megastructures__/graphics/entity/deep-drill/deep-drill.png",
        priority = "high",
        width = 500,
        height = 500,
        direction_count = 1,
        shift = util.by_pixel(0, 1-32),
        scale = 0.5,
        hr_version =
        {
          filename = "__Megastructures__/graphics/entity/deep-drill/hr-deep-drill.png",
          priority = "high",
          width = 750,
          height = 750,
          direction_count = 1,
          shift = util.by_pixel(0, 1-32),
          scale = 0.33
        }
      }
    }
  },
  open_sound = { filename = "__base__/sound/machine-open.ogg", volume = 0.85 },
  close_sound = { filename = "__base__/sound/machine-close.ogg", volume = 0.75 },
  vehicle_impact_sound =  { filename = "__base__/sound/car-metal-impact.ogg", volume = 0.65 },
  working_sound =
  {
    sound =
    {
      {
        filename = "__base__/sound/assembling-machine-t2-1.ogg",
        volume = 0.8
      },
      {
        filename = "__base__/sound/assembling-machine-t2-2.ogg",
        volume = 0.8
      }
    },
    idle_sound = { filename = "__base__/sound/idle1.ogg", volume = 0.6 },
    apparent_volume = 1.5
  },
  crafting_speed = 1,
  crafting_categories = {"drilling"},
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = 20
  },
  energy_usage = "500kW",
  module_specification =
  {
    module_slots = 0
  },
  allowed_effects = {"consumption", "speed", "productivity", "pollution"},
  fluid_boxes =
    {
      {
        production_type = "input",
        pipe_picture = assembler2pipepictures(),
        pipe_covers = pipecoverspictures(),
        base_area = 10,
        base_level = -1,
        pipe_connections = {{ type="input", position = {0, -3} }},
        secondary_draw_orders = { north = -1 }
      },
      off_when_no_fluid_recipe = true
    },
},
{
  type = "item",
  name = "deep-drill",
  icon = "__Megastructures__/graphics/icons/deep-drill-icon.png",
  icon_size = 32,
  subgroup = "production-machine",
  order = "f[deep-drill]",
  place_result = "deep-drill",
  stack_size = 10
},
{
  type = "recipe",
  name = "deep-drill",
  energy_required = 20,
  enabled = false,
  ingredients =
  {
    {"uranium-drill-head", 10},
    {"processing-unit", 50},
    {"uranium-238", 50},
    {"iron-gear-wheel", 20},
    {"steel-plate", 20}
  },
  result = "deep-drill",
  requester_paste_multiplier= 10
},
{
  type = "technology",
  name = "deep-crust-drilling",
  icon_size = 128,
  icon = "__Megastructures__/graphics/icons/deep-drill-tech.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "uranium-drill-head"
    },
    {
      type = "unlock-recipe",
      recipe = "deep-drill"
    },
    {
      type = "unlock-recipe",
      recipe = "deep-crust-drill"
    },
  },
  prerequisites = {"uranium-processing","advanced-electronics","mining-productivity-3"},
  unit =
  {
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1}
    },
    time = 60,
    count = 1000
  },
  order = "e-p-b-c"
},
{
  type = "recipe",
  name = "deep-crust-drill",
  category = "drilling",
  energy_required = 200,
  enabled = false,
  ingredients =
  {
    {type="fluid", name= "lubricant", amount = 20}
  },
  result_count = 5,
  results = 
  {
    {"iron-ore", 1},
    {"copper-ore", 1},
    {"uranium-ore", 1},
    {"stone", 1},
    {"coal", 1}
  },
  icon = "__Megastructures__/graphics/icons/uranium-drill-head-icon.png",
  icon_size = 32,
  subgroup = "intermediate-product"
},
{
  type = "radar",
  name = "mega-radar",
  icon = "__Megastructures__/graphics/icons/mega-radar-icon.png",
  icon_size = 32,
  flags = {"placeable-neutral", "placeable-player", "player-creation"},
  minable = {mining_time = 1, result = "mega-radar"},
  max_health = 350,
  corpse = "radar-remnants",
  rotation_speed = 0.01,
  resistances = {},
  collision_box = {{-2.8, -2.8}, {2.8, 2.8}},
  selection_box = {{-3, -3}, {3, 3}},
  drawing_box = {{-2, -2.2}, {2, 2}},
  energy_usage = "500kW",
  energy_per_sector = "5MW",
  energy_per_nearby_scan = "500kW",
  energy_source =
  {
    type = "electric",
    usage_priority = "secondary-input",
    emissions_per_minute = 20
  },
  max_distance_of_sector_revealed = 100,
  max_distance_of_nearby_sector_revealed = 50,
  pictures =
  {
    layers =
    {

      {
        filename = "__Megastructures__/graphics/entity/mega-radar/mega-radar.png",
        priority = "high",
        width = 500,
        height = 500,
        direction_count = 64,
        line_length = 8,
        shift = util.by_pixel(1+8, 1-56),
        scale = 1.2,
        hr_version =
        {
          filename = "__Megastructures__/graphics/entity/mega-radar/hr-mega-radar.png",
          priority = "high",
          width = 500,
          height = 500,
          direction_count = 64,
          line_length = 8,
          shift = util.by_pixel(1+8, 1-56),
          scale = 1.2
        }
      }
    }
  },

},
{
  type = "item",
  name = "mega-radar",
  icon = "__Megastructures__/graphics/icons/mega-radar-icon.png",
  icon_size = 32,
  subgroup = "defensive-structure",
  order = "d[mega-radar]",
  place_result = "mega-radar",
  stack_size = 10
},
{
  type = "item",
  name = "signal-generator",
  icon = "__base__/graphics/icons/programmable-speaker.png",
  icon_size = 32,
  subgroup = "intermediate-product",
  order = "a[signal-generator]",
  stack_size = 50
},
{
  type = "recipe",
  name = "signal-generator",
  energy_required = 100,
  enabled = false,
  ingredients =
  {
    {"advanced-circuit", 10},
    {"uranium-235", 10}
  },
  result = "signal-generator",
  requester_paste_multiplier= 10
},
{
  type = "recipe",
  name = "mega-radar",
  energy_required = 500,
  enabled = false,
  ingredients =
  {
    {"radar", 50},
    {"processing-unit", 100},
    {"signal-generator", 20}
  },
  result = "mega-radar",
  requester_paste_multiplier= 5
},
{
  type = "technology",
  name = "low-frequency-signal-generation",
  icon_size = 128,
  icon = "__Megastructures__/graphics/icons/mega-radar-tech.png",
  effects =
  {
    {
      type = "unlock-recipe",
      recipe = "signal-generator"
    },
    {
      type = "unlock-recipe",
      recipe = "mega-radar"
    },
  },
  prerequisites = {"uranium-processing","advanced-electronics-2","low-density-structure"},
  unit =
  {
    ingredients =
    {
      {"automation-science-pack", 1},
      {"logistic-science-pack", 1},
      {"chemical-science-pack", 1},
      {"production-science-pack", 1},
      {"utility-science-pack", 1},
      {"space-science-pack", 1}
    },
    time = 60,
    count = 1000
  },
  order = "e-p-b-c"
},
{
  type = "recipe",
  name = "deep-crust-drill",
  category = "drilling",
  energy_required = 20,
  enabled = false,
  ingredients =
  {
    {type="fluid", name= "lubricant", amount = 200}
  },
  result_count = 5,
  results = 
  {
    {"iron-ore", 1},
    {"copper-ore", 1},
    {"uranium-ore", 1},
    {"stone", 1},
    {"coal", 1}
  },
  requester_paste_multiplier= 10,
  icon = "__base__/graphics/icons/kovarex-enrichment-process.png",
  icon_size = 32,
  subgroup = "intermediate-product"
}
})