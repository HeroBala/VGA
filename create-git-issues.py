import os
import requests

GITHUB_TOKEN = os.getenv("GITHUB_TOKEN")
if not GITHUB_TOKEN:
    raise ValueError("GITHUB_TOKEN not set. Use: export GITHUB_TOKEN=your_token_here")

HEADERS = {
    "Authorization": f"token {GITHUB_TOKEN}",
    "Accept": "application/vnd.github+json"
}

def get_username():
    resp = requests.get("https://api.github.com/user", headers=HEADERS)
    return resp.json()["login"]

def get_repositories():
    print("Fetching your repositories...")
    resp = requests.get("https://api.github.com/user/repos?per_page=100", headers=HEADERS)
    return sorted(resp.json(), key=lambda r: r['name'].lower())

def select_repository(repos):
    print("\nRepositories:")
    for i, repo in enumerate(repos):
        print(f"[{i}] {repo['full_name']}")
    choice = input(f"\nChoose repo [0-{len(repos)-1}] (default 0): ").strip()
    return repos[int(choice)] if choice.isdigit() and int(choice) < len(repos) else repos[0]

def create_issues(owner, repo, username):
    issues = []

    issues_data = [
        ("Phase 0.1: Define Game Vision", [
            "Document genre (open-world, sandbox)",
            "List features: driving, combat, missions",
            "Target platform: WebGL-compatible browsers"
        ]),
        ("Phase 0.2: Research Game References", [
            "Study GTA 5 gameplay systems",
            "List standout mechanics worth replicating"
        ]),
        ("Phase 0.3: Draft MVP Scope", [
            "Decide initial features",
            "Define what will be implemented in v1"
        ]),
        ("Phase 0.4: Finalize Technical Constraints", [
            "Determine hardware limitations",
            "List mobile compatibility considerations"
        ]),
        ("Phase 1.1: Engine Comparison", [
            "Evaluate Babylon.js vs Three.js vs Unity WebGL",
            "Prepare comparison matrix: performance, asset support"
        ]),
        ("Phase 1.2: Select Java + A-Frame Stack", [
            "Use Java (Spring Boot) for API",
            "Frontend rendering via A-Frame with JS integration"
        ]),
        ("Phase 1.3: A-Frame + Backend Integration", [
            "Create REST APIs for player data",
            "Ensure A-Frame can trigger backend events"
        ]),
        ("Phase 2.1: Initialize Project Structure", [
            "Setup Git, README, folders for assets/scripts"
        ]),
        ("Phase 2.2: Dev Tooling", [
            "Use Vite or Webpack",
            "Live reload setup"
        ]),
        ("Phase 2.3: Import External Models", [
            "Download assets from Poly.pizza",
            "Organize under /assets/models"
        ]),
        ("Phase 3.1: City Layout", [
            "Design roads, buildings, parks",
            "Place static props"
        ]),
        ("Phase 3.2: Lighting and Sky", [
            "Add directional/ambient lighting",
            "Skybox for realism"
        ]),
        ("Phase 4.1: Character Movement", [
            "WASD controls",
            "Add idle/run/walk animation blending"
        ]),
        ("Phase 4.2: Vehicle System", [
            "Add enter/exit vehicle logic",
            "Driveable vehicle physics"
        ]),
        ("Phase 5.1: Mission System", [
            "Create mission triggers",
            "Unlock rewards upon completion"
        ]),
        ("Phase 5.2: Save Game State", [
            "Use localStorage or backend API",
            "Save car unlocks and player stats"
        ]),
        ("Phase 6.1: Combat Mechanics", [
            "Add basic shooting or melee",
            "Enemy health system"
        ]),
        ("Phase 6.2: NPC AI", [
            "Create civilians, police",
            "Add patrol and chase logic"
        ]),
        ("Phase 7.1: UI Design", [
            "Health, ammo, minimap HUD",
            "Pause and inventory menus"
        ]),
        ("Phase 7.2: Cutscenes and Dialogs", [
            "Basic interaction scripts",
            "Quest text rendering"
        ]),
        ("Phase 8.1: Optimize Assets", [
            "Compress textures and meshes",
            "Lazy-load models"
        ]),
        ("Phase 8.2: Deployment", [
            "Deploy to Vercel or Netlify",
            "Configure HTTPS and mobile support"
        ])
    ]

    for title, tasks in issues_data:
        body = "**Objective:**\n" + title.split(": ")[1] + "\n\n**Tasks:**\n" + "\n".join(f"- {task}" for task in tasks)
        issues.append({"title": title, "body": body, "labels": ["Phase"]})

    for issue in issues:
        url = f"https://api.github.com/repos/{owner}/{repo}/issues"
        payload = {
            "title": issue["title"],
            "body": issue["body"],
            "labels": issue["labels"],
            "assignees": [username]
        }
        resp = requests.post(url, json=payload, headers=HEADERS)
        if resp.status_code == 201:
            print(f"Created issue: {issue['title']}")
        else:
            print(f"Failed: {issue['title']} - {resp.status_code}\n{resp.text}")

if __name__ == "__main__":
    try:
        username = get_username()
        repos = get_repositories()
        selected = select_repository(repos)
        owner = selected["owner"]["login"]
        repo = selected["name"]
        print(f"\nCreating issues in: {owner}/{repo}\n")
        create_issues(owner, repo, username)

    except Exception as e:
        print(f"\nError: {e}")

