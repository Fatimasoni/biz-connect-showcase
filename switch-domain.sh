#!/bin/sh
# Repoint the canonical URL once bizconnectchicago.org serves the site over HTTPS.
# Do NOT run this while the domain is parked: og:image must be reachable over
# HTTPS or WhatsApp and social previews silently break.
#
# Check first:
#   curl -sSI https://bizconnectchicago.org/ | head -1     # expect 200, no TLS error
#
set -e
NEW="https://bizconnectchicago.org"
OLD="https://fatimasoni-jamaat.github.io/biz-connect-showcase"
sed -i '' "s|$OLD|$NEW|g" index.html
echo "bizconnectchicago.org" > CNAME     # only if GitHub Pages serves the domain
echo "Updated. Tags now pointing at:"
grep -oE 'content="https://[^"]*bizconnect[^"]*"' index.html
echo
echo "Remember: DNS must point at the host, and if GitHub Pages is serving it,"
echo "enable HTTPS in repo Settings > Pages after the DNS check passes."
