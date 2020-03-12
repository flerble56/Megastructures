local node = electric-pole:new

node.name = "node"
node.pictures = table.deepcopy(data.raw("medium-electric-pole").pictures)
--set the graphics to medium electric pole as a placeholder
node.icon = table.deepcopy(data.raw("medium-electric-pole").icon)
node.icon_size = table.deepcopy(data.raw("medium-electric-pole").icon_size)
node.supply_area_distance = 50
node.maximum_wire_distance = 100
node.draw_copper_wires = false
node.draw_circuit_wires = false
node.type = "electric-pole"

local nodeRecipe = recipe:new

nodeRecipe.ingredients = {{"uranium-235",20},{"uranium-238",20},{"substation",30},{"steel-plate",20},{"processing-unit",20}}
nodeRecipe.name = "node"
nodeRecipe.result = "node"
nodeRecipe.enabled = true
nodeRecipe.category = "advanced-crafting"
nodeRecipe.energy_required = 20
nodeRecipe.icon = table.deepcopy(data.raw("medium-electric-pole").icon)--as with node
nodeRecipe.icon_size = table.deepcopy(data.raw("medium-electric-pole").icon_size)

data.extend(node,nodeRecipe)