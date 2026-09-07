


you can find the end project at https://aadidev-s-3-d-space-sim.onrender.com/




#Aadidev's 3-D Space Sim
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
 Explore
Drag to rotate, scroll to zoom — fly anywhere in the system, from the Sun's corona to Neptune's moons.
Click any planet — the camera flies to it, follows it along its real orbit, and opens an info panel with stats (distance, mass, gravity, day/year length), fun facts, and a live readout of its true AU distance and orbital speed from the vis-viva equation.
Legend (bottom-right) — every row is a destination: the Sun, all 8 planets, the Moon, the asteroid belt, Halley's Comet, and an "Orbit" view that pulls back to see every orbital path at once. The Moon and comet get camera lock-on as they move.
Hover highlight — planets glow with a targeting ring and the cursor changes.


 The Moon dossier
Click the Moon to open a full dossier:

About — what it is, how it was born (the Theia impact), stats, and did-you-knows, with a rotating real-surface globe.
History — a 21-event timeline from its birth 4.5 billion years ago to today.
Missions — the Apollo 11 landing replay, then a scrollable archive of all 23 major lunar missions (Luna 9, Apollo 11–17, Lunokhod 1, Chang'e 4, Chandrayaan-3, SLIM…), each with date, nation, site, and story.
 Halley's Comet
On its real 76-year orbit (a = 17.83 AU, e = 0.967, inclined 162°). Set the date to 1986 and it's diving past the Sun; today it drifts near aphelion out past Neptune.
A glowing particle tail that always points away from the Sun and grows near perihelion — just like real comets.
Click it in space or in the legend to follow it.
 Sandbox (bottom-left dock)
Meteor / Nuclear bomb / Supervolcano / Annihilate — pick a weapon, set its power (10–100%), click a planet, get missile crosshairs, aim until LOCKED, and fire.
Damage is real and power-scaled — the planet's surface darkens with every hit; the info panel shows its integrity.
Annihilate at 100% obliterates the planet for good, blasting it into 150–340 chunks that keep drifting out across space until you hit  Clear.
Stacked hits that push damage to 100% trigger a slow-motion shatter — then the planet reforms ~4.5 s later.
 Surprise me, sound toggle (synthesized booms — no audio files),  Clear effects.
 Time machine (bottom-center dock)
Speed slider 0–365 days per second (default 1 d/s ≈ real time) with quick chips.
Date picker spanning 1800–2050 — the whole system snaps to true positions, and picking a date pauses the sim.
Now returns to today;  1969 jumps to July 20, 1969 — the Moon sits exactly where Apollo 11 found it.
 Timeline of the Solar System
A dock button opens a filterable timeline of 30 major events — from the Big Bang and the Sun's birth, through the formation of the planets and the Late Heavy Bombardment, to Sputnik, Apollo 11, Voyager, and Artemis.

 Brightness
A 40–200% slider in the controls panel brightens or dims the whole system — turn it up to spot faint planets, or down for a darker space night. It scales the Sun's light and ambient sky together, so planets keep their day/night shading.

 Mission Guide
A glowing "?" button opens a full instruction guide with an at-a-glance "You can…" list, step-by-step weapon instructions with exact damage math, and pro tips.

 Visuals
Real day/night terminator lighting — the Sun is the only light source; Earth's night-side city lights glow on the dark hemisphere.
The Sun is a granulated photosphere with a compact corona (kept inside Mercury's orbit so the innermost planet never drowns in glare).
Drifting cloud layers on Earth and Venus, atmosphere glow shells, Saturn's and Uranus's rings on their true axial tilts, and a starfield + nebula backdrop.
Boot sequence, animated toasts, glassmorphism UI, and cinematic slow-motion effects.
Controls cheat sheet
Action	How
Rotate view	Drag
Zoom	Scroll
Select / follow a planet	Click it (or its legend row)
Moon dossier	Click the Moon
Comet	Click it (or its legend row)
Open controls	 dock button
Open sandbox	 dock button
Open timeline	 dock button
Help	? button
Back out	Esc (step by step: modal → panels → weapon → selection)



