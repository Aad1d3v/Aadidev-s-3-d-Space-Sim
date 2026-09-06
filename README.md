#Aadidev's 3-D Space Sim#
An interactive, scientifically-grounded 3-D simulation of our solar system — real orbital mechanics, real NASA surface imagery, a time machine, and a sandbox for (very dramatic) destruction. Everything runs in a single self-contained HTML file.


What it is
A live, interactive model of the solar system that you can fly around, zoom into, rewind and fast-forward through 250 years of history, blow up, and rebuild. It balances real astronomy (positions from NASA/JPL Keplerian orbital elements) with a compressed, playable visual scale — planet sizes and distances are tuned so the whole system fits on screen while the physics stays mathematically correct.

Real orbits: every planet is placed by solving Kepler's equation for the selected date, so Earth sits at ~1.008 AU in July and ~0.983 AU in January — matching reality.
Real surfaces: all eight planets, the Moon, and the Sun wear genuine NASA-derived / Solar System Scope equirectangular textures, bundled locally so the sim is fully detailed even offline.
Real time: the sim defaults to ≈ 1 day per second — planets creep along their true paths like real life. Speed it up to a year per second and watch history unfold.
Sandbox: arm weapons, aim with missile crosshairs, and strike planets — from a small meteor to a full-power Annihilate that blows a planet into debris drifting across space.

How it was made
Single file, zero build step. The entire application — UI, physics engine, 3-D scene, sound synthesis, and documentation — lives in solarsystem.html (~3,700 lines). No npm, no bundler, no server required to develop.
Three.js r160 (loaded from CDN on first visit) renders the scene with WebGLRenderer; OrbitControls handles drag-to-rotate and scroll-to-zoom.
NASA/JPL Keplerian elements (epoch J2000) drive planet positions. heliocentricAU() solves Kepler's equation E − e·sin(E) = M with Newton–Raphson iteration, then maps ecliptic coordinates into the scene. Halley's Comet uses the same machinery with its own high-eccentricity elements.
Procedural fallbacks: if a texture fails to load, hand-painted canvas-based surface painters (continents, gas-giant bands, cloud layers) keep every planet recognizable.
Real bundled textures in assets/ (≈ 5 MB) — Earth at 4096×2048 with day, normal, cloud, and night-lights maps; Jupiter at 3600px; 2048×1024 maps for Mercury, Venus, Sun, Mars, Saturn, Uranus, Neptune, and the Moon.
Physical detail: true axial tilts (obliquity) as pivot groups, true sidereal rotation rates (retrograde for Venus and Uranus), a Keplerian asteroid belt where each rock has its own elliptical orbit and period law T ∝ a^1.5, vis-viva velocity readouts, and day/night terminator lighting with Earth's city lights on the night side.
Deployment: the included Dockerfile wraps the sim in a tiny nginx container that serves the page and the assets/ folder (see Running with Docker).

Features
🪐 Explore
Drag to rotate, scroll to zoom — fly anywhere in the system, from the Sun's corona to Neptune's moons.
Click any planet — the camera flies to it, follows it along its real orbit, and opens an info panel with stats (distance, mass, gravity, day/year length), fun facts, and a live readout of its true AU distance and orbital speed from the vis-viva equation.
Legend (bottom-right) — every row is a destination: the Sun, all 8 planets, the Moon, the asteroid belt, Halley's Comet, and an "Orbit" view that pulls back to see every orbital path at once. The Moon and comet get camera lock-on as they move.
Hover highlight — planets glow with a targeting ring and the cursor changes.

