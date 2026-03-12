# OC Blue — Modern WHMCS Theme

A modern, clean **white & blue** WHMCS client area theme built with Bootstrap 5, Google Fonts Inter, and a polished card-based UI.

---

## Features

- ✅ **Responsive** — Mobile-first layout powered by Bootstrap 5.3
- ✅ **Modern design** — Clean white & blue colour palette with subtle shadows and rounded corners
- ✅ **Card-based dashboard** — At-a-glance stats, invoices, tickets, and services
- ✅ **Standalone login page** — Animated background shapes, floating-label inputs
- ✅ **Animated elements** — IntersectionObserver scroll animations, hero floating cards
- ✅ **Sticky navbar** — Auto-shadow on scroll, responsive collapse, user avatar dropdown
- ✅ **Bootstrap Icons + Font Awesome 6** — Rich icon set throughout
- ✅ **Google Fonts Inter** — Clean, modern sans-serif typography
- ✅ **WHMCS 8.x+** compatible — Inherits from the `six` parent theme
- ✅ **CSS custom properties** — Easy colour & style customisation via `:root` variables

---

## Installation

1. Copy the `templates/ocblue/` directory into your WHMCS installation:
   ```
   /path/to/whmcs/templates/ocblue/
   ```
2. Log in to your WHMCS admin panel.
3. Navigate to **Setup → General Settings → General**.
4. Under **Template**, select **OC Blue** from the dropdown.
5. Click **Save Changes**.

---

## File Structure

```
templates/ocblue/
├── theme.yaml                    # Theme metadata (parent: six)
├── header.tpl                    # Main header: navbar, breadcrumb, page header, alerts
├── footer.tpl                    # 4-column footer with social links and copyright
├── homepage.tpl                  # Public homepage: hero, features, stats, CTA
├── clientareahome.tpl            # Client dashboard: sidebar, stats, invoices, tickets, services
├── login.tpl                     # Standalone login page with decorative shapes
├── includes/
│   ├── head.tpl                  # <head> meta, fonts, and CSS links
│   ├── navbar.tpl                # Sticky top navbar with user dropdown
│   └── sidebar.tpl               # Client area sidebar with nav links
├── css/
│   └── theme.css                 # Complete custom stylesheet (~900+ lines)
└── js/
    └── theme.js                  # Navbar scroll, animations, tooltips, auto-dismiss alerts
```

---

## Customisation

All colours and design tokens are defined as **CSS custom properties** at the top of `css/theme.css`:

```css
:root {
  --color-primary:       #2563EB;   /* Main blue */
  --color-primary-dark:  #1D4ED8;
  --color-primary-light: #3B82F6;
  --color-success:       #10B981;
  --color-warning:       #F59E0B;
  --color-danger:        #EF4444;
  --font-family: 'Inter', sans-serif;
  /* … more variables */
}
```

To change the primary colour, update `--color-primary` (and the related `--color-primary-*` variants) in `css/theme.css`.

To change the font, swap the Google Fonts import in `includes/head.tpl` and update `--font-family` in `css/theme.css`.

---

## Requirements

- **WHMCS** 8.x or later
- PHP 7.4+ (WHMCS requirement)
- Modern browser (Chrome, Firefox, Edge, Safari)

---

## License

MIT — free to use and modify.

---

## Author

**Fyphost** — [https://fyphost.com](https://fyphost.com)

