local node = electric-pole:new

node.name = "Node"
node.supply_area_distance = 10
node.maximum_wire_distance = 100
node.draw_copper_wires = false
node.draw_circuit_wires = false

local recipe = recipe.new

recipe.ingredients = {{uranium-235,20},{uranium-238,20}}
recipe.name = "Node"
recipe.result = "node"
recipe.enabled = true

data.extend(node,recipe)