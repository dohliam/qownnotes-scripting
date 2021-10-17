# note_stats

Print a range of information and statistics about any collection of notes.

## Usage

```bash
./note_stats.rb [note_path]
```

The `note_path` argument provided to the script should point to the top level of the note collection directory structure.

## Output

Currently, the following information is displayed by the script:

* **Total number of notes**: The total number of notes in the collection. (Only includes Markdown notes with file extension `.md`)
* **Top notes by number of inbound links**: Prints a list in ascending order of the least- to most-linked notes in the collection (based on scanning for [[scripts/wiki-links|wiki-style]] [[scripts/backlinks]])
* **Orphaned links**: Prints a list of notes that are not themselves linked to by any other notes in the colleciton

## To do

* Make the script modular (i.e., provide options to only print select information when specified)
