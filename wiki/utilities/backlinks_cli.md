# backlinks_cli

This is a command-line version of the QOwnNotes [[scripts/backlinks]] script. It allows for generating lists of inbound links in a variety of different styles (see below) for arbitrary notes in a collection.

## Usage

```bash
./backlinks_cli.rb [options] [filename.md]
```

The script does not need to be called from within the notes folder, and the provided file path does not need to be absolute. The script will be able to figure it out either way.

## Options

* `-l` / `--use-html`: Output results in HTML format
* `-m` / `--markdown`: Output results in markdown format with wikilinks
* `-p` / `--plain-text`: Output results in plain text
