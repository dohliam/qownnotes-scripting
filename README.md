# QOwnNotes scripting (developtment)

This repo contains QOwnNotes scripts under development for eventual submission to the [official scripting repository](@). The scripts themselves are in the `scripts` folder.

They can be installed directly in QOwnNotes as is, but it is probably easier to use the versions submitted to the official repository which can be retrieved and updated automatically.

* `backlinks`: Generates a list of backlinks to the current note from all other notes in the collection
* `daily-note`: Creates a menu item and a button to create or jump to a note for the current day
* `default-subfolder-note`: Creates a menu item and a button to jump to the "default" or main note for the current subfolder (e.g., an index note linking to all the other notes)
* `export-notes-as-website`: Exports all notes in the collection as interlinked HTML files that can be viewed using any web browser
* `fix-new-note-headline`: Fixes new note headlines to use atx rather than setext headers
* `mermaid`: Adds support for rendering mermaid diagrams
* `random-note`: Creates a menu item and a button to jump to a random note from the collection
* `wiki-links`: Adds support for wiki-style internal links (e.g., `[[link]]`)

A demo website with full usage details and examples for each script can be found [here](@). This website was generated entirely using the `export-notes-as-website` script found in this repo, directly from within QOwnNotes!

The source for the demo website can be found in the `wiki` folder. If you install the `export-notes-as-website` script and open the wiki folder in QOwnNotes, you should be able to generate an exact copy of the website yourself.

## License

MIT.
