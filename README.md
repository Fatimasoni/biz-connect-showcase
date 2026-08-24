# The Biz Connect Showcase 2026

Event site for the Business Expo presented by Anjuman-e-Saifee Chicago
with Al-Tijaarat al-Raabehah Chicago.

**4–6 December 2026 · 25–27 Jumadal Ukhra 1448**
Compass Arena, 625 Joliet Road, Willowbrook, IL 60527

Single static file: `index.html`. No build step, no dependencies.
Registration is the embedded JotForm at `#register`.

## Link preview

`og.jpg` (1200×630) is the WhatsApp / social preview card.
Regenerate it from `og-card.html`:

    "/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" \
      --headless=new --window-size=1200,630 --virtual-time-budget=8000 \
      --screenshot=og.png file://$PWD/og-card.html
    sips -s format jpeg -s formatOptions 86 og.png --out og.jpg
