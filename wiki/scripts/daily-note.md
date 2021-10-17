# Daily note

This script creates a menu item and a button to create or jump to a note for the current day. It is a slightly modified version of the [journal-entry](https://github.com/qownnotes/scripts/blob/master/journal-entry/journal-entry.qml) script by @pbek, @sanderboom, and @kantrol.

Features:

* atx headings (instead of setext headings)
* plain ISO dates (without timestamps) -- hence the idea of a "daily note" written once per day, rather than several notes throughout the day with different timestamps

Otherwise, options and usage are very similar to the original script.

## Options

* **Headline prefix**: Prefix to use for the note headline
* **Default folder**: The default folder where the newly created daily note should be placed
  * The path to the folder should be specified relative to the note folder
  * Make sure that the full path exists
  * Example: to place new daily notes in the subfolder `Journal` enter: `"Journal"`
  * Leave this blank to disable (notes will then be created in the currently active folder)
* **Create new folder**: Whetherto create a new folder with the date string in the default folder
* **Default tags**: One or more default tags (separated by commas) to assign to a newly created daily note. Leave blank to disable auto-tagging.
* **Ask for the date string**: Ask for the date string instead of using the current date (for example, to use a past or future date)
* **Template**: Template for a new daily entry.

## Example

If you click on the "Create daily note" button, a note will be created in the `journal` subfolder with the title being today's date in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) format. (Both the default title and subfolder name can be adjusted -- see Options section above.)

## Bugs

_Caution:_ Users of this script should be aware that text typed into a newly-created note may sometimes **not be stored** until clicking away from and back to the note. This appears related to a bug where newly-created notes are given a temporary "hash"-style filename before finally settling on the actual note name.

Update: it appears that this is a [known issue](https://github.com/qownnotes/scripts/issues/132). However, the suggested fix does not seem to correct the problem (at least in this script).
