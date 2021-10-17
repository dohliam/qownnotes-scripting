# Export notes as website

This script exports all notes in the collection as interlinked HTML files that can be viewed using any web browser.

This wiki is written entirely in QOwnNotes and exported directly to HTML using this script.

## Usage

Installing the script should add a new custom action ("Export notes as website") to the Scripting menu in QOwnNotes. Clicking this will export all notes in the current collection to HTML files in a new folder called `export`. (The location is not currently configurable without editing the script, but eventually an option should be added to change this to something else.)

After opening any of the exported HTML files in a browser, it should be possible to click through internal links just like in QOwnNotes.

## Script compatibility

Note that in order to include [[backlinks]] in the exported HTML you will need to (temporarily) select "Trigger backlink generation on preview" from the backlinks script options. After exporting, this option should be unselected, as it may interfere with performance (since it causes backlinks to be generated "live" whenever the preview changes, instead of just once on opening the note).
