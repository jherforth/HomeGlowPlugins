# Family Lists — user guide

One widget for all the household's shared lists. It lives on the
dashboard like any other widget: install it, add it to a tab, and every
display in the house sees the same lists.

## List types

Create a list from one of two templates. The template controls which
fields the add form shows:

- **Grocery** — quantities, units, store sections, and freeform store
  tags. This is the default first list.
- **Custom** — freeform checklist with an optional category.

Switch lists with the tabs at the top of the widget.

## Grocery sections

A grocery item belongs to one store section: Produce, Dairy, Meat &
Seafood, Bakery, Pantry, Frozen, Household, or Other. When you add an
item without picking a section, the widget guesses from the name
("chicken thighs" → Meat & Seafood, "oat milk" → Dairy); anything it
cannot place lands in Other. Guessing prefers multi-word phrases
("ice cream" → Frozen), then the head noun of the phrase, so
"avocado oil" lands in Pantry and "apple crisps" in Pantry rather
than Produce. A wrong guess is fixed by hand with the
section picker in the item's edit dialog.

- **Group by section** (list editor, grocery lists only): an optional
  per-list toggle. When it is on, items render under their section
  headers, in store-walk order; when it is off, the list shows flat
  in its current order. The toggle is saved with the list.
- **Entry order** is the default sort: items show in the order they
  were added, or the order Rearrange left them in.
  A–Z and Recently added are also available; when grouping is on,
  they apply within each section.
- **Rearrange** (list editor): tap Rearrange for ↑ / ↓ buttons on
  every row — the way to reorder, on touch and mouse alike.
  ↑ moves the item one step up, ↓ one step down —
  within its section when Group by section is on, across the
  whole list when it is off. Moves save immediately; there is
  no undo. While rearranging, the sort is entry order so the
  rows on screen are the order being edited; tap Done to leave
  rearrange mode. Moving an item to another section stays on the
  section picker in the edit dialog.

Custom lists have no sections: they sort
by entry order, A–Z, or Recently added.

## Adding and managing items

These actions live in the list editor; the list view offers check-off and
quick-add only (see The list view and the list editor below).

- **Add:** in the list editor, tap + Add item to open the add dialog, type in the name
  box, and press Add item. Quantity parsing works from the name
  alone: `2x milk`, `2 lbs chicken`, `2 cups of flour` all split
  into quantity, unit, and name. Fill in Qty / Unit / Section /
  Store explicitly when you want finer control (grocery), or
  Category (custom). Cancel, Esc, or tapping outside the dialog
  discards the draft. In the list view, tap + Add for the minimal
  quick-add dialog (name box with the same quantity parsing, plus a
  quantity field only); grocery sections are guessed from the name.
- **Check / uncheck:** tap the checkbox. Checking the last unchecked
  item celebrates the finished list (if celebrations are on).
- **Uncheck all:** unchecks every checked item in the current list
  without deleting anything. Use it when a batch of items got checked
  by mistake.
- **Edit:** tap the pencil to open the same dialog prefilled with
  the item, change it, and Save changes (or Cancel). The section
  picker shows the section the item currently renders under.
  Switching tabs cancels an in-progress edit.
- **Rename list:** tap ✎ Rename list, edit the name in place, and
  press Enter (or Save name) to save, Esc (or Cancel) to keep the old
  name. Only the name changes — the list keeps its identity, so its
  items, filters, and history are untouched. Empty names are ignored.
- **Remove:** tap ✕ twice — the first tap asks for confirmation, the
  second removes the item. Checked items are never deleted in bulk:
  they stay until you remove them individually or delete the whole
  list. There is no undo — every removal is an explicit two-tap act.
- **Delete list:** two-tap confirm. You always retain at least one list;
  deleting the only list just tells you so.
- **Bulk add:** inside the add dialog — one item per line, same
  quantity parsing as single add; grocery sections are guessed.

## Finding things

These controls live in the list editor; the list view has none of them.

- **Search** covers item names, categories, and stores.
- **Sort** by entry order (the default), A–Z, or recently added.
  Entry order shows the list's own order; Recently added shows
  newest first by creation time — the reverse of entry order when
  nothing was ever reordered, and different from it otherwise.
