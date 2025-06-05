import "aframe";
import React, { useEffect } from "react";

export default function App() {
  useEffect(() => {
    const box = document.getElementById("clickableBox");
    if (box) {
      console.log("📦 Box found");
      box.addEventListener("click", () => {
        console.log("📦 Box clicked!");
        fetch("http://localhost:8080/api/player/event", {
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          body: JSON.stringify({ event: "jump", value: 123 }),
        })
          .then((res) => res.text())
          .then((msg) => console.log("✅ Backend says:", msg))
          .catch((err) => console.error("❌ Error:", err));
      });
    } else {
      console.warn("❌ Box not found in DOM!");
    }
  }, []);

  return (
    <a-scene>
      <a-box
        id="clickableBox"
        position="0 1 -3"
        color="#4CC339"
        event-set__click="_event: click; color: red"
      ></a-box>
      <a-sphere position="2 1 -4" radius="1.25" color="#EF2D5E"></a-sphere>
      <a-plane
        position="0 0 -4"
        rotation="-90 0 0"
        width="8"
        height="8"
        color="#7BC8A4"
      ></a-plane>
      <a-sky color="#ECECEC"></a-sky>
      <a-camera position="0 -3 0"></a-camera>
    </a-scene>
  );
}
