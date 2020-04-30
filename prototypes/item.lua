local node = table.deepcopy(data.raw["electric-pole"]["medium-electric-pole"])

node.name = "node"
node.icons= {
    {
       icon=node.icon,
       tint={r=1,g=0,b=0,a=0.3}
    },
}
node.supply_area_distance = 64
node.maximum_wire_distance = 64
node.draw_copper_wires = false
node.draw_circuit_wires = false
node.connection_points = {}
local wire_pos = WirePosition:new()
local shadow_pos = WirePosition:new()
local wire_con = WireConnectionPoint:new()
wire_con.wire = wire_pos
wire_con.shadow = shadow_pos
node.connection_points[0] = wire_con


local nodeItem = table.deepcopy(data.raw["item"]["medium-electric-pole"])

nodeItem.icons= {
    {
       icon=nodeItem.icon,
       tint={r=1,g=0,b=0,a=0.3}
    },
}
nodeItem.name = "nodeItem"
nodeItem.place_result = "node"

local nodeRecipe = table.deepcopy(data.raw.recipe["medium-electric-pole"])

nodeRecipe.ingredients = {{"uranium-235",20},{"uranium-238",20},{"substation",30},{"steel-plate",20},{"processing-unit",20}}
nodeRecipe.name = "node"
nodeRecipe.result = "nodeItem"
nodeRecipe.enabled = true
nodeRecipe.category = "advanced-crafting"
nodeRecipe.energy_required = 20

data:extend(node,nodeRecipe)