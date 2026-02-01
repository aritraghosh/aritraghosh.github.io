#!/bin/bash

# Simple script to run Jekyll locally
# This ensures the correct Ruby and Bundler are used

set -e

echo "🚀 Starting Jekyll local server..."
echo ""

# Use Homebrew Ruby if available
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"

# Check if bundler is installed
if ! command -v bundle &> /dev/null; then
    echo "📦 Installing Bundler..."
    gem install bundler
fi

# Install dependencies if needed
if [ ! -d "vendor/bundle" ]; then
    echo "📦 Installing dependencies..."
    bundle install
fi

# Start the server
echo "✅ Starting server at http://localhost:4000"
echo "   Press Ctrl+C to stop"
echo ""

bundle exec jekyll serve --livereload
