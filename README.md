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

## Notification convention

Every GitHub Release cut from this repo **must** end with the standing footer:

> **This is an automated notification.** It is generated on every push/release to
> `main` — nobody typed it, and no reply is needed. If something here needs
> discussion, contact Fatima directly rather than replying to this message.

Release notes become the body of the email GitHub sends to anyone watching the
repo, so the footer is what tells recipients the message is machine-generated.
Do not omit it.
