# Bugs

These should be reported on the QOwnNotes issue tracker. Notes below are for collecting information on bugs for eventual reporting on the QOwnNotes issue tracker.

## Anchor links

- auto-generation of anchors and links to `#anchors` do not work
- see example tests [[examples/anchors|here]]

example code:

```
[this links to a heading in the current document](#heading)
[this links to a heading in a different document](another-note.md#heading)
```

## Numbered checklists

- numbered checklists don't really work (they turn into bulleted checklists by default):
- see example tests [[examples/numbered-checklists|here]]

example:

```
1. [ ] a checkbox
2. [x] another checkbox
3. doesn't seem to use the numbers...
```

## Spacing of last item in list

- if the last item in a list is indented, it is spaced very strangely (and different from all other items in the list)
  - is this an example (yes, it is)

## Blockquotes styling

- blockquotes are not styled at all (only indented)
  - this is still true even if the setting for "full styling" of blockquotes is selected
    - this appears to merely highlight the blockquote text in yellow in the edit window
      - i.e., it has no effect on the preview at all
  - these should be, at the least, styled with a vertical grey bar as in most other applications

## Export to PDF

- export to pdf always prints to black and white
  - images, links, code highlighting etc, are all black and white
  - this is almost never desirable
  - should at least be an option for colour
    - or, even better, default to black and white for printing and colour for pdf export

## "Active note folder"

- there is no explanation of what making a new folder an "active note folder" means

## Creating new links on click

- this issue still seems to be affecting wikilinks clicked on in preview:
  - [Relative links to new file in existing subfolder will create new folders instead of using the existing subfolder · Issue #2106 · pbek/QOwnNotes · GitHub](https://github.com/pbek/QOwnNotes/issues/2106)

## Styling link text

* adding emphasis / italics to link text makes link disappear in preview
  * e.g.: [_example link_](https://example.com)
  * link is still clickable though
  * check to make sure this isn't restricted to one particular colour scheme
* more generally, styling link text does not seem to work at all
* examples:
  * [**bold link text**](https://example.com): preview displays as bold text, but not link, however link is still clickable
  * [_italic link text_](https://example.com): preview displays as italic text, but not link, however link is still clickable
  * [~~strikethrough link text~~](https://example.com): displays correctly in the preview, but not in the editor
  * **[bold link text](https://example.com)**: does not show as bold in the preview

## Unable to drag links from the preview

* in most Qt programs, clicking and dragging on a link/URL allows the full URL to be dropped on to any other program (e.g., a browser or text editor)
* however, clicking and dragging on links in QOwnNotes does not do anything
* in other words, there is no easy way to open links other than in the default browser (by clicking on them directly)
  * current options are:
    * selecting the full text of the link in the editing window
    * right-clicking on the link and selecting "copy link"
* possibly a Qt bug (?)

## Disallow all note editing

- Menu item displays as checkbox with title "Disallow all note editing"
  - However, when checked, this means "Allow all note editing" is currently in effect
  - When _unchecked_, this actually means "Disallow all note editing"
  - This is counterintuitive and should probably be changed
- "Disallow all note editing" seems to activate randomly for no reason
  - Need to collect more information about what circumstances cause this to happen
