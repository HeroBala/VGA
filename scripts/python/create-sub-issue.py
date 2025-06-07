import os
import requests

# GitHub configuration
GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
REPO = "HeroBala/VGA"
PARENT_ISSUE_NUMBER = 10
API_URL = f"https://api.github.com/repos/{REPO}/issues"

HEADERS = {
    "Authorization": f"Bearer {GITHUB_TOKEN}",
    "Accept": "application/vnd.github+json"
}

# Define subissues
subissues = [
    {
        "title": "10.1 - Set Up Folder Structure for Imported Models",
        "body": (
            "Create the required folders under `/assets/models` to organize assets from Poly.pizza.\n\n"
            "Folder structure includes:\n"
            "- `environment/{city_buildings, infrastructure, urban_decor, interactive_elements}`\n"
            "- `vehicles/`, `characters/`, `gameplay_items/`\n\n"
            "**Command:**\n"
            "```bash\n"
            "mkdir -p assets/models/{environment/{city_buildings,infrastructure,urban_decor,interactive_elements},vehicles,characters,gameplay_items}\n"
            "```"
        )
    },
    {
        "title": "10.2 - Download Urban Environment Assets from Poly.pizza",
        "body": (
            "Search and download low-poly assets:\n"
            "- 🏢 City Buildings: `low poly building`\n"
            "- 🛣️ Infrastructure: `road`, `sidewalk`, `streetlight`\n"
            "- 🌳 Decor: `urban furniture`, `tree`, `bench`\n"
            "- 🚏 Interactives: `bus stop`, `sign`, `mailbox`\n\n"
            "Organize assets under `/assets/models/environment/`."
        )
    },
    {
        "title": "10.3 - Import Vehicle Models",
        "body": (
            "Download and store vehicle models in `/assets/models/vehicles/`.\n"
            "- 🚘 Sedan, truck, motorcycle: `car glb`, `motorbike`\n"
            "- 🚔 Police Car: `police`\n"
            "- 🚖 Taxi: `taxi`\n\n"
            "Use `.glb` or `.fbx` format, name files clearly."
        )
    },
    {
        "title": "10.4 - Import Characters & NPC Models",
        "body": (
            "Download low-poly character models and save in `/assets/models/characters/`.\n"
            "- 🧑 Civilians: `civilian character`\n"
            "- 👮 Police/NPCs: `police`, `low poly human`\n"
            "- 🧥 Avatars: `avatar`, `customizable character`"
        )
    },
    {
        "title": "10.5 - Import Gameplay Item Models",
        "body": (
            "Find and store gameplay-related models under `/assets/models/gameplay_items/`.\n"
            "- 🔫 Weapons: `gun`, `melee weapon`\n"
            "- 💼 Mission Props: `briefcase`, `bag`, `package`\n"
            "- 💰 Collectibles: `money`, `crate`, `health pickup`"
        )
    }
]

# Create issues
for issue in subissues:
    response = requests.post(API_URL, headers=HEADERS, json=issue)
    if response.status_code == 201:
        issue_url = response.json().get("html_url", "URL not found")
        print(f"✅ Created: {issue['title']} → {issue_url}")
    else:
        print(f"❌ Failed to create: {issue['title']} – Status {response.status_code}")
        print(response.json())

