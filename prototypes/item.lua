local node = table.deepcopy(data.raw.electric-pole["medium-electric-pole"])

node.name = "node"
node.supply_area_distance = 50
node.maximum_wire_distance = 100
node.draw_copper_wires = false
node.draw_circuit_wires = false

local nodeRecipe = table.deepcopy(data.raw.recipe["medium-electric-pole"])

nodeRecipe.ingredients = {{"uranium-235",20},{"uranium-238",20},{"substation",30},{"steel-plate",20},{"processing-unit",20}}
nodeRecipe.name = "node"
nodeRecipe.result = "node"
nodeRecipe.enabled = true
nodeRecipe.category = "advanced-crafting"
nodeRecipe.energy_required = 20

data:extend(node,nodeRecipe)