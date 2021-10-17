# titles_in_folder

Print a formatted list of all notes in a given folder. This can be useful for generating index pages (such as the one for [[utilities|this subfolder]])

## Usage

```bash
./titles_in_folder.rb [path/to/note/subfolder]
```

## Output

Running this script with a note subfolder as argument should print a formatted list of all the notes in that subfolder, with each note shown as a [[scripts/wiki-links|wiki link]], and the title of the note as the link text.

For example, running this script on the `examples` folder in this wiki gives the following output:

```
* [[anchors|Anchor links examples]]
* [[another-note|Another note]]
* [[blockquotes|Blockquotes examples]]
* [[examples|Examples]]
* [[list-spacing|List spacing]]
* [[numbered-checklists|Numbered checklists examples]]
```
