# The Biz Connect Showcase 2026 — project context

Read this first. It carries everything a fresh session needs; the conversation it
came from no longer exists.

## What this is

Event website for a three-day Business Expo.

| | |
| --- | --- |
| Event | The Biz Connect Showcase 2026 |
| Presented by | Anjuman-e-Saifee Chicago, with Al-Tijaarat al-Raabehah Chicago |
| Dates | 4–6 December 2026 · 25–27 Jumadal Ukhra 1448 |
| Venue | Compass Arena, 625 Joliet Road, Willowbrook, IL 60527 |
| Registration | https://form.jotform.com/261984324758066 (embedded on the page) |
| Audience | Dawoodi Bohra business community, North America |

Origin: Aqa Moula (TUS) delivered Mawaaiz Nooraniyah on *Tijaarat Hunar* during
Ashara Mubarak. The event follows from that guidance, with Dua Mubarak.

## Architecture

**One file: `index.html`.** No build step, no dependencies, no framework, no
server-side code. Vanilla HTML/CSS/JS. Deploying is a file copy.

    index.html      the entire site
    og.jpg          1200×630 social / WhatsApp preview card
    img/            venue and Chicago photos — currently empty, placeholders show
    og-card.html    source for regenerating og.jpg (command in README)
    CHANGELOG.md    per-change deploy notes — keep this updated
    README.md       deploy + release-notification conventions

Design tokens are CSS custom properties at the top of `index.html`. Purple/gold
on a purple-biased neutral. Marcellus (display) + Archivo (body) from Google
Fonts — the only external requests besides the JotForm iframe. Icons are an
inline SVG sprite of 32 symbols, not an icon font.

Light theme is the hard default. Dark is opt-in via a nav toggle, saved to
`localStorage` as `bcs-theme`. There is deliberately **no** `prefers-color-scheme`
rule: light was requested regardless of OS setting.

## Hosting — two places at once

1. **Chicago Jamaat portal** — the real home. Hani Anjarwala
   (hani.anjarwala@xcelacore.com) pulls from GitHub and deploys to Kinsta.
2. **GitHub Pages** — https://fatimasoni-jamaat.github.io/biz-connect-showcase/ —
   staging and review only.

The page **auto-detects** host embedding: if anything renders above its own nav
it adds `embedded` to `<html>`, measures the host header, and sets
`--parent-nav-h` itself. In embedded mode the wordmark and theme toggle hide and
the bar slims 70px → 53px, because the portal owns brand and theme. The host
template needs no changes. Force it with `<html class="embedded">`.

## Non-negotiables

- **Never publish images or content without rights.** Venue photos, attraction
  photos and logos are all missing for exactly this reason, and the placeholders
  are designed to look intentional. Do not "solve" this from Google Images,
  Yelp, or the attractions' own sites.
- **Halal listings are religious information, not filler.** Every restaurant came
  from Zabihah (the community-verified directory) carrying a high halal rating,
  and none is listed there as serving alcohol. Do not add a place you cannot
  source. Do not add alcohol-serving venues that merely do "halal on request" —
  not the same thing for this audience. The notice telling readers to confirm
  directly must stay.
- **Verify before asserting.** Every outbound link was checked for HTTP 200
  before shipping. Addresses, drive times and dates were sourced, not recalled.
- **Email: never send from the Albiware work address.** This is a community
  project, not employer work. Personal/community mail goes from
  `fatima.ksoni@gmail.com`. Name the account and confirm before drafting or
  sending anything.
- **Release notes must end with the automated-notification footer** (see
  README.md). Release notes become the body of the email GitHub sends watchers.

## Outstanding — blockers first

1. **The contact email is fake.** `info@bizconnectchicago.com` was invented
   during the build; the domain is unregistered, so mail bounces. Three CTAs
   point at it. `bizconnectchicago.com` was still available as of 2026-08-25 —
   registering it fixes the email and gives the event a real domain.
2. **No pricing.** Attendee and exhibitor cards read "Rates announced soon";
   sponsorship reads "Tiers on request".
3. **No images at all.** Nine slots: 3 venue, 6 Chicago attractions. Filenames
   and licensing guidance in `img/README.md`. Also missing: Anjuman-e-Saifee
   logo, Al-Tijaarat al-Raabehah logo, event wordmark.

**Copy written by Claude that the committee has never approved.** It reads as
finished official copy, which is the risk: the 12 "why attend / why exhibit"
bullets, all 6 FAQ answers, the pass inclusions, and the venue travel times and
parking claims. One FAQ states a policy nobody set ("passes are being planned
around full attendance"). The Mawaiz quote and the honorifics should be read by
someone in the community before wider publication.

**Open decisions:** single-day attendance allowed? food/catering exhibitor track?
hotel room block? separate exhibitor form? speaker lineup? registration deadline?

## Confirmed correct — don't re-litigate

Event name, both calendar dates, venue name and address, the full three-day
programme (day names, themes, focus lines, all twelve highlights, 5:00pm day-one
start), the taglines, the audience list, and the registration form and its
fields. All taken from the organisers' own materials.

## Working notes

- Verify UI changes by rendering with headless Chrome:
  `"/Applications/Google Chrome.app/Contents/MacOS/Google Chrome" --headless=new
  --disable-gpu --hide-scrollbars --window-size=W,H --virtual-time-budget=9000
  --screenshot=out.png "file://..."`. Headless clamps viewport width to about
  500px minimum, so narrower captures mislead — measure with a DOM probe instead.
- Contrast-sweep both themes after any colour change. The site currently passes
  WCAG AA on every text element and icon stroke in both.
- GitHub Pages occasionally stalls "building" for an hour then errors; a fresh
  push clears it.
