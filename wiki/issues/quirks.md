# Quirks

Notes on quirks that should possibly be documented somewhere.

## Tables

* tables need to have at least three dashes in each table header row
  * if tables do not display properly (or at all), make sure that they have at leat three dashes in each header row (`---`)

for example:

test | ok | no
--- | -- | --
this | does | not work

**but** this does work:

test | ok | no
--- | --- | ---
this | does | not work

(note the only difference is the number of dashes in the header row)

## Editor-preview syncing

* preview is synced with editor -- but **only** if you are focused on the editor window
  * i.e., if you are scrolling and the preview is not syncing, it is probably becaue the editor window is not focused
