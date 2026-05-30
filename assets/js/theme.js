(function () {
  'use strict';

  var STORAGE_KEY = 'theme';
  var DARK = 'dark';
  var LIGHT = 'light';

  // ─── Theme helpers ────────────────────────────────────────────────────────

  function getTheme() {
    return document.documentElement.getAttribute('data-theme') || LIGHT;
  }

  function applyTheme(theme) {
    document.documentElement.setAttribute('data-theme', theme);
    localStorage.setItem(STORAGE_KEY, theme);
    updateToggleButton(theme);
    updateGiscus(theme);
    // Mermaid is handled by mermaid-loader.html which exposes window.reinitMermaid
    if (typeof window.reinitMermaid === 'function') {
      window.reinitMermaid(theme);
    }
  }

  function toggleTheme() {
    applyTheme(getTheme() === DARK ? LIGHT : DARK);
  }

  // ─── Toggle button ────────────────────────────────────────────────────────

  function updateToggleButton(theme) {
    var btn = document.getElementById('theme-toggle');
    if (!btn) return;
    var label = theme === DARK ? 'Switch to light mode' : 'Switch to dark mode';
    btn.setAttribute('aria-label', label);
    btn.setAttribute('title', label);
  }

  // ─── Giscus sync ─────────────────────────────────────────────────────────

  function updateGiscus(theme) {
    var iframe = document.querySelector('iframe.giscus-frame');
    if (!iframe) return;
    iframe.contentWindow.postMessage(
      { giscus: { setConfig: { theme: theme === DARK ? 'dark_dimmed' : 'light' } } },
      'https://giscus.app'
    );
  }

  // Giscus loads asynchronously — sync theme once its iframe appears
  function watchForGiscus(theme) {
    var attempts = 0;
    var interval = setInterval(function () {
      var iframe = document.querySelector('iframe.giscus-frame');
      if (iframe) {
        clearInterval(interval);
        updateGiscus(theme);
      }
      if (++attempts > 20) clearInterval(interval); // give up after ~10s
    }, 500);
  }

  // ─── Scroll: compact header ───────────────────────────────────────────────

  function initScrollBehaviour() {
    var header = document.getElementById('site-header');
    if (!header) return;

    var THRESHOLD = 60;

    function onScroll() {
      if (window.scrollY > THRESHOLD) {
        header.classList.add('scrolled');
      } else {
        header.classList.remove('scrolled');
      }
    }

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll(); // run immediately in case page loads mid-scroll
  }

  // ─── Boot ─────────────────────────────────────────────────────────────────

  document.addEventListener('DOMContentLoaded', function () {
    var btn = document.getElementById('theme-toggle');
    if (btn) btn.addEventListener('click', toggleTheme);

    var currentTheme = getTheme();
    updateToggleButton(currentTheme);

    // If dark mode is active and Giscus is on this page, sync it once loaded
    if (currentTheme === DARK) {
      watchForGiscus(DARK);
    }

    initScrollBehaviour();
  });

  // Expose for external use (e.g. mermaid-loader.html calling getTheme())
  window.blogTheme = { getTheme: getTheme, applyTheme: applyTheme };

}());
