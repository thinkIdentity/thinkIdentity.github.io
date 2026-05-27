# thinkIdentity — Personal Blog

A minimalistic, elegant personal blog built with **Jekyll** and hosted on **GitHub Pages**.  
Live site → **[thinkidentity.github.io](https://thinkidentity.github.io)**

Covers three topics: Identity & Access Management · Birds & Conservation · Sustainable Cities.

---

## Use This as Your Own Blog Template

This repo is structured as a clean, reusable starting point. Fork it, swap the content, and you have a running blog in under 30 minutes.

### Prerequisites

| Tool | Version | Install |
|------|---------|---------|
| Ruby | 3.2+ | `brew install rbenv` then `rbenv install 3.2.8` |
| Bundler | latest | `gem install bundler` |
| Git | any | pre-installed on macOS/Linux |

### Quick Start

```bash
# 1. Fork this repo on GitHub, then clone your fork
git clone git@github.com:YOUR_USERNAME/YOUR_USERNAME.github.io.git
cd YOUR_USERNAME.github.io

# 2. Install dependencies
bundle install

# 3. Start the local server
bundle exec jekyll serve --livereload

# 4. Open in browser
open http://localhost:4000
```

### Make It Yours — 3 Files to Edit

**`_config.yml`** — site identity
```yaml
title: "Your Name"
tagline: "Your tagline here"
author:
  name: "Your Name"
  linkedin: "https://www.linkedin.com/in/your-profile"
url: "https://YOUR_USERNAME.github.io"
```

**`index.html`** — update the hero text and the three pillar cards to match your topics.

**`about.md`** — replace with your own bio.

---

## Writing Posts

Create a file in `_posts/` following the naming convention:

```
_posts/YYYY-MM-DD-your-post-title.md
```

Minimal front matter:

```yaml
---
layout: post
title: "Your Post Title"
date: 2026-06-01
category: iam          # iam | birds | cities (or add your own)
categories: [iam]
tags: [tag1, tag2]
excerpt: "One sentence shown on the home page."
mermaid: true          # only if the post contains Mermaid diagrams
---

Your content here...
```

To work on a draft without publishing it, place it in `_drafts/` (no date needed).  
Preview drafts locally with `bundle exec jekyll serve --drafts`.

---

## Adding a New Topic Section

1. Create `categories/newtopic.md`:
   ```yaml
   ---
   layout: category
   title: "New Topic"
   category: newtopic
   icon: "🌱"
   description: "What this section is about."
   permalink: /categories/newtopic/
   ---
   ```
2. Add a nav entry in `_config.yml` under `nav_links:`.
3. Write posts with `category: newtopic` — they appear automatically.

No other files need to change.

---

## Deploying to GitHub Pages

1. **Rename your repo** to `YOUR_USERNAME.github.io`
2. Go to **Settings → Pages → Source** and select **"GitHub Actions"**
3. Push to `main` — the workflow in `.github/workflows/deploy.yml` deploys automatically

Live in ~2 minutes.

---

## Project Structure

```
├── _config.yml          # Site-wide settings
├── _posts/              # Published posts (YYYY-MM-DD-title.md)
├── _drafts/             # Work-in-progress posts (not published)
├── _layouts/            # HTML page templates
├── _includes/           # Reusable HTML snippets (header, footer, etc.)
├── _sass/               # Modular SCSS stylesheets
├── assets/              # CSS, images, XSL for RSS feed
├── categories/          # One .md file per topic section
├── index.html           # Home page
├── about.md             # About page
└── .github/workflows/   # GitHub Actions deploy pipeline
```

---

## Tech Stack

- [Jekyll 4.x](https://jekyllrb.com/) — static site generator
- [GitHub Pages](https://pages.github.com/) — free hosting
- [Mermaid.js](https://mermaid.js.org/) — diagrams in Markdown
- [Rouge](https://rouge.jneen.net/) — syntax highlighting
- Custom SCSS — no external CSS framework

---

## License

This repository uses a **dual licensing model**:

| What | License | Meaning |
|------|---------|---------|
| **Code** — layouts, templates, SCSS, JavaScript, GitHub Actions workflow | [Apache 2.0](LICENSE) | Free to use, fork, and modify with attribution |
| **Content** — all posts in `_posts/`, images in `assets/images/`, writing in `about.md` | © Tushar Choudhury — All rights reserved | Do not reproduce without permission |

If you fork this repo as a blog template, remove the content from `_posts/` and `assets/images/` and replace it with your own.
