#!/bin/bash

REPO="HeroBala/VGA"
ASSIGNEE="HeroBala"
LABELS="Phase"

declare -a TITLES=(
  "3.1.1 – 🛣️ Import and Position Roads"
  "3.1.2 – 🏛️ Design Civic, Industrial, and Highrise Zones"
  "3.1.3 – 🏡 Place Residential and Generic Homes"
  "3.1.4 – 🌳 Urban Decor and Static Props"
  "3.1.5 – 🛠️ Add Interactive Elements to Buildings"
  "3.1.6 – 🚏 Traffic Fixtures and Street Furniture"
  "3.1.7 – 🚗 Vehicle Display and Placement"
  "3.1.8 – 🗽 Landmark Props and City Icons"
  "3.1.9 – 🏞️ Park and Recreational Layouts"
  "3.1.10 – 🔍 Final Model Scaling & Ground Alignment"
)

declare -a BODIES=(
  "### 🛣️ **Objective:** Import and place foundational roads\n\n**Assets:**\n- `road.glb`\n- `intersection.glb`\n- `road_with_sidewalk.glb`\n- `cross_walk.glb`\n\n**✅ Tasks:**\n- Align roads to a clean grid layout\n- Ensure realistic traffic intersections\n- Maintain a uniform ground level"

  "### 🏛️ **Objective:** Create city zones with essential buildings\n\n**Assets:**\n- `hospital.glb`, `police_box.glb`, `castle.glb`\n- `private_factory.glb`, `powerplant.glb`, `skyscraper.glb`\n\n**✅ Tasks:**\n- Zone buildings logically\n- Place industrial blocks near roads or outskirts\n- Cluster highrises in a vertical grid"

  "### 🏡 **Objective:** Populate neighborhoods\n\n**Assets:**\n- `seaside_villa.glb`, `cottage.glb`, `apartment_building.glb`\n\n**✅ Tasks:**\n- Place small buildings in clusters\n- Organize suburbs or residential blocks\n- Add visual separation from industrial/civic zones"

  "### 🌳 **Objective:** Add decor to bring life to the city\n\n**Assets:**\n- `park_bench.glb`, `picnic_table.glb`, `fountain.glb`, `bush_with_flowers.glb`\n\n**✅ Tasks:**\n- Add props in public zones and sidewalks\n- Place vegetation around residential zones"

  "### 🛠️ **Objective:** Place interactive scene elements\n\n**Assets:**\n- `door.glb`, `elevator.glb`, `control_panel.glb`, `vending_machine.glb`\n\n**✅ Tasks:**\n- Attach elements to buildings\n- Ensure they are visible and accessible to the player"

  "### 🚏 **Objective:** Street decor and navigational props\n\n**Assets:**\n- `stop_sign.glb`, `bus_stop.glb`, `telephone_pole.glb`, `lamp_post.glb`\n\n**✅ Tasks:**\n- Match signs to relevant intersections\n- Align lamp posts at regular street intervals"

  "### 🚗 **Objective:** Park and display city vehicles\n\n**Assets:**\n- `car.glb`, `motorcycle.glb`, `taxi.glb`, `ambulance.glb`, `dump_truck.glb`\n\n**✅ Tasks:**\n- Place cars in parking_lot.glb areas\n- Position emergency vehicles near civic buildings"

  "### 🗽 **Objective:** Iconic visuals & attractions\n\n**Assets:**\n- `wizard_tower.glb`, `horse_statue.glb`, `radio_tower.glb`, `billboard.glb`\n\n**✅ Tasks:**\n- Spread icons across the city to build identity\n- Place near public spaces for maximum visibility"

  "### 🏞️ **Objective:** Design city park and open areas\n\n**Assets:**\n- `tree.glb`, `big_tree.glb`, `grass_patch.glb`, `bench.glb`\n\n**✅ Tasks:**\n- Create natural clusters with paths\n- Insert seating and fencing (e.g. `fence_piece.glb`)"

  "### 🔍 **Objective:** Standardize and finalize model positioning\n\n**✅ Tasks:**\n- Set all models’ base to Y = 0\n- Fix floating or sunken elements (like `bus_stop.glb`)\n- Review scales for consistency\n\n**Note:** QA visual and ensure camera navigation feels natural"
)

for i in "${!TITLES[@]}"; do
  echo "🚀 Creating issue: ${TITLES[$i]}"
  gh issue create \
    --repo "$REPO" \
    --title "${TITLES[$i]}" \
    --body "${BODIES[$i]}" \
    --label "$LABELS" \
    --assignee "$ASSIGNEE"
done

echo "✅ All Phase 3.1 issues created successfully!"

