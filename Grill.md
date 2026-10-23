# Grill card for HomeGlow · 1.13.0

Your grill and probes from Home Assistant on one card: temps for the grill and every probe, doneness picks for each food, a cook graph you can zoom and slide along, multi-step programs, Ready by times that learn from your grill, a grill journal, timers, reminders and alerts, and a pattern screen lock. Works with a smart grill, or with any grill and two temperature sensors.

**New in 1.13:** when you double-tap the card to half or the whole screen, the four top boxes show at twice the size, in proportion, and go back to normal when the card does. The Programs list is plainer: no *Start* next to each program, and no *New from what’s set now*. The ⋯ menu shows just the names (Compare keeps its line), and a program is stopped from the program box instead of ⋯.

**New in 1.12:** alerts go straight to your phones, without a script. In Setup → **Phone alerts**, tap your phones once; each alert then has a **Phone** switch beside its script, and **Test** sends a test message. The card writes each message itself, with the numbers as they are (*Brisket is 198°. Done at 203°.*). Grill problems and food done ring even when a phone is on silent, and **Got it** on the card clears the message from the phones. Phones are reached through Home Assistant's app or Pushover, whichever HomeGlow is set up with. This needs a HomeGlow with phone notifications; on an older one, Phone alerts says so and scripts work as before.

**New in 1.11.1:** the **+** that adds a timer is now a stopwatch. It sits to the left of the timer and reminder boxes and stays put while they slide. The boxes no longer have icons.

**New in 1.11:** the line under the top boxes drops the cook's name (it's already in the Food box) and keeps how long the cook has been going. Every timer and reminder gets its own box there, soonest on the left, on one line you slide sideways, with a **+** at the end to add one. Tap a box for just that timer or reminder.

**New in 1.10:** the timer and side timer are one: up to 3 timers at once, each with a name (*Timer*, or *Corn*, *Potatoes*, *Beans*, *Veggies*, *Rolls*, *Mac & cheese*, or your own), and each rings on its own (*Corn is done!*). ⋯ → **Add timer** starts one any time, even while a program runs. **Compare** moved into ⋯. The *Side timer* setting is gone; a timer or side timer running when you update carries on as one of your timers.

**New in 1.9:** a slimmer top. The four boxes now hold what the big cards under them used to: the grill's temp and set temp (*249°/250°*), the food with its temp and target (*Brisket 118°/203°*), the timer (or, while a program runs, its step) and when it'll be done. The graph is about 40% taller on a wall display and half again as tall on a Nest Hub. Extra probes get a slim box each. Plans are now called **programs**. ⋯ → **End cook** asks whether to save the cook to the journal or delete it. The timer and food menus fit a wall display without scrolling, and Journal, Programs and Setup each have a ✕ back to Cook.

**New in 1.7:** tap anywhere on the grill, food or timer box; pick the food and how done, and the card sets the target and when to pull it; up to 3 reminders, added any time; a side timer; doneness on programs; Undo after changes; a setting to turn learning off; locked displays show what they can't do; a pattern screen lock with Mute; probe and grill offsets; a check for a probe that slipped out of the meat; a reminder when the grill's left on; a *How was it?* bar after a cook; and the grill, probes and phone-alert scripts are now picked on the card, so Plugin Options is down to 14 settings.

**New in 1.8:** a new layout. Four tabs along the bottom: **Cook**, **Journal**, **Programs** and **Setup**. Across the top of Cook, the set temp, the program's step, the timer and when it's ready; under them a card for the pit and each probe, with its target and done time. The graph names each line with its temp, shows the clock along the bottom, and marks the set temp and target. **Compare** puts a past cook's line behind this one and says if you're ahead or behind. Big numbers is bigger, every button is easier to hit, and the colors are darker on light themes so they read in sunlight.

**New in 1.7.4:** the running-hot alarm also catches a grill that's already far over its set temp and staying there, and a fire right after relighting; a clearer message when a probe stops reporting; and no old done time while a probe isn't reading.

**New in 1.7.3:** alerts for a grill that turns off before the food is done (the cook stays open until you answer), a probe that stops reading, and a grill running hot; the grill's errors in plain words with what to do; done times that allow for the stall; clearer grill status words, including *Cooling down*; and a **🔇 Tap for sound** button when a display can't chime yet.

## Install or update

1. Home Assistant must be connected in HomeGlow (Admin → System → Connections).
2. Admin → Dashboard → Plugins → **Upload Widget** → pick `Grill.html`. Uploading over an older version keeps its data. Your presets become programs (an untouched built-in preset becomes the new built-in program; one you made or changed becomes a program that does the same thing), and your past cooks show up in the Grill journal under Recent.
3. Enable it and put it on a tab.

**Updating from 1.6:** the boxes for the grill, probes, probe target, grill timer, outdoor temperature and the six scripts have moved out of Plugin Options and onto the card. HomeGlow doesn't pass along values a plugin no longer lists, so **take a screenshot of Plugin Options before you upload 1.7**. Then pick them again on the card: the grill, food sensor and outdoor temp in Setup → **Grill and probes**, the scripts in Setup → **Phone alerts**. A Pit Boss is found by itself, so most setups only need the scripts. The 140° warning's on/off switch and hours became one dropdown, so check that too.

