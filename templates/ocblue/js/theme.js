/**
 * OC Blue Theme — theme.js
 * Author: Fyphost | Version: 1.0.0
 */

(function () {
  'use strict';

  /* -------------------------------------------------------
     1. Navbar scroll effect
     Adds `.scrolled` class when user scrolls more than 50px
  ------------------------------------------------------- */
  function initNavbarScroll() {
    var navbar = document.querySelector('.modern-navbar');
    if (!navbar) return;

    function onScroll() {
      if (window.scrollY > 50) {
        navbar.classList.add('scrolled');
      } else {
        navbar.classList.remove('scrolled');
      }
    }

    window.addEventListener('scroll', onScroll, { passive: true });
    onScroll(); // Run on load in case page is already scrolled
  }

  /* -------------------------------------------------------
     2. Smooth scroll for anchor links
  ------------------------------------------------------- */
  function initSmoothScroll() {
    document.querySelectorAll('a[href^="#"]').forEach(function (anchor) {
      anchor.addEventListener('click', function (e) {
        var target = document.querySelector(this.getAttribute('href'));
        if (target) {
          e.preventDefault();
          target.scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
      });
    });
  }

  /* -------------------------------------------------------
     3. Animation on scroll (IntersectionObserver)
     Adds `.visible` to `.animate-on-scroll` elements when they
     enter the viewport.
  ------------------------------------------------------- */
  function initScrollAnimations() {
    if (!('IntersectionObserver' in window)) {
      // Fallback: show all animated elements immediately
      document.querySelectorAll('.animate-on-scroll').forEach(function (el) {
        el.classList.add('visible');
      });
      return;
    }

    var observer = new IntersectionObserver(
      function (entries) {
        entries.forEach(function (entry) {
          if (entry.isIntersecting) {
            entry.target.classList.add('visible');
            observer.unobserve(entry.target);
          }
        });
      },
      { threshold: 0.12, rootMargin: '0px 0px -40px 0px' }
    );

    document.querySelectorAll('.animate-on-scroll').forEach(function (el) {
      observer.observe(el);
    });
  }

  /* -------------------------------------------------------
     4. Bootstrap tooltips initialisation
  ------------------------------------------------------- */
  function initTooltips() {
    if (typeof bootstrap === 'undefined' || !bootstrap.Tooltip) return;
    var tooltipEls = document.querySelectorAll('[data-bs-toggle="tooltip"]');
    tooltipEls.forEach(function (el) {
      new bootstrap.Tooltip(el);
    });
  }

  /* -------------------------------------------------------
     5. Auto-dismiss alerts after 5 seconds
  ------------------------------------------------------- */
  function initAutoDismissAlerts() {
    document.querySelectorAll('.alert-dismissible').forEach(function (alertEl) {
      setTimeout(function () {
        if (typeof bootstrap !== 'undefined' && bootstrap.Alert) {
          var bsAlert = bootstrap.Alert.getOrCreateInstance(alertEl);
          if (bsAlert) bsAlert.close();
        } else {
          alertEl.style.transition = 'opacity 0.4s ease';
          alertEl.style.opacity = '0';
          setTimeout(function () {
            alertEl.remove();
          }, 400);
        }
      }, 5000);
    });
  }

  /* -------------------------------------------------------
     6. Active nav link highlighting
     Compares window.location.pathname to each nav link href.
  ------------------------------------------------------- */
  function initActiveNavLinks() {
    var currentPath = window.location.pathname;
    document.querySelectorAll('.modern-navbar .nav-link').forEach(function (link) {
      if (!link.href) return;
      try {
        var linkPath = new URL(link.href, window.location.origin).pathname;
        if (
          linkPath !== '/' &&
          currentPath.startsWith(linkPath) &&
          !link.classList.contains('dropdown-toggle')
        ) {
          link.classList.add('active');
        }
      } catch (e) {
        // Ignore invalid URLs
      }
    });
  }

  /* -------------------------------------------------------
     Init all features on DOMContentLoaded
  ------------------------------------------------------- */
  document.addEventListener('DOMContentLoaded', function () {
    initNavbarScroll();
    initSmoothScroll();
    initScrollAnimations();
    initTooltips();
    initAutoDismissAlerts();
    initActiveNavLinks();
  });
})();
