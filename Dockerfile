# Aadidev's 3-D Space Sim — static site container.
# The whole sim is one HTML file plus its bundled NASA-derived planet textures
# (assets/), served by nginx. No internet access is needed at runtime:
# planet surfaces are fully detailed offline too. Three.js itself loads from
# a CDN, so the very first page load still wants a network connection.

FROM nginx:1.27-alpine

# Serve the sim at the site root
COPY solarsystem.html /usr/share/nginx/html/index.html
COPY assets /usr/share/nginx/html/assets/
COPY nginx-default.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
  CMD wget -q -O /dev/null http://127.0.0.1/ || exit 1