## What it works with

| Setup | What you get |
| --- | --- |
| **Pit Boss** (`pitboss` from HACS) | Everything, found by itself: grill, probes, probe targets, error sensors, shut-down. |
| **Traeger** (`traeger` from HACS) | Found by itself: grill, set temp, probes and their targets, and the grill's own timer. |
| **recteq** and other smart grills Home Assistant controls | Grill, set temp and probes, found by itself. If yours isn't found, pick it in Setup → Grill and probes. |
| **Any grill with a temperature sensor** (a ThermoWorks RFX Gateway air probe, a Weber Connect hub, an ESPHome thermocouple…) | Pick the sensor as the grill temp. Home Assistant can't set this grill, so the card keeps an **aim** temp you set. It draws on the graph, drives the done-time estimate, and lets the card warn when the grill drops below it. A cook starts when that sensor passes 150°F (65°C) and ends after it's been under 120°F (49°C) for 10 minutes. |
| **Probes only, no grill sensor** (MEATER, ThermoWorks, Inkbird, ToGrill…) | Food temps, targets, graph, timers and alerts. Tap **Start a cook** on the Cook tab; the cook ends 30 minutes after the food probe stops reporting. A thermometer's own target and countdown timer are used when it has them. |

Everything else (graph, zoom, programs, Ready by, timers, reminders, the journal, alerts) works the same on all of them. The card follows Home Assistant's unit, °F or °C.

**Setting up with sensors:** if no smart grill turns up, the card opens on **Set up your grill card**. Choose the grill temp sensor and the food sensor, then tap the **Aim** box at the top left to set the temp you're running it at. To change them later, go to Setup → **Grill and probes**.

## On the card

Four tabs along the bottom:

- **Cook:** the grill, the probes and the graph. Where the card rests.
- **Journal:** your last 10 cooks and the Hall of fame (see Grill journal).
- **Programs:** programs, and Ready by (see Programs).
- **Setup:** Grill and probes, Adjust readings, Phone alerts (phones and scripts), Screen lock, and What your grill has learned.

Left on Journal, Programs or Setup for 5 minutes, the card goes back to Cook by itself. So does a new alert.

### Across the top

Four boxes. Tap one to open it. A box this display isn't allowed to change shows a small lock instead (see Locked displays). When the card is expanded (double-tap it to half or the whole screen, if HomeGlow lets this display expand widgets), the four boxes show at twice the size.

- **Grill:** the grill's temp and its set temp, like *249°/250°* (the aim for a sensor grill; just its temp while it's off). Under it, where the grill is: *Lighting*, *Heating up*, *Holding*, *Coming down* (after you lower it), *Below set temp*, *Above set temp*, *Running hot*, *Cooling down* (after it's turned off, while its fan runs: leave it plugged in until the fan stops), *Off* or *Offline*. A problem shows here in red. On a Pit Boss, three small icons next to *Grill* light up while the fan, the auger and the igniter run. Offline, it shows its last reading, dimmed, with *as of 2:57 PM*, and a red bar says when it was lost. Tap it to change the set temp.
- **Food:** the main food's name, its temp and its target, like *Brisket 118°/203°*. Under it, the doneness you picked (*Probe tender*), or *Out of the meat?*, *No reading since 3:12 PM* (dimmed, with its last reading) or *At target · done*. Tap it to pick the food and how done (see Food and how done).
- **Timer or program:** the timer ending soonest and when it ends (*+1* when another is running too). With no timer running, the next reminder (*Spritz 22:56*). While a program runs, its step instead: the warm-up (*Warm-up · To 250° · ~16m*), then *Step 1 of 2* with the step's name and how long until it's done (*165° by ~4:40 PM*, or *1h 20m left*). When a step is done it turns yellow and says what's next. Before a Ready by, *Light in 7h 10m*. Tap it for the timer and reminders, or for the program's steps (see Programs).
- **Done:** when the main food should reach its target (*Done about 7:20 PM*), from its readings and what the card has learned. A range while the stall is still ahead and the card hasn't learned how long yours takes (*Done 5:40–7:40 PM*). In the stall, the done time still shows, with *In the stall · 40m* under it. *Estimating* for the first 15–20 minutes (with a program going, its usual times in the meantime). With a Ready by, *Ready by 6:00 PM*, then *On track* or *Behind* during the cook. With no target, how long the cook has been going.

### More probes

A second or third probe (or a wireless one you added) gets a slim box under the top boxes while it's plugged in: its name and color, its temp and target (*142°/165°*), and when it should be done. Tap it to pick the food and how done, or to turn it off. One that stops reading dims and says when it last did. The colors match the lines on the graph. With one probe, there's no box.

### The cook's line

Under the top boxes: how long the cook has been going (*1h 38m*; the name is already in the Food box), and while comparing, how far ahead or behind you are. A past cook from the journal, *No cook going* and *Ready by 6:00 PM* show their title here instead. Then:

- **The stopwatch**, just left of the boxes: a new timer (see Timers), with **+ Add a reminder** there too. It stays put while the boxes slide.
- **A box for each timer and reminder:** soonest on the left, on one line you slide sideways when they don't all fit (a soft edge shows there's more). With no program running, the one already in the third box doesn't get a box too. Tap a box for just that one: a timer's time left with −1m, +1m, pause and **Cancel**; a reminder's next time with **Change** and **Stop**; both with **All timers and reminders ›**.

