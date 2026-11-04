#!/bin/bash
# Publikasi Squeek Pulse: repo publik blustackk/squeek-pulse + GitHub Pages (domain squeek.blu-stack.com).
# Jalankan: bash /root/squeek-pulse/publish.sh
set -e
cd /root/squeek-pulse
if [ ! -d .git ]; then
  git init -q -b main
  git config user.name blustackk
  git config user.email blustackk@users.noreply.github.com
  git add -A
  git commit -q -m "Squeek Pulse: live Squeekchain stream-game dashboard

Co-Authored-By: Claude Fable 5.1 <noreply@anthropic.com>
Claude-Session: https://claude.ai/code/session_01BcPkfkRWgJgvPrQpGrZz8m"
fi
if ! gh repo view blustackk/squeek-pulse >/dev/null 2>&1; then
  gh repo create blustackk/squeek-pulse --public --source . --push \
    --description "Live dashboard for the Squeekchain stream-game on Sepolia" \
    --homepage https://squeek.blu-stack.com
fi
gh api -X POST repos/blustackk/squeek-pulse/pages -f build_type=legacy -f 'source[branch]=main' -f 'source[path]=/' >/dev/null 2>&1 || true
gh api repos/blustackk/squeek-pulse/pages --jq '{status,cname,html_url,https_enforced}'
echo "OK: repo https://github.com/blustackk/squeek-pulse"
