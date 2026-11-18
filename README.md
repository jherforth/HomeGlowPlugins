# HomeGlow Plugins

Plugins for [HomeGlow](https://github.com/jherforth/HomeGlow), installed from
**Admin → Plugins** in HomeGlow. Each plugin is a self-contained HTML file that
runs in a sandboxed frame on the dashboard.

## Layout

Each plugin has a folder of its own, inside a folder for its category:

```
household/
  Vacuum/
    Vacuum.html                  the plugin
    Vacuum.png                   its preview in the Admin Panel
    Vacuum.md                    setup notes, when it needs any
    Vacuum-clean-button.yaml     anything else it comes with
chores-rewards/
  Routines/
    Routines.html
    Routines.png
```

- **The category folder is the manifest's `category`**, one of the Admin
  Panel's groups: `clock-calendar`, `news-weather`, `chores-rewards`,
  `family-hub`, `meals`, `household`, `health`, `games`. The Admin Panel groups
  plugins by the manifest, so the two should agree.
- **The plugin's folder is named after its file**, and the preview is the same
  name as a `.png` (or `.jpg`, `.jpeg`, `.webp`) beside it.
- **Never rename a plugin's file once it's published.** An install knows a
  plugin by its file name, so a renamed file arrives as a second plugin.

HomeGlow 1.10 and later list plugins at any depth. Older versions only look at
the top two levels, so they find just
`Update HomeGlow to view plugins.html` at the root, which asks them to update.
Its manifest says `"storeNotice": true`, which keeps it out of the list on 1.10
and later.

Guides: [`docs/WidgetDevGuide.md`](docs/WidgetDevGuide.md) and
[`docs/PhotoFix.md`](docs/PhotoFix.md). The full plugin platform is documented
in HomeGlow's
[plugin development guide](https://github.com/jherforth/HomeGlow/blob/main/docs/guides/plugin-development.md).

## Plugin manifests

Every plugin carries an embedded manifest so HomeGlow can identify and
describe it:

```html
<script type="application/json" id="homeglow-manifest">
{
  "manifestVersion": 1,
  "id": "guest-wifi",
  "name": "Guest Wi-Fi",
  "version": "1.0.0",
  "category": "household",
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
- `category` places it in the Admin Panel, and names its folder here.
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
