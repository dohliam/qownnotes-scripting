# Feature requests

Notes on feature requests for eventual submission via the QOwnNotes issue tracker.

## default note page

* it would be nice to show a "default" page when clicking on a subfolder in the note subfolder list
  * right now, if you click on a different subfolder, nothing happens, and you have to click on a specific note in the note list to see any content
  * maybe a plugin script could be written for this
    * when clicking on a subfolder, jump to pre-specified default page
    * for example, page could be called "index" or have the same name as the subfolder etc

## display link URL on hover

* it would be nice if the full path of links in the preview could be displayed in the status bar on hover (or in a pop-up)
* in other words, the way that links are handled in other applications such as browsers

## auto-italics

* selecting text and typing an underscore (`_`) does not surround the text in italics -- this should work like `*` and `[` etc

## support for styling text in editor window

* currently it does not appear to be possible to (easily) style text in the editor window, e.g., to provide support for a particular type of markup from a script
* this affects the [critic-markup](https://github.com/qownnotes/scripts/tree/master/critic-markup) and [[scripts/wiki links]] scripts, which ideally would be able to create different-coloured highlighting for certain kinds of text in the editor window
* it also affects the ability to write scripts to extend support to other filetypes (like AsciiDoc)
