#!/bin/bash

cd ~/HeroPractice/VGA/frontend/assets/models/environment || exit

declare -A FILE_MAP
FILE_MAP["elevator.glb"]="interactive_elements"
FILE_MAP["control_panel.glb"]="interactive_elements"
FILE_MAP["door.glb"]="interactive_elements"
FILE_MAP["stairs_open_single.glb"]="interactive_elements"
FILE_MAP["sign_hospital.glb"]="interactive_elements"
FILE_MAP["billboard.glb"]="interactive_elements"
FILE_MAP["vending_machine.glb"]="interactive_elements"
FILE_MAP["lever.glb"]="interactive_elements"
FILE_MAP["info_button.glb"]="interactive_elements"

FILE_MAP["tree.glb"]="urban_decor"
FILE_MAP["big_tree.glb"]="urban_decor"
FILE_MAP["bush_with_flowers.glb"]="urban_decor"
FILE_MAP["vine_covered_tree.glb"]="urban_decor"
FILE_MAP["trashcan.glb"]="urban_decor"
FILE_MAP["bush.glb"]="urban_decor"
FILE_MAP["planter_&_bushes.glb"]="urban_decor"
FILE_MAP["picnic_table.glb"]="urban_decor"
FILE_MAP["park_bench.glb"]="urban_decor"
FILE_MAP["fence_piece.glb"]="urban_decor"
FILE_MAP["bench.glb"]="urban_decor"
FILE_MAP["houseplant.glb"]="urban_decor"
FILE_MAP["horse_statue.glb"]="urban_decor"
FILE_MAP["fountain.glb"]="urban_decor"
FILE_MAP["grass_patch.glb"]="urban_decor"
FILE_MAP["tree_(1).glb"]="urban_decor"

FILE_MAP["bus_stop.glb"]="infrastructure"
FILE_MAP["telephone_pole.glb"]="infrastructure"
FILE_MAP["manhole_cover.glb"]="infrastructure"
FILE_MAP["road_(1).glb"]="infrastructure"
FILE_MAP["water_tower.glb"]="infrastructure"
FILE_MAP["intersection.glb"]="infrastructure"
FILE_MAP["street_light.glb"]="infrastructure"
FILE_MAP["railway_track_curve.glb"]="infrastructure"
FILE_MAP["traffic_barrier.glb"]="infrastructure"
FILE_MAP["trafficlight_b.glb"]="infrastructure"
FILE_MAP["parking_lot.glb"]="infrastructure"
FILE_MAP["country_side_road_seamless.glb"]="infrastructure"
FILE_MAP["road_with_sidewalk.glb"]="infrastructure"
FILE_MAP["railway_track_straight.glb"]="infrastructure"
FILE_MAP["lamp_post.glb"]="infrastructure"
FILE_MAP["stop_sign.glb"]="infrastructure"
FILE_MAP["radio_tower.glb"]="infrastructure"
FILE_MAP["cross_walk.glb"]="infrastructure"
FILE_MAP["road.glb"]="infrastructure"
FILE_MAP["wizard_tower.glb"]="infrastructure"

# Execute moves
for file in "${!FILE_MAP[@]}"; do
  path=$(find . -type f -name "$file" 2>/dev/null)
  if [[ -n "$path" ]]; then
    echo "Moving $file to ${FILE_MAP[$file]}/"
    mv "$path" "${FILE_MAP[$file]}/"
  else
    echo "⚠️  $file not found"
  fi
done

echo "✅ Done!"
