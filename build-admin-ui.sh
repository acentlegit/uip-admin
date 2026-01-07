#!/usr/bin/env bash
set -e

echo "🚀 Building UIP Admin UI"

# Ensure we're in the correct directory
if [ ! -f "package.json" ]; then
  echo "❌ Error: Run this script from the admin-ui directory"
  exit 1
fi

# Node version check (optional but recommended)
NODE_VERSION=$(node -v | sed 's/v//')
REQUIRED_MAJOR=18

if [ "${NODE_VERSION%%.*}" -lt "$REQUIRED_MAJOR" ]; then
  echo "❌ Node.js >= 18 required. Found $NODE_VERSION"
  exit 1
fi

echo "✅ Node version OK: $NODE_VERSION"

# Clean install to avoid ghost dependency issues
echo "🧹 Cleaning old dependencies..."
rm -rf node_modules package-lock.json

# Install dependencies
echo "📦 Installing dependencies..."
npm install

# Ensure Vite React plugin exists (hard guard)
if ! npm ls @vitejs/plugin-react >/dev/null 2>&1; then
  echo "➕ Installing missing @vitejs/plugin-react..."
  npm install -D @vitejs/plugin-react
fi

# Type check
echo "🔍 Running TypeScript check..."
npx tsc --noEmit || true

# Build
echo "🏗️ Building production bundle..."
npm run build

# Done
echo ""
echo "✅ Admin UI build complete."
echo "📦 Output directory: dist/"

