# Wiki links

Provides support for wiki-style internal links (e.g., `[[link]]`).

This script can be used together with the [[backlinks]] and [[export notes as website]] scripts to create complex, deeply interlinked notes.

Wiki links are different from standard Markdown-style links in that they do not require using full paths, specifying file extensions, or using the full link syntax, for example:

```markdown
[link text](/path/to/link.md)
```

## Syntax

Links are surrounded by double square brackets, and can contain either an optional "group name" (i.e., subfolder name), or optional link text after a single bar character, or any combination of these. For example:

- `[[link]]`: A plain link to a note in the current folder with the filename `link.md`
- `[[groupname/link]]`: A link to a note in a different folder (called `groupname`, one level up in the file system hierarchy), with the filename `link.md`
- `[[groupname/link|link text]]`:  Any of the above two link styles, plus optional link text following the `|` character

## Known issues

- Wiki links display correctly and are clickable in the preview panel, however they appear as plain text in the editor window for now
  - It appears that styling elements in the editor window is not as easy as in the preview panel
  - Eventually, it would be nice to have the ability to have wiki links display as links in the editor panel as well, and to be able to specify a custom link colour to (optionally) distinguish them from normal/external links
- This script assumes that the note collection folder structure has _all notes_ in subfolders (or "groups"), in other words that there are no top-level notes
  - If you do have top-level notes that are not in a subfolder, it does not appear to be possible to link to them using wiki-style links
    - However, links from top-level notes to other notes in subfolders seem to work fine
  - Top level notes may work unpredictably with the [[backlinks]] script

## To do

- [x] basic working prototype
- [ ] ability to adjust css colours in preferences
- [ ] ability to choose default file suffix (currently supports `.md`)
