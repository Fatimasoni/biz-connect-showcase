# Changelog

> **Automated notice.** Entries here, and the release emails generated from them,
> are produced automatically on every push to `main`. Nobody types them
> individually and no reply is expected. If something needs discussion, contact
> Fatima directly.

Every change to the site, newest first. Each entry says what changed and
whether anything is needed at deploy time.

The site is a **single static file** — `index.html` — plus `og.jpg` and the
contents of `img/`. There is no build step, no dependencies and no server-side
code. Deploying is a straight file copy.

**Deploy = pull `main` and copy these to the web root:**

    index.html
    og.jpg
    img/            (whole folder)

`og-card.html`, `README.md`, `img/README.md` and this file are source/docs only
and do not need to be served (harmless if they are).

---

## Unreleased

### Two versions of the site — IMPORTANT FOR DEPLOY
The site is now two files. `index.html` is the **attendee version** and is the
only one published to `bizconnectchicago.org`. `exhibitors.html` is the previous
full version, byte-identical at the point of the split, and is what the Chicago
Jamaat portal should deploy.

`_config.yml` excludes `exhibitors.html` from the published GitHub Pages site, so
it is present in the repository but not reachable on the public domain. The same
exclude list also stops the internal docs being served — `CLAUDE.md` and the rest
were previously readable at the public URL.

**Deploy note for the portal:** deploy `exhibitors.html` (rename it to
`index.html` at the web root, or serve it directly). Deploying `index.html` from
this repository to the portal would publish the attendee version.

**Keeping them in step:** roughly two-thirds of the two files is shared — venue,
dates, programme, Around Chicago, halal dining, FAQ. A correction to any of that
has to be made twice. `diff index.html exhibitors.html` shows what is
intentionally different.

**What differs in the attendee version:** the Mawaaiz quote is removed (it could
not be reworded without misquoting); `Mumineen`, `Bohra` and `Dawoodi` are gone;
the "Why exhibit" card, the Exhibitor and Sponsor passes, the whole sponsorship
band and two exhibitor FAQ answers are removed; the nav item reads Tickets; and
the attendee pass now carries **$5 presale, $10 at the door**. The presenting
organisations stay. Grid containers that lost children were switched to a single
column so the remaining content is not stranded at half width.

**Not resolved:** the embedded JotForm is a *Vendor Interest Form* for exhibitors
with booth pricing — it is the wrong form for an attendee-only site, and no
attendee form exists yet. The attendee version should not be published until that
is sorted.

### Embedded mode for the Jamaat portal — IMPORTANT FOR DEPLOY
The page now adapts when it is hosted inside another site.

**The host template needs no changes at all.** On load the page checks whether
anything renders above its own nav. If so it switches to embedded mode and
measures the host header itself, setting `--parent-nav-h` automatically. That
value offsets the sticky bar and every in-page anchor so headings never land
behind the combined header. Re-measured on resize.

To force it either way: `<html class="embedded">` turns it on regardless.

**In embedded mode:** the Biz Connect wordmark and theme toggle are hidden (the
portal owns brand and theme), the bar slims from 70px to 52px, and the hero
padding tightens. Standalone rendering is unchanged.

**Also:** nav `z-index` dropped 60 → 40 so the portal's nav always wins a
collision. Added a skip-to-content link, a `<main>` landmark and
`aria-label="Showcase sections"` on the nav — with two navs on the page, keyboard
and screen-reader users previously had no way past ~15 links or to tell the two
navigations apart.

### Halal dining near the venue
Split the halal list into two groups: six sit-down restaurants within about
5&ndash;22 minutes of Compass Arena (Willowbrook and Naperville), and the
existing city options below them. Each near-venue card carries cuisine, drive
time, street address and a Google Maps link for directions and phone.

All entries are sourced from Zabihah, the community-verified halal directory,
and none is listed there as serving alcohol. Card layout switched to CSS grid
rows so titles and links align across a row regardless of address length.