- **Store filter** lists only the stores already used on that list.
  Stores are freeform tags you type yourself — there is no preset
  retailer list, and a store typed once becomes
  filterable and suggested from then on.

## The list view and the list editor

The widget has two screens. The dashboard widget always shows the list
view; the list editor is a separate screen reached from the widget's settings gear.

- **The list view** (the dashboard widget): a title row — "Family Lists"
  on the left, + Add and a settings gear upper right — with the list
  tabs on their own row below, and condensed
  one-line rows
  (quantity + name, plus a small store label when a store is set).
  The header title is always plain "Family Lists" — the 🛒 cart emoji
  appears after the grocery list's own tab name instead ("Grocery 🛒"),
  never in the header, and no tab carries a type suffix: grocery tabs
  read "<Name> 🛒", custom tabs read just "<Name>". A new grocery
  list defaults to the name "Grocery" (editable in the dialog, and
  existing lists are never renamed). Switching the new-list template
  to Custom clears that default "Grocery" name; a name you typed
  yourself is never cleared by switching templates.
  Checkboxes work here — tap one to check or uncheck. Checked items
  stay visible, struck through. There is no
  search, sort, store filter, or any delete/rename/new-list control
  in the list view: it is for using the list, not editing it. + Add opens
  a minimal quick-add dialog: name box (quantity parsing still
  applies, so `2 lbs chicken` splits quantity + unit) plus a
  quantity field only. New grocery items get their section guessed
  from the name. Tapping a row name does nothing — there is no edit
  on the wall. When Group by section is on, the list view shows the section
  headers too, compact.
- **The list editor**: the full UI described above — all header controls,
  the full add/edit dialog (every field per template), bulk add,
  the Group-by-section toggle, Rearrange mode, rename,
  sort, filters, and delete flows. The header button becomes
  a back arrow (⬅️) that returns to the list view.

Tap the settings gear (upper right of the widget) to open the list
editor; in the list editor that same header button is a back arrow (⬅️)
that returns to the list view. A `?view=manage` widget URL opens the editor for that load, and
a `?view=simple` URL param forces the list view the same way. Every fresh
load shows the list view unless a view param is present — no screen is
remembered, so a stale saved preference can never flip the
dashboard to the editor.

The widget also reflows with its dashboard size: narrow widgets get
compact rows, wide widgets get roomier rows and larger touch
targets, so the same widget reads well at any dashboard size.

## Settings (household)

- **How often to check for changes (seconds)** — default 10, minimum 5.

## How updates work

The widget polls its stored document every few seconds, so a change
made on another display appears without reloading. Polling never
clobbers an edit you are typing. If two displays edit at the same
time, the last write wins — there is no merge, so avoid editing the
same list on two screens at once.

## Storage contract (for tinkerers)

The widget uses the HomeGlow plugin storage API, key `lists`:

```json
{
  "version": 1,
  "lists": [
    {
      "id": "…", "name": "Groceries", "type": "grocery",
      "groupSections": false,
      "items": [
        {
          "id": "…", "name": "Example item", "qty": 1, "unit": "",
          "category": "Produce",
          "store": "",
          "checked": false, "checkedAt": null,
          "createdAt": "…", "source": "manual"
        }
      ]
    }
  ],
  "updatedAt": "…"
}
```

Item `source` is a short tag naming where the item came from (for example `manual` or `import`).
Anything writing to this key must use this same document shape — never a
private format — and must set `updatedAt` when it writes. The widget
never auto-saves a default document over a failed storage read: if
storage is unreachable at boot, the default list stays in memory
only until storage recovers. Unknown fields on read (from older
versions or other writers) are ignored, and a list whose template no
longer exists renders as a custom list.

## Installing

- **From the store (once merged upstream):** Admin Panel → Browse and
  contribute plugins → install Family Lists, then add it to a tab.
- **Manually:** upload `FamilyLists.html` via the Admin Panel's widget
  upload. The widget needs no server changes and declares
  `"storage": true` in its manifest, which is what allows it to save
  lists.
