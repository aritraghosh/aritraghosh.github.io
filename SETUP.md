# Local Development Setup

Quick guide to run this Jekyll site locally on macOS.

## Prerequisites

### Install Homebrew (if not already installed)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Install Ruby via Homebrew
The macOS system Ruby is outdated. Install a modern Ruby:

```bash
brew install ruby
```

Add to your `~/.zshrc`:
```bash
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
```

Then reload your shell:
```bash
source ~/.zshrc
```

## Quick Start

### Option 1: Use the helper script (easiest)

```bash
chmod +x serve.sh
./serve.sh
```

The script will:
- Set up the correct Ruby path
- Install Bundler if needed
- Install all dependencies
- Start the Jekyll server with live reload

### Option 2: Manual commands

```bash
# Install Bundler
gem install bundler -v 2.4.22

# Install dependencies
bundle _2.4.22_ install

# Start the server
bundle _2.4.22_ exec jekyll serve --livereload
```

## Access the Site

Once running, visit: **http://localhost:4000**

The `--livereload` flag auto-refreshes your browser when files change.

## Troubleshooting

### "Cannot load such file" errors

The Gemfile includes gems needed for Ruby 4.0+ compatibility:
- `logger`
- `csv`
- `base64`
- `bigdecimal`

If you encounter missing library errors, run:
```bash
bundle _2.4.22_ install
```

### Permission errors

If you see permission errors, ensure you're using Homebrew Ruby, not system Ruby:
```bash
which ruby
# Should show: /opt/homebrew/opt/ruby/bin/ruby
```

### Port 4000 already in use

Kill any process using port 4000:
```bash
lsof -ti:4000 | xargs kill -9
```

Or specify a different port:
```bash
bundle _2.4.22_ exec jekyll serve --port 4001
```

## Making Changes

- **Blog posts**: Add to `_posts/` with format `YYYY-MM-DD-title.md`
- **Pages**: Edit HTML files in respective directories
- **Styles**: Modify `css/main.css`
- **Layout**: Edit `_layouts/default.html`

Changes auto-reload with `--livereload` flag.

## Deploying

Push to the `main` branch on GitHub. GitHub Pages automatically builds and deploys.

```bash
git add .
git commit -m "Your commit message"
git push origin main
```

Site goes live at https://aritraghosh.me in 1-5 minutes.