- **Compare** (in ⋯): pick a past cook from the journal (the same kind first). Its main food shows as a gray line behind this one, lined up by the time since each cook started, and the cook's line says how far ahead or behind you are: *40m ahead of Oct 11*. ⋯ → **Stop comparing** ends it. Each display has its own.
- **Zoom:** **30m · 1h · 4h · All**. Only the ones shorter than the cook so far show, so a new cook has none. Zoomed in, a strip under the graph shows the whole cook with a box around the part you're looking at. Drag the box, or tap anywhere on the strip, to move back through the cook. **Now ›** (or **End ›** on a past cook) jumps back; at the live end the graph keeps following as the cook goes on. On a display with a mouse, the wheel zooms too. Each display remembers its zoom.
- **⋯:** **End cook** (asks what to do with it: **Save cook** keeps it in the Grill journal, **Delete cook** throws it away and takes a second tap, **Cancel** keeps it going. The graph, program and reminders stop; the grill stays on, and the next cook starts when it's lit again), **Add timer** (see Timers), **Compare** or **Stop comparing**, **Notes and rating**, **+ Mark this moment** ("Wrapped", "Spritzed" or your own note on the graph; set-temp changes and lid openings are marked by themselves), *Cancel Ready by* (also asks), **Lock now**, and, for a smart grill, *Hold to shut down the grill* (2 seconds, so it can't happen by accident).

### The graph

Each line ends in a label with its name and temp, so none depends on its color. The set temp is the gray dashed line, each target a dotted line in its probe's color, both named at the left. The bottom shows the time of day. Drag along the graph to read every temp at that moment. The dotted line past "now" is where each food is heading, ending at its done time.

- **Done times and the stall:** brisket, pork butt and other low-and-slow cooks stop climbing for a while, usually somewhere around 150–170°F. The readings so far can't show it coming, so until the food gets there the done time adds it: as long as your stall usually lasts once the card has learned it (*Done ~6:40 PM*), or a range while it hasn't (*Done 5:40–7:40 PM*, allowing 1 to 3 hours). On the graph, once the stall comes into view, the dotted line runs flat through it (marked *stall*), and a range ends on a bar instead of a dot.
- **No cook going:** the graph's space offers **Programs** and **Ready by…**, and shows your last cook; tap it to see its graph. A Ready by shows its program there, with **Light now** and **Cancel Ready by**.

### More

