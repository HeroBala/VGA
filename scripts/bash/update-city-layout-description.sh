#!/bin/bash

REPO="HeroBala/VGA"

declare -A issue_descriptions

# Utility guide to reuse
scale_guide="### 🔧 Guidelines for Scale and Positioning
- 📏 **Standard Scale**: Start with \`scale=\"3 3 3\"\` for environment models.
- ⬇️ **Ground Level**: Align base at \`Y = 0\` (adjust upward if sunken).
- ➡️ **Grid Step**: Place objects with ~10–15 units spacing for roads & props.
- 🧭 **Orientation**: Rotate buildings to face roads when applicable.
- 🎯 **Reference**: Use a static box for consistent height benchmarking."

# ISSUE 30
issue_descriptions[30]="## 🚧 Phase 3.1.1: Lay Out Roads & Intersections

Design and organize all city road networks.

### Tasks
- [ ] Use: \`road.glb\`, \`road_with_sidewalk.glb\`, \`intersection.glb\`
- [ ] Connect paths and layout intersections cleanly
- [ ] Validate pedestrian + vehicle pathways

$scale_guide"

# ISSUE 31
issue_descriptions[31]="## 🏛️ Phase 3.1.2: Place Civic and Public Buildings

Import major city structures like hospitals, schools, museums.

### Tasks
- [ ] Use assets from \`/building/civic/\`
- [ ] Place near road access, consider front-facing orientation
- [ ] Ensure uniform base and scale

$scale_guide"

# ISSUE 32
issue_descriptions[32]="## 🏘️ Phase 3.1.3: Residential Block Placement

Place urban homes, villas, huts in neighborhoods.

### Tasks
- [ ] Populate using \`/building/residential/\` assets
- [ ] Mix variety: apartment_building.glb, concept_home.glb, etc.
- [ ] Position with roads, small decor

$scale_guide"

# ISSUE 33
issue_descriptions[33]="## 🏪 Phase 3.1.4: Commercial & Industrial Districts

Define areas with business and manufacturing properties.

### Tasks
- [ ] Use: \`/building/commercial/\`, \`/building/industrial/\`
- [ ] Distribute to form realistic work zones
- [ ] Add distance from residential areas

$scale_guide"

# ISSUE 34
issue_descriptions[34]="## 🌲 Phase 3.1.5: Add Urban Decor

Place decorative props like trees, benches, and fountains.

### Tasks
- [ ] Import from \`/urban_decor/\`
- [ ] Add groupings (e.g., picnic_table + park_bench)
- [ ] Create pockets of rest areas

$scale_guide"

# ISSUE 35
issue_descriptions[35]="## ⚙️ Phase 3.1.6: Add Interactive Props

Enhance the scene with elevators, control panels, vending machines.

### Tasks
- [ ] Use: \`/interactive_elements/\` folder
- [ ] Assign logical locations (e.g., control_panel near doors)
- [ ] Place at accessible height (Y ~ 0.1–1)

$scale_guide"

# ISSUE 36
issue_descriptions[36]="## 💡 Phase 3.1.7: Lighting & Signage Setup

Insert signage and lighting elements.

### Tasks
- [ ] Add: \`stop_sign.glb\`, \`street_light.glb\`, \`lamp_post.glb\`
- [ ] Position consistently across roads
- [ ] Use directional light entity in A-Frame

$scale_guide"

# ISSUE 37
issue_descriptions[37]="## 🏙️ Phase 3.1.8: City Center Planning

Design core town zone with unique landmarks and accessibility.

### Tasks
- [ ] Add: \`town_center.glb\`, \`fortress.glb\`, \`museum_diorama.glb\`
- [ ] Decorate around with benches, trees
- [ ] Highlight using lighting and spacing

$scale_guide"

# ISSUE 38
issue_descriptions[38]="## 📏 Phase 3.1.9: Model Scale Consistency Review

Ensure all city elements follow a shared scale system.

### Tasks
- [ ] Run tests with \`<a-box>\` reference
- [ ] Adjust oversized models (scale down)
- [ ] Use visual parity for buildings and props

$scale_guide"

# ISSUE 39
issue_descriptions[39]="## ✅ Phase 3.1.10: Final Layout Review

Finalize the static layout before animation and interactivity.

### Tasks
- [ ] Confirm placement of all models
- [ ] Optimize spacing and remove overlaps
- [ ] Run a final A-Frame scene check

$scale_guide"

# Update each issue using GitHub CLI
for issue_number in "${!issue_descriptions[@]}"; do
  echo "✍️ Updating Issue #$issue_number..."
  gh issue edit "$issue_number" \
    --repo "$REPO" \
    --body "${issue_descriptions[$issue_number]}" \
    --add-label "Phase 3.1, Environment, Layout"
done

echo "🎉 All issues #30–39 updated with scale guides and descriptions!"
