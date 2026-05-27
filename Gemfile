source "https://rubygems.org"

# Jekyll 4.x — use GitHub Actions for deployment (not the github-pages gem)
# which is locked to Jekyll 3.9.x and misses many modern features.
gem "jekyll", "~> 4.3"

# Plugins
group :jekyll_plugins do
  gem "jekyll-feed"       # Auto-generates /feed.xml (RSS)
  gem "jekyll-seo-tag"    # Auto-injects <meta> SEO tags
  gem "jekyll-sitemap"    # Auto-generates /sitemap.xml for Google Search Console
end

# Windows / JRuby compatibility shims — harmless on macOS
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", ">= 1", "< 3"
  gem "tzinfo-data"
end

gem "wdm", "~> 0.1", platforms: [:mingw, :x64_mingw, :mswin]
gem "http_parser.rb", "~> 0.6.0", platforms: [:jruby]