### Around Chicago section
New `#chicago` section between the venue and sponsorship band: six things to see
and do with official booking links, plus a halal dining list.

**Deploy note:** adds six more image slots in `img/` —
`chicago-artinstitute.jpg`, `chicago-skydeck.jpg`, `chicago-rivercruise.jpg`,
`chicago-millennium.jpg`, `chicago-msi.jpg`, `chicago-navypier.jpg`. All show
patterned placeholders until supplied. Filenames and licensing guidance are in
`img/README.md`.

**Also in this change:** the nav gained an item and started wrapping at ~1024px,
so nav elements are now `white-space: nowrap`, the duplicate "Register" text link
was removed (the button covers it), and the mobile breakpoint moved from 900px to
1040px.


---

## 2026-08-24

### Venue photo gallery — `49ce659`
Replaced the single decorative panel in the venue section with three photo
slots: a large one beside the venue facts, and two smaller ones below.

**Deploy note:** this adds a new **`img/` folder**. Make sure it is copied to
the web root or the slots will 404. The folder currently contains only
`README.md` — no photos yet.

Until a photo exists, each slot shows a patterned placeholder reading
"Photograph to come". Dropping a correctly named file into `img/` makes it
appear automatically — no code change:

| File | Slot | Guidance |
| --- | --- | --- |
| `venue-exterior.jpg` | Large panel | Landscape 4:3, 1600px+ |
| `venue-floor.jpg` | Lower left | Landscape 3:2, 1200px+ |
| `venue-dining.jpg` | Lower right | Landscape 3:2, 1200px+ |

### Light theme by default, opt-in dark switch — `e8959e0`
Removed the `prefers-color-scheme` media query so the site no longer follows the
visitor's OS theme. Light is now always the default. Added a moon/sun button in
the nav that switches to dark and remembers the choice in `localStorage` under
the key `bcs-theme`.

**Deploy note:** a small inline script now runs in the document head *before*
the stylesheet, to stamp the theme before first paint. If your pipeline moves,
defers or minifies scripts, keep that one inline and in place — moving it causes
a white flash for anyone who has chosen dark.

### WhatsApp / social preview card — `04d4926`
Added `og.jpg` (1200×630, 133 KB) and the full set of `og:image` tags so links
preview properly when shared.

**Deploy note:** `og.jpg` must be served from the web root. The card is
regenerated from `og-card.html` — the command is in `README.md`.

**Action needed on domain change:** three tags hardcode the current host —
`og:url`, `og:image` and `og:image:secure_url`. When the site moves to its real
domain these must be updated or link previews will keep pointing at the old
address.

### Favicon, description and Open Graph tags — `6c9e371`
Added an inline SVG favicon (data URI, no file), a meta description, and
Open Graph / Twitter card tags.

### Initial site — `6b815ea`
First build. Sections: hero with countdown, vision, who attends, why attend /
why exhibit, three-day programme, passes, embedded registration form, venue,
sponsorship, FAQ, footer.

**Deploy notes:**
- The registration section embeds the JotForm at
  `https://form.jotform.com/261984324758066` in an iframe. The host must allow
  outbound framing of `form.jotform.com`; JotForm sends no `X-Frame-Options` or
  `frame-ancestors`, so it embeds fine.
- Fonts load from Google Fonts (`fonts.googleapis.com`, `fonts.gstatic.com`).
  Everything else is self-contained.
- The countdown targets `2026-12-04T09:00:00-06:00`, hardcoded in the script.

---

## Known placeholders

These are wrong on the page today and will change:

- **Contact email** — `info@bizconnectchicago.com` is a placeholder. The domain
  is unregistered, so mail bounces.
- **Pricing** — attendee and exhibitor cards both read "Rates announced soon".
- **Sponsorship tiers** — "Tiers on request".
- **Venue photos** — all three slots empty.
- **Logos** — the site has no organisation logos. The nav mark is a generic
  eight-point star drawn in SVG.
