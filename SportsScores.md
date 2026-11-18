# Sports Scores

Scores and schedules for the leagues you pick: NFL, college
football, NBA, MLB, NHL, MLS and the Premier League. Each league is
its own section, with the teams' logos, the score once a game has
started, and the status on the right: the day and time for a game
that has not started, the clock (for example "1:07 - 3rd Quarter"
or "Halftime") while it is on, and "Final" — with "Final (OT)" or
"Final (SO)" where they apply — once it is done. A game involving
one of your favorite teams shows its name in the accent color with
a ★, and a "Live" badge appears at the top while any game you are
shown is in progress. The updated time at the bottom says when the
scores were last checked.

Games are ordered favorites first, then live games, then upcoming
games, then finals (most recent first). "Games shown per league"
caps how many games each league section holds.

## Data sources

Two data sources, selected by the **Data source** setting, which
defaults to TheSportsDB so existing users see no change unless
they opt in:

- **TheSportsDB** (default): the free public key "123" is built
  in. The old free key "3" was retired, so a saved "3" is read as
  "123". One livescore request covers every sport at once; the full
  schedule and results are fetched per league at most once an hour,
  or when a live game ends.
- **ESPN**: keyless, no account needed. One scoreboard request per
  league, mapped onto the same game shape, so the rendering,
  ordering, favorite filter, and status text all work the same.
  The default scoreboard covers today (the current week for
  football); the ESPN path additionally fetches the next 7 days, one
  day at a time, until a league has enough upcoming or live games,
  then up to 2 days back for recent finals when it is still short.
  The **API key** setting is ignored on the ESPN path. ESPN's feed
  is unofficial and undocumented, so it can change without notice
  and carries no SLA — if it goes down, every league shows "Could
  not load scores. Trying again soon." and the updated stamp still
  advances.

Refresh cadence is the same on both sources: while a game is on,
or one starts within 30 minutes, every "Refresh minutes while a
game is on" (default 5, min 2, max 30); otherwise about every 30
minutes, backing off while every request fails (2×, 4×, … up to an
hour).

## Favorite teams

**Favorite teams, comma-separated** takes full names, which find
teams best (for example "Green Bay Packers, Milwaukee Brewers").
Up to 8 names are used. A name matches a game when either team's
name contains it, so "Packers" alone also matches; on the
TheSportsDB path a name is also looked up once a day and taken
only if it is a current team in one of the leagues here. A name
that is not found produces a "Not found" note, and a name found
only in a league that is turned off produces a note saying so —
either way the games already shown are unaffected.

**Show only my teams' games** (on by default) shows just the
favorites' games, grouped under their leagues, when favorite teams
are set. When no favorite teams are set it does nothing, so the
full schedule shows.

## Favorites and live only

**Show only favorite teams' games and live games** (off by
default) shows the union of two sets and hides everything else:

- every game involving a favorite team, whatever its status
  (upcoming, live, or final), and
- every game that is in progress, whatever the teams.

A non-favorite upcoming game and a non-favorite final are hidden.
With no favorite teams set, the first set is empty, so the view
shows live games only. When nothing matches, the widget says "No
favorite or live games right now." instead of showing an empty
list. Like the other filters, it is a household setting — every
display sees the same view.

How it interacts with the other settings:

- **Show only my teams' games:** when favorites-and-live is on,
  it is superseded for live games — a live game from another team
  shows even though it is not one of yours. Turn favorites-and-live
  off to go back to favorites-only.
- **League toggles:** a live game still has to be in a league that
  is turned on. A favorite's game keeps the existing rule: on the
  TheSportsDB path a found favorite can surface from a league that
  is turned off; on the ESPN path favorites match by name only, so
  a favorite in a turned-off league does not surface.
- **Games shown per league:** the cap applies after the filter, so
  it counts only games actually shown. The fetch still fills up to
  that many upcoming-or-live games before filtering, so a league
  whose slate is mostly non-favorite upcoming games can show fewer
  than the cap — the same as favorites-only already behaved.
- **Live badge and refresh:** both follow the games actually
  shown. The badge lights when a shown game is live, and the fast
  refresh runs while a shown game is live or a shown favorite's
  game starts within 30 minutes — a hidden upcoming game does not
  speed up the refresh.

## Settings

All settings are household scope — every display sees the same
scores:

- Data source: `TheSportsDB` / `ESPN`, default `TheSportsDB`.
- TheSportsDB API key, default `123` (ESPN ignores it).
- Favorite teams, comma-separated, default empty.
- Show only my teams' games, default on.
- Show only favorite teams' games and live games, default off.
- NFL, College football, NBA, MLB, NHL, MLS, Premier League
  toggles (defaults: NFL, NBA, MLB, NHL on; the rest off).
- Games shown per league, default 4, min 1, max 10.
- Refresh minutes while a game is on, default 5, min 2, max 30.

A document saved before a setting existed behaves as that
setting's default, so existing users see no change.

## What it doesn't do

No betting lines, no play-by-play, and no standings — scores and
schedules only. It does not fetch a league that is turned off
except to find a favorite team's games on the TheSportsDB path.
