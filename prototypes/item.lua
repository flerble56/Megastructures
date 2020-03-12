local node = electric-pole:new

node.name = "node"
node.pictures = table.deepcopy(data.raw("medium-electric-pole").pictures)
node.supply_area_distance = 50
node.maximum_wire_distance = 100
node.draw_copper_wires = false
node.draw_circuit_wires = false
node.type = "electric-pole"

local nodeRecipe = recipe:new

recipe.ingredients = {{"uranium-235",20},{"uranium-238",20},{"substation",30},{"steel-plate",20},{"processing-unit",20}}
recipe.name = "node"
recipe.result = "node"
recipe.enabled = true

data.extend(node,nodeRecipe)