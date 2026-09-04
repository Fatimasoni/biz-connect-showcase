# The Biz Connect Showcase 2026 — project context

Read this first. It carries everything a fresh session needs; the conversation it
came from no longer exists.

## What this is

Event website for a two-day Business Expo. It was three days until 2026-09-03,
when Friday 4 December was dropped; see CHANGELOG.md.

| | |
| --- | --- |
| Event | The Biz Connect Showcase 2026 |
| Presented by | Anjuman-e-Saifee Chicago, with Al-Tijaarat al-Raabehah Chicago |
| Dates | 5–6 December 2026 · 26–27 Jumadal Ukhra 1448 |
| Venue | Compass Arena, 625 Joliet Road, Willowbrook, IL 60527 |
| Registration | https://form.jotform.com/261984324758066 &mdash; a **Vendor Interest Form** for exhibitors, with booth pricing. Embedded on `exhibitors.html` only; the attendee page has no registration form and no attendee form exists yet. |
| Audience | Dawoodi Bohra business community, North America |

Origin: Aqa Moula (TUS) delivered Mawaaiz Nooraniyah on *Tijaarat Hunar* during
Ashara Mubarak. The event follows from that guidance, with Dua Mubarak.

## Architecture

**Two files, one per audience.** `index.html` is the attendee version and the only
one published to `bizconnectchicago.org`. `exhibitors.html` is the full version
(exhibitor and sponsorship content, community terminology) for the Jamaat portal.
`_config.yml` keeps `exhibitors.html` and the internal docs out of the published
Pages site. They share about two-thirds of their content, so shared corrections
must be made twice — `diff index.html exhibitors.html` shows the intended
differences.

**Each file is self-contained.** No build step, no dependencies, no framework, no
server-side code. Vanilla HTML/CSS/JS. Deploying is a file copy.

    index.html      the entire site
    og.jpg          1200×630 social / WhatsApp preview card
    img/            3 venue photos present (rights UNCONFIRMED, uncommitted);
                    6 Chicago slots still empty, placeholders show
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

1. **The attendee page has no way to register or pay.** The $5 presale / $10 door
   price is stated, and the "Buy now" button's `href` is a placeholder `#`. There
   is no attendee form; the only JotForm that exists is the exhibitor vendor form.
   Do not publish the attendee page until this is resolved.
2. **`info@bizconnectchicago.org` bounces.** The domain is registered and serving
   the site over HTTPS, but it has no MX records. The address is still the footer
   contact on both versions.
3. **Venue photo rights are unconfirmed.** Three photos are in `img/` but
   uncommitted: they arrived over WhatsApp, one is a screenshot of an Instagram
   story, and the exterior looks like a property listing photo. Ask Compass Arena
   for a media kit rather than publishing these.
4. **The two-day programme has no opening ceremony and no keynote.** Both lived on
   the deleted Friday block, along with the Business Reception Darees and Dinner.
   Day one is now the expo floor and day two the closing sessions.
5. **`og.jpg` says "Where Mumineen businesses meet, grow & thrive".** Both pages
   share this card, so the attendee page &mdash; which has no sect terminology in
   its markup &mdash; still previews with it on WhatsApp.
6. **Six Chicago image slots are still empty**, as are the organisation logos and
   the event wordmark.

**Copy written by Claude that the committee has never approved.** It reads as
finished official copy, which is the risk: the 12 "why attend / why exhibit"
bullets, all 6 FAQ answers, the pass inclusions, and the venue travel times and
parking claims. One FAQ states a policy nobody set ("passes are being planned
around full attendance"). The Mawaiz quote and the honorifics should be read by
someone in the community before wider publication.

**Open decisions:** single-day attendance allowed? food/catering exhibitor track?
hotel room block? separate exhibitor form? speaker lineup? registration deadline?

## Confirmed correct — don't re-litigate

Event name, venue name and address, the day themes and focus lines, the taglines,
the audience list, and the registration form's fields. All taken from the
organisers' own materials.

**No longer true:** the dates and the three-day programme were previously listed
here as confirmed. The event was changed to two days (5&ndash;6 December) on
2026-09-03 at Fatima's instruction, which dropped Friday 4 December, its four
programme items and the 5:00pm day-one start. The countdown now targets
`2026-12-05T09:00:00-06:00`; **the 09:00 start time is an assumption** carried
over from the old Friday target and has not been confirmed.

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
