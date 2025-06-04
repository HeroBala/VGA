# ⚙️ Technical Constraints

## ✅ Hardware Targets

- Desktop (Mid-Tier)
  - 60 FPS target
  - < 100k poly scene
  - Texture budget: < 512MB
  - RAM footprint: ~1.5GB
  - Load time: < 5s for first load

- Mobile (Optional Support)
  - 30 FPS minimum
  - Simple lighting (no shadows)
  - Static environments only
  - Use compressed GLTF models
  - Fallback UI for touch devices

## 🔐 Performance Strategies

- Lazy load assets by zone
- Compress all textures
- Use LOD for characters and vehicles
- Minimal post-processing
- Disable unused shaders/scripts

## 📝 Summary

These constraints ensure a consistent and performant experience across mid-tier desktops and optionally mobile devices.

