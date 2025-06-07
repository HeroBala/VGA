"""
────────────────────────────────────────────────────────────
🛠️  GLB Model Standardizer – Custom Keyword Scaling (Run from models/ folder)
────────────────────────────────────────────────────────────

RUN THIS SCRIPT FROM INSIDE THE ./models/ DIRECTORY

This script:
🔢 Recursively finds all `.glb` files
💡 Aligns models to ground level (Y = 0) & centers them in XZ
🔄 Applies scaling based on extensive keyword-to-height mapping
📄 Moves originals to ./raw/ & saves scaled files to ./standardized/

REQUIREMENTS:
    pip install trimesh
"""

import os
import shutil
import trimesh

BASE_DIR = '.'
RAW_DIR = os.path.join(BASE_DIR, 'raw')
STD_DIR = os.path.join(BASE_DIR, 'standardized')

# Expanded from your model list
MODEL_SCALE_REFERENCE = {
    "tree": 6, "big_tree": 8, "bush": 1.2, "fountain": 1.5, "trashcan": 0.9,
    "bench": 0.5, "lamp_post": 4, "road": 0.2, "intersection": 0.2,
    "railway": 0.5, "traffic": 3, "sign": 2, "radio_tower": 30, "tower": 30,
    "cathedral": 45, "hospital": 12, "police": 12, "castle": 40, "church": 18,
    "fire_station": 12, "school": 10, "museum": 15, "skyscraper": 100,
    "hotel": 30, "building": 10, "shop": 6, "bar": 5, "gas_station": 5,
    "factory": 15, "container": 3, "powerplant": 18, "van": 2, "motorcycle": 1.2,
    "car": 1.6, "truck": 2.8, "bus": 3.2, "train": 3.5, "tram": 3.5,
    "helicopter": 3.5, "ambulance": 2.8, "weapon": 0.8, "gun": 0.8,
    "crate": 1, "coin": 0.3, "dollar": 0.2, "backpack": 0.8, "laptop": 0.3,
    "chest": 1, "pistol": 0.5, "rifle": 0.9, "submachine": 0.8, "smg": 0.8,
    "shotgun": 0.9, "npc": 1.8, "soldier": 1.8, "zombie": 1.8, "civilian": 1.8,
    "business_man": 1.8, "character": 1.8, "adventurer": 1.8, "astronaut": 1.8,
    "witch": 1.8, "king": 1.8, "knight": 1.9, "robot": 1.9, "ms_gundam": 2.2,
    "fantasy_house": 12, "houseplant": 1.2, "statue": 2.5, "billboard": 3.5,
}

DEFAULT_HEIGHT = None  # Optional fallback

def infer_target_height(filename):
    for keyword, height in MODEL_SCALE_REFERENCE.items():
        if keyword.lower() in filename.lower():
            return height
    print(f"⚠️  No match found for: {filename}")
    return DEFAULT_HEIGHT

def standardize_glb(source_path, relative_path):
    try:
        mesh = trimesh.load(source_path, force='scene')
        bounds = mesh.bounds
        center = mesh.centroid
        min_y = bounds[0][1]
        max_y = bounds[1][1]
        current_height = max_y - min_y

        mesh.apply_translation((-center[0], -min_y, -center[2]))

        target_height = infer_target_height(os.path.basename(source_path))
        if target_height and current_height > 0:
            scale = target_height / current_height
            mesh.apply_scale(scale)
            print(f"✅ Scaled {relative_path} from {round(current_height,2)}m → {target_height}m")
        else:
            print(f"⚠️  Skipped scaling: {relative_path} ({round(current_height,2)}m)")

        out_path = os.path.join(STD_DIR, relative_path)
        os.makedirs(os.path.dirname(out_path), exist_ok=True)
        mesh.export(out_path)
    except Exception as e:
        print(f"❌ Error processing {relative_path}: {e}")

def move_original(source_path, relative_path):
    raw_path = os.path.join(RAW_DIR, relative_path)
    os.makedirs(os.path.dirname(raw_path), exist_ok=True)
    shutil.move(source_path, raw_path)

def main():
    for root, _, files in os.walk(BASE_DIR):
        if RAW_DIR in root or STD_DIR in root:
            continue
        for file in files:
            if file.endswith(".glb"):
                full_path = os.path.join(root, file)
                relative_path = os.path.relpath(full_path, BASE_DIR)
                standardize_glb(full_path, relative_path)
                move_original(full_path, relative_path)

if __name__ == "__main__":
    main()
