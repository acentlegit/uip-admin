#!/usr/bin/env bash
set -e

echo "🚀 UIP Admin – Infrastructure Commit Script"
echo "Repo: https://github.com/acentlegit/uip-admin"

# --- sanity checks ---
if [ ! -d ".git" ]; then
  echo "❌ Not a git repository. Run from uip-admin repo root."
  exit 1
fi

ZIP="uip-admin.zip"

if [ ! -f "$ZIP" ]; then
  echo "❌ $ZIP not found in repo root."
  echo "Place $ZIP in this directory before running."
  exit 1
fi

if [ -n "$(git status --porcelain)" ]; then
  echo "❌ Working tree not clean."
  echo "Commit or stash existing changes first."
  exit 1
fi

# --- extract ---
echo "📦 Extracting $ZIP..."
unzip -o "$ZIP"

# --- cleanup ---
rm -f "$ZIP"

# --- show status ---
echo ""
echo "📋 Files to be committed:"
git status --short

# --- stage only infra + api artifacts ---
echo ""
echo "➕ Staging files..."
git add .github Dockerfile docker-compose.yml helm openapi

# --- commit ---
echo ""
echo "📝 Creating commit..."
git commit -m "chore(infra): add CI, Docker, Helm charts, and OpenAPI spec"

# --- done ---
echo ""
echo "✅ Commit complete."
echo "Next step:"
echo "  git push origin main"

