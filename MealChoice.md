# Meal Choice

A calendar week view where each person taps a day and chooses the
meals their parents will pack. It is built for school days, so the
default week is Monday–Friday. Each person chooses independently — a
household with several kids gets one or more picks per kid per day
per meal, not one choice for the house.

Four meals exist — Breakfast, Snack, Lunch, Dinner — each toggleable
from Manage. Lunch is on by default; the others are off until turned
on. Turning a meal off hides it everywhere but keeps its saved picks,
so turning it back on restores them.

## Use it

- **Week view:** the current calendar week, Monday–Friday by default.
  Each day card groups picks by person: one header per person
  (profile picture, or 👤 when none is set, plus their name), with
  that person's meal subgroups beneath it, each labeled with its
  meal (Lunch, Snack, Breakfast, Dinner), with a divider between
  people and a divider between meal subgroups within a person — so it is always clear who chose what for which meal
  without repeating anyone's name. A dash marks a meal nobody has
  chosen yet. Tap a day to choose. Past days are shown greyed out
  and can't be changed. Today is highlighted when it is visible. The week view fits its
  container: it shows "Days to show" consecutive shown days
  starting at the first shown day after today — tomorrow, or
  Monday when tomorrow falls on a hidden weekend day — since
  today's lunch was packed the night before, so today is not what
  needs planning, and there is no separate today card. If the
  forward run from that anchor would cross a Monday-week
  boundary, the spilling days are replaced with previous shown
  days from the start week (going backward from the anchor: today,
  then earlier), so the window stays within one week: 1 day shows
  just that next day, 5 days shows the current week Monday–Thursday
  and next week on Friday. A narrow display still
  shows fewer when the day cards do not fit.
- **Week navigation:** ‹ and › step the window one shown day at a
  time — from Monday, › shows Tuesday, not next Monday. When
  weekends are hidden the steps skip Saturday and Sunday, so Friday
  steps to Monday; when weekends are shown they step calendar days.
  **Tomorrow** resets the week view to the default window
  (tomorrow-anchored, see above). When the window
  holds a single day, the header shows that date alone ("Nov 2,
  2026"), not a range repeating it; multi-day windows show the
  range from the first shown day to the last.
- **Weekends (optional):** Manage has a "Show Saturday and Sunday"
  checkbox, off by default. Turning it on shows all seven days. It is
  a household-wide setting — every display sees the same week shape.
- **Days to show:** Manage has a "Days to show" setting, 1–5,
  default 1. It is the TOTAL number of days the week view shows,
  starting at the first shown day after today: 1 shows just that
  next day, 5 shows that day plus the next 4 shown days,
  backfilled to stay within one week when
  the forward run would cross into next week (see Week view).
  A narrow display still shows
  fewer when the day cards do not fit. Like weekends, it is a
  household-wide setting — every display sees the same window. A
  document saved before this setting existed has no field and
  behaves as 1, the current default.
- **Weekend edge case:** when today is Saturday or Sunday and weekends
  are hidden, tomorrow is Monday of next week, so the window shows
  next week's days (for example Saturday with 1 day shown gives
  next Monday) instead of an empty week.
- **Choose:** in the dialog, pick whose meal you're setting (the
  person chips), then tap options to add or remove them from that
  person's set for the day and meal — a person can pick more than
  one, with no cap. Each tap saves immediately and the person stays
  selected, so several taps accumulate. **Clear choice** empties the
  selected person's set for that day and meal. **Done** closes the
  dialog. When more than one meal is enabled, the dialog has a tab
  per enabled meal; with a single meal enabled there are no tabs.
- **Meals (optional):** Manage has a Meals list — Breakfast, Snack,
  Lunch, Dinner — each with its own checkbox. Lunch is on by default;
  the others are off. Turning a meal on adds a meal subgroup for it
  under each person on each day, alongside the other enabled meals, and a tab for it in the
  choice dialog. Picks are per day per person per meal, and never
  affect other meals' picks. Like weekends, it is a household-wide
  setting — every display sees the same meal rows. Turning a meal off
  hides its picks but keeps them saved, so turning it back on
  restores them. At least one meal stays on.
- **Manage:** the settings page holds, in order: the Week view
  settings (Show weekends, Days to show), the Meals list, the
  **Food options** button (which shows the option count) that opens
  a larger window, then the household users who choose meals. The
  food options themselves live behind that button: add, edit, and
  delete options there. In Manage, the header's top-right buttons
  switch to a single **Back** button that returns to the week view;
  there is no second back button inside Manage. Each option
  has a Meals tag set: check
  any combination of Breakfast, Snack, Lunch, Dinner; Manage shows a
  badge per option (for example Lunch, Snack, or Lunch + Snack). When
  adding an option, typing a name that closely matches a known food
  (banana, sandwich, yogurt, and so on) pre-fills that food's emoji
  as the default — a default only: tap a different emoji anytime and
  your pick sticks, and a name with no close match leaves the emoji
  unset (saving then uses 🍽️, as before). Editing an existing option
  never changes its emoji. An
  option appears in the picker of every meal it is tagged with, and
  never in a meal it isn't tagged with. There is no create-person
  form: Manage lists the household's HomeGlow users (read from the
  household user list, which the plugin's frame token is allowed to
  read) and parents check who chooses meals. Deleting an option is
  two-tap (tap Delete, then Sure?) and clears it from any day and
  meal it was chosen on. Unselecting a user hides them from the week
  view; their past choices stay in the document but are not shown.

## One household selection, on every display

There is exactly one selection of people: the household users
checked in Manage, stored in the shared document as
`selectedUserIds`. Every display shows those people — the week view
and the choice dialog all use the same selection, so
the wall and a phone always agree on who is choosing.

