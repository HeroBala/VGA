# ⚙️ Game Engine Comparison

## Candidates
- Babylon.js
- Three.js
- Unity WebGL

## Evaluation Matrix

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

## Recommendation

> We recommend starting with **Babylon.js** for its:
> - Strong GLTF support
> - Optimized WebGL performance
> - Smaller bundle size and smoother deployment

Unity WebGL is more powerful, but less suited for early-stage browser MVPs due to build size and complexity.

