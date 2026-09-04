# Site images

Drop files here with these exact names and they appear on the site automatically —
no code change needed. Until a file exists, its slot shows a patterned panel
reading "Photograph to come".

| Filename | Shows as | Guidance |
| --- | --- | --- |
| `venue-exterior.jpg` | Large panel beside the venue facts | Landscape, 4:3 works best, 1600px wide or more |
| `venue-floor.jpg` | Left of the two smaller panels | Landscape, 3:2, 1200px wide or more |
| `venue-dining.jpg` | Right of the two smaller panels | Landscape, 3:2, 1200px wide or more |

JPG, sRGB, ideally under 500 KB each so the page stays fast. Save at quality
~80 — the panels are cropped with `object-fit: cover`, so the centre of each
photo is what shows.

Please use photographs you have permission to publish. Compass Arena is hosting
the event, so asking them for approved photos or a media kit is usually the
quickest route.

## Around Chicago section

| Filename | Shows as |
| --- | --- |
| `chicago-artinstitute.jpg` | Art Institute of Chicago card |
| `chicago-skydeck.jpg` | Skydeck at Willis Tower card |
| `chicago-rivercruise.jpg` | Architecture River Cruise card |
| `chicago-millennium.jpg` | Millennium Park card |
| `chicago-msi.jpg` | Museum of Science and Industry card |
| `chicago-navypier.jpg` | Navy Pier card |

Landscape, roughly 16:10, 1200px wide or more.

**Sourced from Unsplash, 2026-09-04.** All six are under the
[Unsplash License](https://unsplash.com/license): free for commercial use, no
permission needed, attribution appreciated but not required &mdash; which is why the
page carries no credit line. Each was checked visually to confirm it shows the right
landmark, because keyword search alone is not reliable for specific buildings.

| File | Shows | Unsplash photo id |
| --- | --- | --- |
| `chicago-artinstitute.jpg` | The bronze lion and facade | `1648307650152-cba55874a79d` |
| `chicago-skydeck.jpg` | Looking down from the Ledge | `1687367445745-82f8f077a634` |
| `chicago-rivercruise.jpg` | Tour boat on the river | `1578579351670-1969cf6eaf0a` |
| `chicago-millennium.jpg` | Cloud Gate with the skyline | `1494522855154-9297ac14b55f` |
| `chicago-msi.jpg` | The dome reflected in the lagoon | `1682978107355-f8322d2955cb` |
| `chicago-navypier.jpg` | Centennial Wheel and the boats | `1643147018301-8b2ce3ef278e` |

Re-fetch any of them with:

    curl -o img/<name>.jpg \
      "https://images.unsplash.com/photo-<id>?w=1500&h=940&fit=crop&crop=entropy&q=78&fm=jpg"

**Licensing matters here.** Do not lift photos from Google Images, Yelp or the
attractions' own websites. Free, properly licensed options:

- Unsplash (unsplash.com) and Pexels (pexels.com) — free for commercial use,
  both have good Chicago skyline and landmark sets
- Wikimedia Commons — check each file's licence; most need attribution
- Most attractions run a press/media page with images cleared for promotional use
