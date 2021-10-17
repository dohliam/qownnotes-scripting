# Backlinks Script

This script enables bidirectional linking by generating a list of backlinks to the current note from all other notes in the collection.

By default, this list is generated only on first opening a given note, rather than every time the preview is rendered, since incoming links (i.e., in other notes) are not likely to change while the note is open. This improves efficiency considerably.

However, this default behaviour can be switched off in the script options, which will generate (or regenerate) the backlinks list on every preview render. This is less efficient, but can be helpful in certain circumstances. For example, it is necessary to turn this on when using the [[Export notes as website]] script to generate HTML if you want the rendered HTML to include Backlinks as well.

## Limitations

This script is definitely a work-in-progress, and has already been rewritten in QML after an initial proof-of-concept version using Ruby, and probably still contains quite a few Rubyisms among other things. Help and suggestions to improve it are appreciated!

The following are some known limitations with using backlinks in QOwnNotes:

- The backlinks script currently only looks for internal links in "wiki link" format, for example:
  - `[[link]]`: a plain link to a note in the current folder with the filename `link.md`
  - `[[groupname/link]]`: a link to a note in a different folder (called `groupname`, one level up in the file system hierarchy), with the filename `link.md`
  - `[[groupname/link|link text]]`:  any of the above two link styles, plus optional link text following the `|` character
- There is currently no support for "regular" markdown-style links (e.g.:
  ```markdown
  [My Link](/some/path/link.md)
  ```
  - Note: add to [[issues/feature requests]] that it would be nice to have an API to access an array of parsed links for a given note (which would make implementing this easier)
- This script has not been tested on Windows and may not work there until support has been added for Windows-style directory separators
  - On a positive note, if you test this out and it doesn't work, it should be fairly easy to implement
- The script can definitely be refactored to be much more efficient than it currently is
  - However, it currently works quite well for certain purposes (medium-sized note collections with ~2000 notes, and generating wiki-style websites)

## CLI utility

There is also a CLI version of the backlinks script, which can be found in the `utilities` section of this repo. This is based on the original Ruby program that was called externally by early versions of the QOwnNotes script, and allows you to print all backlinks for a given page to standard output in a variety of styles (e.g., HTML, wiki-style, plain TSV). It does not rely on QOwnNotes and can be used independently with any collection of linked notes in Markdown format.