- **Reminders:** up to 3 at once, like *Spritz every 45 min* and *Check pellets every 2 hours*. Add them any time, with or without a timer running: the timer menu (the third box), the stopwatch on the cook's line, or ⋯ → **Add timer** → **+ Add a reminder**. Each rings when due: **Done** starts the next one, **5 more min** asks again in 5 minutes, and the Timer box can change or stop each one.
- **Timers:** up to 3 at once. In the timer menu (the third box, the stopwatch on the cook's line, or ⋯ → **Add timer**), pick how long with the hours and minutes or a quick time (*5m … 3h*, which fills them in), then a name: **Timer** is picked unless you tap *Corn*, *Potatoes*, *Beans*, *Veggies*, *Rolls* or *Mac & cheese*, or type your own. **Start timer** starts it. Running ones are listed at the top of the menu with −1m, +1m, pause and **Cancel** (which asks first). Each rings on its own: *Timer done!*, *Corn is done!* The one ending soonest shows in the third box (while no program runs); every other one gets a box on the cook's line. They're the card's own timers, shared by every screen.
- **A program's timer and the rest:** a program step that runs on time, and the rest after the food's done, have their own timer, separate from your 3. It shows in the program box (or the third box for the rest), and at the top of the timer menu with −1m, +1m, pause and **Cancel**. A grill with its own timer that Home Assistant can set (Traeger) uses it for these; Pit Boss has none, so the card's is used.
- **The timer menu fits a wall display without scrolling.** When a lot is going at once, **+ Add a reminder**, then **+ New timer**, become buttons that open on their own.
- **Undo:** changing the grill temp, the food, its target or the timer shows **Undo** for a few seconds.

## Food and how done

Tap a probe's card and pick what's cooking, then how done. The card sets the target and the heads-up for you.

| Food | Choices (final temp after resting) |
| --- | --- |
| Steak, roast beef & tri-tip, lamb | Rare 125°, Medium rare 135°, Medium 140°, Medium well 150°, Well done 160° |
| Pork chops & tenderloin | A little pink 145°, Well done 150° |
| Pork butt | Sliced 190°, Pulled 203° |
| Brisket | Sliceable 195°, Probe tender 203° |
| Ribs | Clean bite 195°, Fall off the bone 203° |
| Chicken | Breast or whole 165° |
| Thighs & wings | Safe 165°, Juicy 175°, Fall-apart 185° |
| Turkey | Breast 165°, Thigh 175° |
| Burgers & sausage | Burgers 160°, Pork sausage 160°, Chicken sausage 165° |
| Salmon | Silky 125°, Medium 135°, Flaky 145° |

The temps are ThermoWorks' chef chart: where the food ends up after it rests. Each choice shows when to pull it, since meat keeps climbing off the grill (5° early for steak, lamb and pork, 10° for a roast). The heads-up alert says **Pull the steak now** at that point; **Pulled it** marks the graph. A choice under the USDA's safe minimum says so.

**Poultry never pulls early.** Chicken, thighs, wings, turkey and chicken sausage have no early pull: the alert waits for the full temp and says it's safe to take off.

**On a wall display, the food menu fits without scrolling.** The target and the pull-early (or heads-up) degrees sit side by side, each with − and +, and the cook's name is the box next to Save.

**Your usual:** the card remembers the last doneness you picked for each food and marks it *Your usual*, on every display. You can still set the target and heads-up by hand, and name the probe ("Point").

## Alerts

The card takes over, flashes and chimes until someone taps the button. Problems flash red and keep chiming every 30 seconds.

| Alert | When |
| --- | --- |
| Out of pellets / a grill error | Pit Boss reports it, in plain words with what to do: *Grill is too hot!*, *The fire didn't start, or went out*, *Igniter problem*, *Auger problem*, *Fan problem*, *Problem with Brisket* (a probe's error only counts if that probe is in use) |
| The grill turned off | It went off before the food was done (10° or more short of its target, or a program still going), and not from the card: a power cut, a fire that went out, a bumped switch. After a power cut a pellet grill usually stays off until someone restarts it (a Pit Boss shows ErP). Asked after half a minute. **Keep the cook open** holds the cook for 2 hours so it carries on when you relight; **I turned it off** ends it. Unanswered, the cook stays open for up to 6 hours. A sensor grill says *The grill's gone cold* |
| Lost the grill | Home Assistant can't reach the grill while it was running. Turning it off yourself doesn't trigger this |
| Brisket probe stopped reporting | A probe with a target hasn't reported for 3 minutes partway through a cook: a flat battery, out of range, its base or hub off, or its plug pulled out of the grill. It says when and what it last read, and that there's no done alert until it's back. Not once it had reached its target (pulled to rest). Meanwhile its card says *No reading since 3:12 PM* and the Done box *No reading*, instead of an old done time |
| Grill is 30° under its set temp | 25° or more under for 5 minutes, after it had reached the set temp |
| Grill is 95° over its set temp | A grease fire, or a fire that got away: 75° or more over and still climbing, or 75° or more for 3 minutes without coming down. In the first 20 minutes after lighting it takes 150° over, since most grills overshoot as they come up. Not while it coasts down after you lower the set temp. Every display shows it; a new flare-up after it cooled off alarms again. **Shut down…** asks, then turns it off |
| Brisket is still under 140° after 4 hours | A probe in use hasn't passed 140°F (60°C) four hours after it started reading. Change the hours or turn it off with *Warn if food is under 140° after* in Plugin Options |
| Is the probe still in the steak? | A probe climbs 30° or more in half a minute and ends up near the grill temp, the way a probe reads once it slips out of the meat. Its pull and done alerts (and a program step waiting on it) hold off until it reads like meat again. **It's in the meat** tells every display to carry on |
| Pull the steak now | A probe reaches its pull point (the heads-up; set by the doneness, per cook or per program). Never for poultry |
| Brisket reached 203° | A probe reaches its target. **Let it rest** and **Keep warm** only show at the end of a cook, not when a program still has steps to go |
| Timer done / Corn is done / Rest is done | One of your timers, or the rest, ends |
| Time to spritz | A reminder is due. **5 more min** asks again in 5 minutes |
| Time to wrap (a program step's message) | A program step ends. **Start Wrapped** moves on; **5 more min** asks again in 5 minutes |
| Grill is at 250° | A program's warm-up is done: put the food on and tap to start step 1 |
| Time to light the grill | A Ready by time says so. **Lit it** starts the program |
| The grill's still on | 30 minutes after the food was done (its done alert, the rest starting, a *Pulled* mark or the program finishing), the grill is still running; 2 hours if it's keeping the food warm. **Shut down…** asks before it turns the grill off. Change the minutes or turn it off with *Grill left on: remind after* |

**If it's a grease fire:** Pit Boss's manual says to turn the grill off and keep the lid closed until the fire is out, and not to throw water on it or try to smother it. Call the fire department if it spreads. A Pit Boss's own high-temperature error (ErH) only trips above 615°F, so the card's *running hot* alert usually comes first. Keeping the grill clean is the best prevention: Pit Boss suggests cleaning out the ash and grease every 15–20 hours of cooking.

**About the 140° warning:** the USDA calls 40–140°F the danger zone, where bacteria grow. Getting meat through it in about 4 hours is a common pitmaster rule, not a USDA rule. The warning skips a probe that has already passed 140° (so pulling a probe out doesn't set it off), extra sensors with no target, and anything with a target of 140° or less, like cold-smoked cheese.

**Keep warm:** when food is done, **Keep warm at 180°** drops the grill to the keep-warm temp (165° by default; Pit Boss grills go no lower than 180°). A program can do this by itself when the main food is done; only one display does it.

**Why the probe check exists:** a probe that slips out reads the grill's air. Without the check, a steak probe pulled out at 120° would say *Pull the steak now* and then *done* within seconds, and a chicken probe would say *safe to take off* when the chicken isn't. Meat can't climb that fast; even a burger on a hot grill climbs about 10° in half a minute. The check only starts once the grill is up to its set temp, so a probe dangling in the grill while it heats doesn't set it off.

**Lid openings don't set off the temp alert.** A lid opening drops the grill 15° or more within a minute; a dying fire sags slowly. After a lid opening the card shows *Lid opened · recovering* and stays quiet for 15 minutes. If the grill still hasn't come back by then, it's no longer the lid, and the alert says so.

## Programs

The **Programs** tab. A program is a list of steps, like 3-2-1 ribs: **Smoke** 3 hours, **Wrapped** 2 hours, **Sauced** 1 hour, then a rest. Tap a program to start it now or set a Ready by time.

**Starting one** sets the grill to step 1's temp and the main probe's target, names the cook, and starts step 1. If the grill still has to heat up, the card shows *Warming up* and step 1 waits. When the grill is within 10° of its set temp, it chimes *Grill is at 250°*. Put the food on and tap **Start Smoke**, and that's when step 1's timer starts.

**On the card while it runs:**

- The third box at the top shows the step, like *Step 2 of 2 · Wrapped · 1h 20m left*, or *165° by ~4:40 PM* for a step that ends at a food temp. Your timers and reminders show as boxes on the cook's line.
- Tap that box for every step: done ones with ✓ and how long they really took, the current one highlighted, then the rest, and when the program should finish.
- **Next step ›** there moves on early. It asks for a second tap so a brush against the screen doesn't skip a step.
- **Stop *program*** at the bottom of that list stops it (it asks first; the grill stays on and the graph keeps recording).

**When a step ends** (its time is up, or the food reaches its temp), the card chimes with the step's message, like *Time to wrap*. By default it waits: tap **Start Wrapped** when you've wrapped, and the 2-hour timer starts then. **5 more min** gives you longer. Each step change is marked on the graph.

**How done:** a program for a food with doneness choices (steak, tri-tip, ribs, thighs, burgers…) asks how done when you start it, with *Your usual* marked. The steps that cook to a temp shift to match: medium well moves a reverse-sear steak's smoke and sear temps up 15°. Your own programs get the same choice when you pick *What's cooking (for doneness)* in the editor.

**Each step has:**

- a name (Smoke, Wrapped, Sauced, Sear…, or your own)
- how it ends: *after a time*, *at a food temp*, or *when I tap Next*
- a grill temp (or *Leave it*)
- an optional repeating reminder (spritz every 45 min) that runs only during that step. If one is due just as the step ends, it shows before the step's alert (spritz, then wrap), and one still waiting when the step moves on rings one last time. Give the next step the same reminder and it carries on where it was instead of starting over
- a message for when it ends

**The program's settings:**

| Setting | Off (default) | On |
| --- | --- | --- |
| Start the next step by itself | Waits for your tap | The next step and its timer start right away, with a chime saying so |
| Change the grill temp each step | The card shows each step's temp and you set it | The card sets it |

A program also has its food target for the done alert (at its lowest it follows the last step that cooks to a temp), heads-up degrees, rest time, keep warm, notes, and **★ Pin to the top**.

**Editing:** **Edit** on any program, built-in ones included. Tap a step to change it, **↑** to move it up, **+ Add step** (up to 8). **Save as copy** makes a variation. **Delete** asks for a second tap; deleted built-ins can be brought back from the bottom of the list. Programs are shared by every display (up to 40).

**Built in** (standard methods):

- brisket and pork butt: smoke to 165°, wrap, cook to 203°, rest with keep warm
- 3-2-1 spare ribs and 2-2-1 baby backs
- whole chicken and spatchcock chicken
- thighs, wings (first side, then second side), turkey
- reverse-sear tri-tip and steak: smoke, then sear, to the doneness you pick
- pork tenderloin, salmon, smoked queso
- burgers: first side 6 minutes, flip, then the second side to 160°

1.6's built-in programs you never changed are brought up to date by themselves; programs you made or changed are left alone.

## Ready by

Tap a program → **Ready by…** (or **Ready by…** on the Cook tab when no cook is going, then the program) → pick when you want to eat, and the weight for programs that cook to a temp. It works out **Light the grill by 5:10 AM** and shows the breakdown:

- the warm-up
- each step
- the rest
- extra time on a cold day

**Remind me** sets it. The third box counts down to lighting the grill (*Light in 7h 10m*), the Done box shows *Ready by 6:00 PM*, and the graph's space shows the program. Tap either box for **Light now**, **Change** or **Cancel Ready by**. At that time the card chimes and runs your reminder script. Tap **Lit it** (or **Light now**, or just light the grill) and the program starts. Lighting it early counts too, up to 3 hours ahead. If the grill is already on when you set a Ready by, the program waits for the chime or **Light now**, so it doesn't start in the middle of another cook.

During the cook, the Done box says *Ready by 6:00 PM · On track*, or *Ready 6:25 PM · Behind* when the card's projection runs more than 10 minutes late.

## What the card learns

Every cook teaches it something (turn this off with *Learn from my cooks* in Plugin Options, or the switch in **What your grill has learned**; off, Ready by goes by rules of thumb and records nothing new, and what it already learned is kept):

- how long your grill takes to warm up to each temp
- how long each step of each program really takes (per pound for steps that cook to a temp, when you give a weight)
- how long the stall lasts
- how much the food climbs while it rests (needs the probe left in, and the rest timer started or a *Pulled* mark)
- how much longer cooks run below 40°F outside (needs an outdoor temperature, below)

It goes by the middle of your last 5 or so cooks, so one odd day doesn't throw it off. It only trusts something once it has 2 cooks of it; before that, Ready by uses a rule of thumb and says so.

Where you see it:

- Ready by times
- *Usually 1h 50m on your grill* in the program editor
- *Your times · 4 cooks* in Programs
- *Done about 4:40 PM · By the program's times* in the Done box while the curve estimate warms up
- the done time before and through the stall, which counts your usual stall

Setup → **What your grill has learned** (also at the bottom of Programs) lists it all. From there, **Set heads-up to 7°** changes a program's heads-up to match how much that food climbs while resting.

**Outdoor temperature:** Setup → **Grill and probes** → **Outdoor temperature**. Pick a weather entity or an outdoor temperature sensor. Each cook records it.

## Probes

**Using one probe?** The card shows one: the grill, that probe, and nothing else. Plug it into any port; the main food follows whichever of the grill's probes is reading, and keeps it while it reads (unplugging it for a minute to move it doesn't swap anything). Other probes appear only while they're plugged in. On the graph, a probe gets a line once it's read for 2 minutes, so one plugged in by mistake for a moment leaves nothing behind. A probe you used and then unplugged keeps its line for that cook, but its card goes away.

Setup → **Grill and probes**:

- **Main food:** the Food box at the top. Tap to switch it to any temperature sensor.
- **The grill's other probes:** switch each on or off. A probe that's off isn't shown, graphed or alerted on, including its error sensor. One that's on but unplugged stays out of the way by itself.
- **Other sensors:** **+ Add a temperature sensor** puts a Meater, ThermoWorks or any temperature sensor on the card next to the grill's probes. ✕ removes it.
- Up to 5 probes show at once, counting the main food, so the graph stays readable.
- Each probe keeps its line and color for the whole cook, even when others are turned off or added.
- **Adjust readings** (its own row in Setup): a − / + for the grill and each probe. Check a probe in ice water (32°F) next to a thermometer you trust: if it reads 30°, set +2°. For the grill, compare a thermometer at the grate: with −10°, the card shows the grate temp and asks the grill for 10° more than you pick, so *Set 250°* really means 250° at the grate. A probe's target on the grill itself is adjusted the same way, so the grill's own beep agrees with the card. Phone-alert scripts read Home Assistant directly, so their temps aren't adjusted.
- **More:** the choices the card normally makes by itself: which of the grill's probe ports is the main food, the main probe's target on the grill (or the card's own target), the grill timer (or always the card's own), and the timer's time-left sensor.
- The choices are shared by every display and carry over from cook to cook.

## Grill journal

The **Journal** tab, with two lists:

- **Recent:** the last 10 cooks. The oldest drops off when a new one ends. Tap ☆ to keep one.
- **Hall of fame ★:** cooks you starred (up to 50). They stay until you take them out.

Tap a cook to see its graph (the Journal tab stays lit). The bar above it has:

- **‹** back to the list
- **★ Hall of fame**
- **Cook again:** turns the cook into a new program using its real step times and grill temps, ready to name, save and start
- **Notes** (or **Rate**)
- **Learn from this cook:** turn it off for an odd day (ran out of pellets, lid left open) so it doesn't skew Ready by
- **Delete**
- **Back to live**

Taking a cook out of the Hall of fame after it's left Recent deletes it, so that asks for a second tap.

**Notes and rating:** during a cook, ⋯ → **Notes and rating** (stars, plus what you used and what you'd change). They're kept with the cook in the journal.

**How was it?** 10 minutes after the food is done and its rest is over, a slim bar under the probes asks for stars. One tap saves them; **Notes** opens the notes; **Not now** puts it away for that cook. If nobody answers before the cook ends, it asks about that cook for a day afterwards. Displays whose temps are locked don't show it.

## Good to know

- **The graph records only while a HomeGlow screen shows the card.** Time the screen was off shows as a gap.
- A cook starts when the grill turns on and ends 10 minutes after it turns off. A display or phone that opens the card mid-cook joins the cook that's going; it never starts a new one over it. That's when it's saved to the Grill journal and the card learns from it. A grill that drops off the network as it powers down still ends the cook 10 minutes after it read off; one that just disappears ends it 2 hours after its last reading. A grill that turns off before the food is done holds the cook open until someone answers *The grill turned off* (up to 6 hours). ⋯ → **End cook** saves it to the journal (or deletes it) and stops; the next cook starts when the grill is lit again, or from ⋯ → **Start a cook**.
- **Where it's kept:** programs, the journal and what the card has learned live in HomeGlow's own database (its `data` folder), so they survive restarts, updates and re-uploading the card. Back up that folder with the rest of HomeGlow.
- **Big numbers:** during a cook, after 2 minutes untouched on the Cook tab, the card switches to the main food's temp as big as the card allows, with its target and done time under it, and the grill, the other probes and the timer or done time along the bottom, to read across the yard. Any tap brings the graph back. Change or turn off with **Big numbers after…** (per display).
- **Chime:** browsers only play sound after someone taps the screen, and a reload (a power blip, a HomeGlow update) starts over. While a cook is going and the chime can't play yet, the card shows a **🔇 Tap here for sound** bar over the probes (and on Big numbers); one tap on the card fixes it (in Chrome, a tap anywhere on the dashboard does). To never need the tap on a wall display, let its browser play sound by itself: for Chromium or Chrome in kiosk mode, add `--autoplay-policy=no-user-gesture-required` to how it starts.
- **Keep the card on screen:** a card only runs while its tab is showing. A display left on another tab, or a screensaver that cycles through tabs, doesn't chime (or record) while the Grill tab is hidden, and the card restarts each time the tab comes back. Keep the Grill card on the tab the display rests on, or use the photo screensaver during a cook.
- **Quiet hours:** set a start and end per display (like 22:00 and 07:00). During them alerts still flash and phone alerts and scripts still go out, but the display doesn't chime. Turn on *Grill problems still chime* if you want an empty hopper at 3 AM to make noise.
- Reminders stop when their cook ends, or when you start a new one. A program step's reminder stops when the step ends, after one last ring if it was due.
- **Done times are estimates.** Good mid-cook, rough early on. Before the stall they allow for it (see Done times and the stall); through it, the card shows how long it's been stalled instead.
- **Access:** the plugin can read sensors, error sensors and weather entities, and operate climate, number and script entities. It only operates the ones it's set to: the grill, probe targets, the grill timer and your scripts. It can also send the phones you pick a short message through HomeGlow (text only).

## Locked displays

Admin → Security → **Controls on Displays** has a switch per display for each of these (on means the display can do it):

- **Change temps and timers, and start or stop cooks and programs.** Off: the boxes show a small lock, a line under them says what this display can't do, and tapping one says *Temps, timers and cooks are locked on this display*. The ⋯ menu has no Cancel Ready by or End cook, the program box has no Stop, Programs can't start or change a program, Setup has no Phone alerts or Screen lock, and the Journal is view-only. Its alerts still flash and chime and can be dismissed, but buttons that would change something (start a rest, keep warm, stop a reminder, cancel Ready by) don't show.
- **Move a program on to its next step, and dismiss alerts.** Off: no Next button, and every alert only offers **Hide here**. That hides it on this display only, so it keeps flashing everywhere else until someone dismisses it there. A kid's room can't clear a flip or spritz alert before you see it.
- *Turn probes on or off and choose food sensors*
- *Start or end a cook*
- *Shut down the grill*

## Screen lock

A phone-style pattern on a 3×3 grid of dots, so a passing hand or a kid can't change anything.

- **Set it:** Setup → **Screen lock**. Draw a pattern through at least 4 dots, then draw it again to confirm. Every display uses the same pattern. Until one is set, nothing locks.
- **When it locks:** after 30 seconds untouched, and whenever the display loads. Change the time per display in Plugin Options (*Lock after seconds untouched*; 0 = never). ⋯ → **Lock now** locks it right away.
- **While locked:** the card still shows everything live, and alerts still flash and chime. A small lock shows at the start of the line under the top boxes. A tap anywhere brings up the dots; that tap does nothing else, so tapping ✕ or a box to wake it can't cancel or change anything.
- **Mute:** when an alert is up on a locked display, the dots come with **Mute for 2 min**. It quiets that display's chime without dismissing anything: the alert keeps flashing until someone unlocks and handles it. A different alert that comes up meanwhile still chimes, and grill problems start chiming again after the 2 minutes.
- **Unlocking:** draw the pattern. A wrong one shakes and clears. After 5 wrong tries, that display waits 30 seconds.
- **Change or turn off:** Setup → **Screen lock** asks for the current pattern first, then lets you draw a new one or **Turn off screen lock** (with Undo). Displays whose temps are locked can't change it, but can use Lock now.
- **Forgot it?** Plugin Options → turn on *Forgot the screen lock pattern?* The card clears the pattern on every display and turns the switch back off. Then set a new one.

## Phone alerts

Setup → **Phone alerts**. Each kind of alert can go to your phones, run a Home Assistant script, or both.

**Phones (needs a HomeGlow with phone notifications):**

- **Send to:** tap each phone once. Every alert with its **Phone** switch on goes to all the phones picked. Every display shares the choice.
- The phones come from HomeGlow: every phone with Home Assistant's Companion app, and your Pushover devices if HomeGlow has Pushover set up (Admin → System → Connections → Pushover; for homes without Home Assistant).
- **The messages** are titled **Grill**, and the card writes them with the numbers as they are:

| Alert | The phone says, for example |
| --- | --- |
| Grill problem | *Grill is 310°, set to 250°. If it’s a grease fire, shut it down and keep the lid closed.* · *Out of pellets. Grill is 231°, set to 250°.* · *The grill turned off. Brisket is 158°, short of 203°.* · *Brisket probe stopped reporting. Last: 162° at 3:12 PM.* |
| Food done | *Brisket reached 203°.* (poultry adds *It’s safe to take off.*) |
| Almost done | *Pull the steak now: 130°. It climbs to about 135° while it rests.* · *Brisket is 198°. Done at 203°.* |
| Timer done | *Corn is done (20m).* · *Rest is done. Time to slice.* |
| Program step | *Time to wrap. Brisket is 165°.* · *Grill is at 250°. Put the brisket on.* |
| Reminders | *Time to spritz. Brisket is 152°.* · *Time to light the grill for Brisket, ready by 6:00 PM.* |
| Grill left on | *The grill’s still on, 45 minutes after the brisket was done. It’s at 180°.* |

- **Rings on silent:** Grill problem and Food done. Through Home Assistant's app, an Android rings at alarm volume even on vibrate or silent (not through Do Not Disturb), and an iPhone rings through mute and Do Not Disturb once its owner allows Critical Alerts for the Home Assistant app. Through Pushover they repeat every minute, for up to an hour, until someone taps Acknowledge on a phone.
- **Once:** each message goes out once, from one display, even with several screens showing the card.
- **Got it** on the card clears it from the phones (Pushover stops repeating it instead; a message already showing stays). A phone whose app hasn't run lately may keep it.
- **Test** sends that alert's test message to the picked phones (if its Phone switch is on) and runs its script (if it has one). A test of Grill problem or Food done rings like the real thing.
- On a HomeGlow without phone notifications, the page says it needs a newer HomeGlow, and only the scripts show.

**Scripts:** make scripts in Home Assistant, then pick one for each alert. The same script can serve several alerts. Each runs once, even with several screens showing the card. The card can't pass the temps along, but a script can read them itself. Replace `pb1150ps3` with your grill's name (look it up under Settings → Devices & services → Entities), and use your phones' names from Settings → Devices & services → Mobile App.

**Grill problem** (pick it for *Grill problem*):

```yaml
alias: Grill problem
sequence:
  - action: notify.mobile_app_YOUR_PHONE
    data:
      title: "Grill needs you"
      message: >-
        Grill is {{ state_attr('climate.pb1150ps3_grill_temperature', 'current_temperature') | round }}°,
        set to {{ state_attr('climate.pb1150ps3_grill_temperature', 'temperature') | round }}°.
        {% if is_state('binary_sensor.pb1150ps3_no_pellets', 'on') %}Out of pellets.{% endif %}
      data:
        priority: high
        ttl: 0
  - action: notify.mobile_app_SECOND_PHONE
    data:
      title: "Grill needs you"
      message: "Check the grill: it's reporting an error, losing heat, running hot or turned off, or a probe stopped reading."
```

**Food done** (pick it for *Food done*):

```yaml
alias: Grill food done
sequence:
  - action: notify.mobile_app_YOUR_PHONE
    data:
      title: "Food's ready"
      message: >-
        The probe reads {{ states('sensor.pb1150ps3_mpc') | float(0) | round }}°.
        Time to pull it and rest.
```

**Almost done** (pick it for *Almost done*):

```yaml
alias: Grill almost done
sequence:
  - action: notify.mobile_app_YOUR_PHONE
    data:
      title: "Almost done"
      message: >-
        Food is at {{ states('sensor.pb1150ps3_mpc') | float(0) | round }}°,
        target {{ states('number.pb1150ps3_mpc_target') | float(0) | round }}°.
```

**Program step** (pick it for *Program step*):

```yaml
alias: Grill step done
sequence:
  - action: notify.mobile_app_YOUR_PHONE
    data:
      title: "Grill: next step"
      message: "A program step is done (time to wrap, sauce or sear). Check the card."
```

With phones picked above you don't need these; they're for a HomeGlow without phone notifications, or for doing more than a message (flashing a light, announcing on a speaker). Make more the same way for the timer, reminders and *Grill left on* if you want those on your phone too. The problem script also runs for *The grill turned off*, *…probe stopped reporting*, *running hot*, the 140° warning and *Is the probe still in…?*, so it's the one to make loud. The *Time to light the grill* alarm uses the reminders script. The program's final step uses the food script when it ends at a food temp.

## Settings (Admin → Dashboard → Plugins → Grill → Plugin Options)

Thirteen. Anything about which entities the card uses is picked on the card.

| Setting | Default |
| --- | --- |
| Heads-up degrees before target | 5 (0 = off). Used for foods without a doneness pick; a program or the food sheet can change it for a cook |
| Keep-warm grill temp | 165 (the grill's lowest setting if that's higher) |
| Warn if food is under 140° after | 4 hours (Off, 3, 4, 5 or 6 hours) |
| Grill left on: remind after (minutes) | 30 (0 = never; 2 hours while keeping warm) |
| Learn from my cooks | on (off goes by rules of thumb and records nothing new) |
| Quiet hours start / end | none (each display has its own) |
| Grill problems still chime in quiet hours | off (each display has its own) |
| Chime on this display | on (each display has its own) |
| Lock after seconds untouched | 30 (each display has its own; 0 = never; does nothing until a pattern is set) |
| Forgot the screen lock pattern? | off (turn on to clear the pattern; it turns itself back off) |
| Big numbers after idle minutes | 2 (each display has its own; 0 = off) |
| Graph: seconds between readings | 15 |
