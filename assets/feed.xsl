<?xml version="1.0" encoding="utf-8"?>
<!--
  feed.xsl — Transforms the Atom RSS feed into a readable HTML page in the browser.
  When a reader visits /feed.xml, they see a styled subscription page instead of raw XML.
  RSS reader apps (Feedly, Inoreader, etc.) ignore this stylesheet and consume the XML directly.
-->
<xsl:stylesheet version="3.0"
  xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:atom="http://www.w3.org/2005/Atom">

  <xsl:output method="html" version="1.0" encoding="UTF-8" indent="yes"/>

  <xsl:template match="/">
    <html xmlns="http://www.w3.org/1999/xhtml" lang="en">
      <head>
        <meta charset="UTF-8"/>
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title><xsl:value-of select="/atom:feed/atom:title"/> — RSS Feed</title>
        <style>
          *, *::before, *::after { box-sizing: border-box; margin: 0; padding: 0; }

          body {
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, sans-serif;
            background: #f8fafc;
            color: #1e293b;
            line-height: 1.6;
            min-height: 100vh;
          }

          .page {
            max-width: 740px;
            margin: 0 auto;
            padding: 2.5rem 1.25rem 4rem;
          }

          .rss-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.4rem;
            background: #f97316;
            color: #fff;
            font-size: 0.75rem;
            font-weight: 700;
            letter-spacing: 0.06em;
            padding: 0.25rem 0.75rem;
            border-radius: 9999px;
            margin-bottom: 1.25rem;
            text-transform: uppercase;
          }

          .feed-title {
            font-size: 1.875rem;
            font-weight: 800;
            margin-bottom: 0.5rem;
          }

          .feed-description {
            color: #64748b;
            margin-bottom: 0.75rem;
            font-size: 1rem;
          }

          .feed-url {
            display: inline-block;
            font-size: 0.8rem;
            font-family: "SF Mono", "Fira Code", Consolas, monospace;
            background: #e2e8f0;
            color: #475569;
            padding: 0.35rem 0.75rem;
            border-radius: 0.375rem;
            margin-bottom: 0.75rem;
            word-break: break-all;
          }

          .how-to {
            background: #eff6ff;
            border: 1px solid #bfdbfe;
            border-radius: 0.625rem;
            padding: 1rem 1.25rem;
            margin: 1.5rem 0;
            font-size: 0.875rem;
            color: #1e40af;
          }

          .how-to strong { font-weight: 600; }

          hr {
            border: none;
            border-top: 1px solid #e2e8f0;
            margin: 2rem 0;
          }

          .section-label {
            font-size: 0.7rem;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 0.08em;
            color: #94a3b8;
            margin-bottom: 1rem;
          }

          .entry {
            display: flex;
            gap: 1rem;
            padding: 1.1rem 0;
            border-bottom: 1px solid #e2e8f0;
            align-items: flex-start;
          }

          .entry:last-child { border-bottom: none; }

          .entry-date {
            font-size: 0.75rem;
            color: #94a3b8;
            min-width: 80px;
            padding-top: 0.2rem;
            font-weight: 500;
          }

          .entry-title {
            font-size: 1rem;
            font-weight: 600;
            color: #1e293b;
          }

          .entry-title a {
            color: inherit;
            text-decoration: none;
          }

          .entry-title a:hover {
            color: #2563eb;
            text-decoration: underline;
          }

          .entry-summary {
            font-size: 0.875rem;
            color: #64748b;
            margin-top: 0.25rem;
            line-height: 1.55;
          }

          .back-link {
            display: inline-flex;
            align-items: center;
            gap: 0.35rem;
            font-size: 0.875rem;
            color: #64748b;
            text-decoration: none;
            margin-top: 2rem;
          }

          .back-link:hover { color: #2563eb; }
        </style>
      </head>

      <body>
        <div class="page">

          <div class="rss-badge">
            <svg width="12" height="12" viewBox="0 0 24 24" fill="currentColor">
              <path d="M6.18 15.64a2.18 2.18 0 0 1 2.18 2.18C8.36 19.01 7.38 20 6.18 20C4.98 20 4 19.01 4 17.82a2.18 2.18 0 0 1 2.18-2.18M4 4.44A15.56 15.56 0 0 1 19.56 20h-2.83A12.73 12.73 0 0 0 4 7.27V4.44m0 5.66a9.9 9.9 0 0 1 9.9 9.9h-2.83A7.07 7.07 0 0 0 4 12.93V10.1z"/>
            </svg>
            RSS Feed
          </div>

          <h1 class="feed-title">
            <xsl:value-of select="/atom:feed/atom:title"/>
          </h1>

          <p class="feed-description">
            <xsl:value-of select="/atom:feed/atom:subtitle"/>
          </p>

          <code class="feed-url">
            <xsl:value-of select="/atom:feed/atom:link[@rel='self']/@href"/>
          </code>

          <div class="how-to">
            <strong>How to subscribe:</strong> Copy the URL above and paste it into any RSS reader —
            <a href="https://feedly.com" target="_blank" rel="noopener noreferrer">Feedly</a>,
            <a href="https://www.inoreader.com" target="_blank" rel="noopener noreferrer">Inoreader</a>, or the built-in reader
            in your email client. New posts will appear automatically.
          </div>

          <hr/>

          <p class="section-label">Latest posts</p>

          <div class="entries">
            <xsl:for-each select="/atom:feed/atom:entry">
              <div class="entry">
                <div class="entry-date">
                  <xsl:value-of select="substring(atom:published, 0, 11)"/>
                </div>
                <div class="entry-body">
                  <div class="entry-title">
                    <a>
                      <xsl:attribute name="href">
                        <xsl:value-of select="atom:link/@href"/>
                      </xsl:attribute>
                      <xsl:value-of select="atom:title"/>
                    </a>
                  </div>
                  <xsl:if test="atom:summary">
                    <p class="entry-summary">
                      <xsl:value-of select="atom:summary"/>
                    </p>
                  </xsl:if>
                </div>
              </div>
            </xsl:for-each>
          </div>

          <a href="/" class="back-link">← Back to blog</a>

        </div>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
