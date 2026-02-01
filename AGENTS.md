# AGENTS.md

## Repository Purpose

This repository hosts **Aritra Ghosh's personal portfolio website** - a Jekyll-based static site deployed on GitHub Pages at [aritraghosh.me](https://aritraghosh.me). The site serves as a professional online presence showcasing:

- Professional bio and career information (Senior Product Manager at Microsoft AKS)
- Blog posts on technology, product management, and personal interests
- Work experience and portfolio
- Recommendations and testimonials
- Contact information

## Technology Stack

- **Jekyll 3.9.3** - Static site generator
- **Kramdown** - Markdown parser with GitHub Flavored Markdown support
- **GitHub Pages** - Hosting platform
- **Custom Domain** - aritraghosh.me (configured via CNAME)
- **Google Analytics** - Traffic tracking (G-L001SGM272)

## Repository Structure

```
aritraghosh.github.io/
├── _config.yml           # Jekyll configuration
├── _layouts/             # HTML templates (default.html, post.html)
├── _posts/               # Blog posts in Markdown format
├── _site/                # Generated static site (auto-generated, don't edit)
├── about/                # About page
├── blog/                 # Blog listing and RSS feed
├── contact/              # Contact page
├── css/                  # Stylesheets
├── images/               # Image assets
├── js/                   # JavaScript files
├── projects/             # Projects showcase
├── recommendations/      # Recommendations section
├── talks-writing/        # Talks and writing samples
├── work/                 # Work experience pages
├── index.html            # Homepage
├── CNAME                 # Custom domain configuration
└── Gemfile               # Ruby dependencies
```

## Best Practices

### 1. Content Management

**Blog Posts:**
- Create new posts in `_posts/` directory
- Follow naming convention: `YYYY-MM-DD-title-slug.md`
- Include YAML front matter with `layout`, `title`, `date`, and optional `categories`/`tags`
- Use Kramdown Markdown syntax
- Example front matter:
  ```yaml
  ---
  layout: post
  title: "Your Post Title"
  date: 2026-02-01
  categories: [technology, product-management]
  ---
  ```

**Images:**
- Store all images in `/images/` directory
- Use descriptive filenames
- Optimize images for web (compress before uploading)
- Reference images using relative paths: `../images/image-name.jpg`

**Pages:**
- Each section has its own directory with an `index.html`
- Maintain consistent layout using Jekyll templates
- Use YAML front matter to specify layout and page title

### 2. Code Quality

**HTML/CSS:**
- Maintain semantic HTML structure
- Keep CSS organized in `/css/main.css`
- Preserve dark mode functionality (uses localStorage)
- Ensure responsive design principles

**Jekyll Configuration:**
- Don't modify `_config.yml` without testing locally first
- Maintain permalink structure: `/blog/:year/:month/:day/:title`
- Keep `baseurl` empty for root domain hosting

**Version Control:**
- Write descriptive commit messages
- Don't commit the `_site/` directory (it's auto-generated)
- Test changes locally before pushing to main branch

### 3. Design Consistency

- Preserve existing dark/light mode toggle functionality
- Maintain consistent navigation across all pages
- Keep professional tone and branding
- Use existing color scheme and typography

### 4. SEO and Analytics

- Maintain Google Analytics tracking code
- Use descriptive page titles and meta descriptions
- Keep CNAME file unchanged (aritraghosh.me)
- Update sitemap when adding new pages

## Testing Instructions

### Local Development Setup

1. **Install Ruby and Bundler** (if not already installed):
   ```bash
   # macOS (using Homebrew)
   brew install ruby
   gem install bundler
   ```

2. **Navigate to repository**:
   ```bash
   cd /Users/aritraghosh/Documents/GitHub/aritraghosh.github.io
   ```

3. **Install dependencies**:
   ```bash
   bundle install
   ```

4. **Run Jekyll locally**:
   ```bash
   bundle exec jekyll serve
   ```
   or with live reload:
   ```bash
   bundle exec jekyll serve --livereload
   ```

5. **Access local site**:
   - Open browser to: `http://localhost:4000`
   - Site will auto-rebuild when files are changed (with --livereload)

### Testing Checklist

Before pushing changes:

