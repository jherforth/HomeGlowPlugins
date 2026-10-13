# HomeGlow Widget Plugins Directory

This directory stores all uploaded widget HTML files for the HomeGlow app.

## How it works
- When you upload a widget via the Admin Panel, the HTML file is saved here.
- Each widget is a self-contained HTML file (with optional CSS/JS) that will be rendered in a sandboxed iframe in the app.
- The widget registry (`../widgets_registry.json`) keeps track of all uploaded widgets.

## Security
- Only HTML files are allowed.
- Widgets are rendered in sandboxed iframes for isolation and security.

## Manual Management
- You can manually add or remove HTML files here, but it is recommended to use the Admin Panel for consistency.
- If you manually remove a file, also update `widgets_registry.json` to avoid broken entries.

// WIDGET_DEVELOPMENT_GUIDE.md
Reference the widgets readme on the main HomeGlow git repository

---

**Do not delete this README.**

## Plugin manifests

Every widget here carries an embedded manifest so HomeGlow can identify and
describe it:

```html
<script type="application/json" id="homeglow-manifest">
{
  "manifestVersion": 1,
  "id": "guest-wifi",
  "name": "Guest Wi-Fi",
  "version": "1.0.0",
  "description": "One or two sentences on what the widget does and what it needs."
}
</script>
```

- `id` is a lowercase slug (`a-z`, `0-9`, hyphens) and must be unique across
  every plugin in this repo. HomeGlow stores it as the plugin's identity, so a
  collision is rejected at install time.
- `description` is optional and capped at 300 characters. It renders as the
  subtitle on the plugin card in the Admin Panel.
- `name` replaces the filename-derived label in the plugin list.
- `version` is the plugin's version, `major.minor.patch` (see Versions below).

The block is plain JSON in a non-executing `<script>` tag, so it is inert in the
browser and ignored by HomeGlow versions that predate manifest support.

## Versions

Every plugin has a `version`. They all started at `1.0.0` (HomeGlow issue
#273). **Raise it in every change to a plugin**, in the same commit:

- `1.0.0` → `1.0.1` for a fix;
- `1.0.0` → `1.1.0` for something new (a setting, a feature);
- `1.0.0` → `2.0.0` for a change that drops or renames a setting, or needs a
  newer HomeGlow.

HomeGlow's plugin list shows each plugin's version, and next to an installed
plugin says **Up to date** or **Update to 1.1.0**. It compares the installed
copy with this repo's file itself, so an update shows even if the version was
forgotten. The version is what tells people what they are getting.
