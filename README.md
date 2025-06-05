# 🎮 VGA: GTA-Style Web Open World Game

An immersive third-person, open-world action game playable directly in web browsers. Inspired by **GTA V**, the project brings together modern WebGL rendering (via Babylon.js), A-Frame, and a robust Spring Boot backend.

---

## 📌 Vision

- Explore an open-world city
- Drive vehicles, fight enemies, and complete missions
- Real-time player interaction via WebGL frontend and Java backend
- Save game state and progress
- Fully browser-based experience

---

## 🧱 Project Structure

## 🗂️ Project Structure

```text
VGA/
├── backend/                  # Spring Boot application
│   ├── src/main/java/
│   │   └── com/example/backend/
│   │       ├── PlayerController.java
│   │       ├── HomeController.java
│   │       └── WebConfig.java
│   └── pom.xml
├── frontend/                 # A-Frame + Babylon.js client
├── docs/                     # Game design docs (vision, engine eval, MVP)
├── scripts/                  # Utility scripts
└── README.md
## 🚀 MVP Scope

✅ Version 1.0 will include:
- WASD movement + mouse look
- One driveable car (enter/exit)
- Patrol-based enemy NPC
- One mission with reward
- LocalStorage or backend save system
- Minimal HUD

🚫 Deferred for v2.0:
- Police crime system
- In-game shops
- Multiplayer

---

## 🎯 Game Engine Comparison

| Criteria             | Babylon.js       | Three.js        | Unity WebGL     |
|----------------------|------------------|------------------|------------------|
| Language             | JS / TS          | JS               | C#               |
| Performance          | ✅ High          | ⚠️ Medium        | ✅ High          |
| File Size            | ✅ Small         | ✅ Small         | ❌ Heavy         |
| Asset Support        | ✅ GLTF Native   | ✅ GLTF/OBJ      | ✅ FBX/GLTF      |
| Tooling              | ✅ Web Optimized | ⚠️ Manual Setup  | ✅ GUI Tools     |
| Ease of Integration  | ✅ Simple         | ⚠️ Manual        | ⚠️ Complex       |
| Documentation        | ✅ Extensive     | ✅ Mature        | ✅ Full-Stack    |
| Browser Compatibility| ✅ Excellent     | ✅ Good          | ⚠️ Mobile Limits |

**Recommendation**: Start with **Babylon.js** for its balance of power, size, and deployment ease.

---

## 🛠️ Tech Stack

| Layer       | Tech                   |
|-------------|------------------------|
| Frontend    | HTML, JS, A-Frame, Babylon.js |
| Backend     | Java, Spring Boot      |
| API         | REST                   |
| Data Store  | LocalStorage / future DB |
| Deployment  | GitHub + Netlify / Render (future) |

---

## 📦 Setup Instructions

### Backend (Spring Boot)
```bash
cd backend
./mvnw spring-boot:run
Frontend
bash
Copy
Edit
cd frontend
# Open index.html with live-server or browser
Test API
bash
Copy
Edit
curl http://localhost:8080/api/player/status
curl -X POST http://localhost:8080/api/player/event \
  -H "Content-Type: application/json" \
  -d '{"event": "test", "value": 123}'
🔄 GitHub Issues Progress
ID	Phase	Status
#1	Define Game Vision	✅ Done
#2	Research Game References	✅ Done
#3	Draft MVP Scope	✅ Done
#4	Finalize Technical Constraints	✅ Done
#5	Engine Comparison	✅ Done
#6	Select Java + A-Frame Stack	✅ Done
#7	A-Frame + Backend Integration	✅ Done
#8	Initialize Project Structure	🔄 In Progress
#9-#22	Phase 2+ Features	🔜 Upcoming

✨ Contributions
HeroBala (👤 Hero)

Planning, development, integration, and architecture for browser-native 3D game.

📜 License
MIT License. Free for educational and personal use.