- [ ] Site builds without errors locally
- [ ] All pages load correctly at localhost:4000
- [ ] Navigation links work properly
- [ ] Dark mode toggle functions correctly
- [ ] Images display properly with correct paths
- [ ] New blog posts appear in blog listing
- [ ] RSS feed validates (if blog posts added)
- [ ] Responsive design works on mobile viewport
- [ ] No broken internal links
- [ ] YAML front matter is valid
- [ ] Markdown renders correctly

### Manual Tests

1. **Blog Post Rendering**:
   - Create test post in `_posts/`
   - Verify it appears in `/blog/`
   - Check permalink works
   - Validate formatting and images

2. **Dark Mode**:
   - Toggle dark mode on/off
   - Refresh page - preference should persist
   - Check contrast and readability

3. **Cross-browser**:
   - Test in Chrome, Safari, Firefox
   - Verify mobile responsiveness

4. **Analytics** (in production):
   - Verify Google Analytics tracking after deployment
   - Check console for any GA errors

## Deployment

### Automatic Deployment

- **Trigger**: Push to `main` branch
- **Platform**: GitHub Pages
- **Build**: Automatic via GitHub Actions (built-in)
- **Live URL**: https://aritraghosh.me
- **Deploy time**: 1-5 minutes after push

### Manual Deployment Verification

After pushing changes:

1. Wait 2-3 minutes for GitHub Pages build
2. Visit https://aritraghosh.me
3. Hard refresh (Cmd+Shift+R) to bypass cache
4. Verify changes are live
5. Check GitHub repository "Actions" tab for build status

### Rollback Procedure

If deployment breaks the site:

```bash
# Revert to previous commit
git revert HEAD
git push origin main

# Or reset to specific commit
git reset --hard <commit-hash>
git push --force origin main
```

## Common Tasks

### Adding a New Blog Post

```bash
# Create new post file
touch _posts/2026-02-01-my-new-post.md

# Add front matter and content
cat > _posts/2026-02-01-my-new-post.md << 'EOF'
---
layout: post
title: "My New Post Title"
date: 2026-02-01
---

Your content here...
EOF

# Test locally
bundle exec jekyll serve

# Commit and push
git add _posts/2026-02-01-my-new-post.md
git commit -m "Add new blog post: My New Post Title"
git push origin main
```

### Updating Homepage Content

1. Edit `index.html`
2. Test locally: `bundle exec jekyll serve`
3. Verify at http://localhost:4000
4. Commit and push changes

### Adding New Section

1. Create directory: `mkdir new-section`
2. Create index: `touch new-section/index.html`
3. Add front matter and content
4. Update navigation in `_layouts/default.html`
5. Test locally and deploy

## Troubleshooting

**Build Fails Locally:**
- Check Ruby version: `ruby --version` (should be 2.7+)
- Reinstall gems: `bundle install`
- Clear cache: `bundle exec jekyll clean`

**Dark Mode Not Working:**
- Check browser localStorage is enabled
- Verify JavaScript in `_layouts/default.html` is intact
- Clear browser cache

**Images Not Displaying:**
- Verify image path is correct (relative to page)
- Check image exists in `/images/` directory
- Ensure proper file extension case

**Changes Not Live on GitHub Pages:**
- Check Actions tab for build errors
- Wait full 5 minutes for deployment
- Hard refresh browser (clear cache)
- Verify push reached `main` branch

## File Modification Guidelines

### ✅ Safe to Edit:
- `_posts/*.md` - Blog content
- `index.html` - Homepage content
- `about/index.html` - About page
- `work/*.html` - Work experience
- `css/main.css` - Styling
- `images/*` - Image assets

### ⚠️ Edit with Caution:
- `_config.yml` - Site configuration (test locally first)
- `_layouts/*.html` - Templates (affects all pages)
- `Gemfile` - Dependencies (may break build)

### 🚫 Don't Edit:
- `_site/*` - Auto-generated by Jekyll
- `CNAME` - Custom domain configuration
- `.git/*` - Version control data

## Additional Resources

- [Jekyll Documentation](https://jekyllrb.com/docs/)
- [GitHub Pages Documentation](https://docs.github.com/en/pages)
- [Kramdown Syntax](https://kramdown.gettalong.org/syntax.html)
- [Markdown Guide](https://www.markdownguide.org/)

---

**Last Updated:** February 1, 2026
**Maintained By:** Aritra Ghosh
