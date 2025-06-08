import os
import json

# Path to your infrastructure model folder
model_dir = "assets/models/environment/infrastructure"

# Scan for .glb files
models = [
    {
        "name": os.path.splitext(f)[0].replace("_", " ").title(),
        "path": f"{model_dir}/{f}"
    }
    for f in os.listdir(model_dir)
    if f.endswith(".glb")
]

# Write to infrastructure.json
with open("data/infrastructure.json", "w") as outfile:
    json.dump(models, outfile, indent=2)

print(f"✅ Generated infrastructure.json with {len(models)} models.")