The per-display "On this display" filter is gone: Manage no longer
offers a per-display people section, and a display that once had a
filter set now simply shows the household selection (its stale
filter key is cleared on load and never read). If a display should
show different people, that is a household change — uncheck the user
in Manage and they disappear everywhere; their past choices stay in
the document but are not shown.

## Setup (parents)

1. Open **Manage** and select the household users who choose meals.
   The list comes from the household's HomeGlow users — add or
   rename users in Admin, not here. Nothing is pre-selected: the
   first run has nobody selected on purpose.
2. Add meal options: open **Food options** from Manage — a name, a
   symbol emoji, a color, optionally a picture URL (see below), plus the
   meals each option applies to (check Breakfast, Snack, Lunch,
   Dinner as needed — an option tagged with several meals appears in
   each of those pickers). The emoji auto-fills for known foods as
   you type the name; change it if you like.
3. If you pack weekend meals too, turn on "Show Saturday and
   Sunday" in Manage. Otherwise leave it off — Monday–Friday is the
   default.
4. If kids pick more than lunch, turn on the extra meals in
   Manage's Meals list (for example Snack) and make sure options are
   tagged with those meals — or tag an existing option with another
   meal so it appears in that picker too. Leave a meal off and
   nothing about it appears.
5. That's it. Kids tap a day and tap their meals.

## Pictures and pre-readers

Every option shows a big symbol plus its name, so a child who can't
read yet can still choose: the emoji is the picture, and the text is
there for readers. Color helps too — give each option a distinct color
and the choice is recognizable at a glance. Emoji + text is the v1
answer, and it is enough.

An option can also show a remote picture: put an `http(s)` picture URL
in the option form and it renders instead of the emoji (with the emoji
as fallback if the picture fails to load). Only `http(s)` links are
accepted.

Uploading a picture file from inside the widget is **not** supported
in v1, and that is a platform limit, not an oversight: a plugin
frame's token only covers its own plugin storage, settings, Home
Assistant, and notify routes (no plugin-scoped upload route or SDK
upload method), and plugin storage caps each key at 64 KB, so full
photos stored as data URLs would not fit a whole household document
anyway. Real uploads would need a core change; no proposal is drafted
here — emoji + text (plus an optional remote URL) is the supported
path for now.

## Data model

Plugin storage key `data`:

```json
{
  "version": 1,
  "selectedUserIds": [1, 2],
  "options": [{ "id": "...", "name": "Sandwich", "emoji": "🥪", "color": "#ffb74d", "meals": ["lunch"], "imageUrl": null }],
  "picks": {
    "lunch": { "2026-10-29": { "u1": ["<optionId>", "<optionId>"] } },
    "snack": { "2026-10-29": { "u1": ["<optionId>"] } }
  },
  "enabledMeals": ["lunch"],
  "showWeekends": false,
  "daysToShow": 1,
  "updatedAt": "2026-10-28T00:00:00.000Z"
}
```

Picks are keyed by `"u" + <household user id>`, nested under the
meal id. Dates are local `YYYY-MM-DD`. Each person-slot holds an
array of option ids (no cap); a legacy single id wraps to a
one-element array on load. An option's `meals` is the
configurable set of meals it appears in (any non-empty subset of
`breakfast`, `snack`, `lunch`, `dinner`). Only enabled meals render
rows and tabs, and only enabled meals are written; a disabled meal's
saved picks stay in the document untouched. The widget polls storage
(default every 10 seconds, setting `pollSeconds`) so a choice made
on one display appears on the others; a refresh is skipped while any
dialog is open, and concurrent edits resolve last-write-wins.

**Migration:** documents saved before the week-shape change have no
`showWeekends` field and default to `false` (Monday–Friday), so
existing choices and options are untouched. Documents saved before
meals existed carry the snack-era shape instead — `serves` on options
(`"lunch"`, `"snack"`, or `"both"`), `choices` (lunch picks),
`snackChoices`, and `snackChoicesEnabled` — and migrate on load with
no pick loss: `serves "lunch"` becomes `["lunch"]`, `"snack"`
becomes `["snack"]`, `"both"` becomes `["lunch", "snack"]` (both
predates breakfast/dinner, so it never means all four), and options
with no field become `["lunch"]`; `choices` becomes `picks.lunch`
and `snackChoices` becomes `picks.snack`; a person-slot holding a
single option id (the pre-multi-pick shape) wraps to a one-element
list on load; `snackChoicesEnabled: true`
becomes `enabledMeals: ["lunch", "snack"]`, while absent or false
becomes `["lunch"]`. The next save persists the meals shape. The
plugin was renamed from `LunchChoice.html` (storage key
`lunch-choice`) to `MealChoice.html` (storage key `meal-choice`):
the document is copied across under the new key with every field
intact, so existing documents, options, and picks carry straight
over. Documents saved before the household-users change carry a legacy
`people` array and choices keyed by custom person ids; those are
preserved in the document untouched on save but are no longer
rendered — the meal set is now `selectedUserIds`, and picks render
only for selected household users. The old per-display people filter
is gone: a stale `homeglowMealChoice.displayPeople` key in a
display's localStorage is cleared on load and never read, so a
display that once filtered people now shows the household selection.

## What it doesn't do

No prices, no reminders or due dates (those belong to chores), no
syncing with other apps, and no connection to any other plugin's data.
Plugin storage is isolated per plugin, so this widget cannot read or
share another plugin's notes — including a whiteboard plugin's daily
notes. If a household wants the meal choice written somewhere else,
that is a separate integration, not part of this widget.
