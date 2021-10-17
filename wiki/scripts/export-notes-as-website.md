# Export notes as website

This script exports all notes in the collection as interlinked HTML files that can be viewed using any web browser.

This wiki is written entirely in QOwnNotes and exported directly to HTML using this script.

## Script compatibility

Note that in order to include [[backlinks]] in the exported HTML you will need to (temporarily) select "Trigger backlink generation on preview" from the backlinks script options. After exporting, this option should be unselected, as it may interfere with performance (since it causes backlinks to be generated "live" whenever the preview changes, instead of just once on opening the note).

## Known issues

* Like the [[wiki links]] script, this export script assumes that notes are arranged in subfolders _only_, and links in top-level notes may therefore be broken
  * To do: fix handling of top level links
