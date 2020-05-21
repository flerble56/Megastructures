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
    maximum_wire_distance = 64,
    supply_area_distance = 64,
    draw_copper_wires = false,
    draw_circuit_wires = false,
    pictures =
    {
      layers =
      {

        {
          filename = "__base__/graphics/entity/substation/substation.png",
          priority = "high",
          width = 70,
          height = 136,
          direction_count = 4,
          shift = util.by_pixel(0, 1-32),
          hr_version =
          {
            filename = "__base__/graphics/entity/substation/hr-substation.png",
            priority = "high",
            width = 138,
            height = 270,
            direction_count = 4,
            shift = util.by_pixel(0, 1-32),
            scale = 0.5
          }
        },
        {
          filename = "__base__/graphics/entity/substation/substation-shadow.png",
          priority = "high",
          width = 186,
          height = 52,
          direction_count = 4,
          shift = util.by_pixel(62, 42-32),
          draw_as_shadow = true,
          hr_version =
          {
            filename = "__base__/graphics/entity/substation/hr-substation-shadow.png",
            priority = "high",
            width = 370,
            height = 104,
            direction_count = 4,
            shift = util.by_pixel(62, 42-32),
            draw_as_shadow = true,
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
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(144, 21),
          red = util.by_pixel(110, -3)
        },
        wire =
        {
          copper = util.by_pixel(0, -85),
          green = util.by_pixel(15, -70),
          red = util.by_pixel(-15, -92)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(127, 26),
          red = util.by_pixel(127, -8)
        },
        wire =
        {
          copper = util.by_pixel(0, -85),
          green = util.by_pixel(0, -66),
          red = util.by_pixel(0, -97)
        }
      },
      {
        shadow =
        {
          copper = util.by_pixel(133, 9),
          green = util.by_pixel(111, 20),
          red = util.by_pixel(144, -3)
        },
        wire =
        {
          copper = util.by_pixel(0, -86),
          green = util.by_pixel(-15, -71),
          red = util.by_pixel(15, -92)
        }
      }
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
  icon = "__base__/graphics/icons/medium-electric-pole.png",
  icon_size = 32,
  subgroup = "energy-pipe-distribution",
  order = "a[energy]-d[node]",
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
}
})