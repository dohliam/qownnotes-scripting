# Fix new note headline

Fix new note headlines to use atx rather than setext headers.

## Description

For some reason, QOwnNotes defaults to using setext headers for the titles of notes, but atx headers everywhere else (for example, level two, three, etc headings).

Example of setext title heading:

```markdown
Note title
==========
```

Example of atx heading:

```markdown
# Note title
```

While these both have the same effect (i.e., both are rendered as a Level 1 Heading), setext headers are increasingly rare, are not as easy to automate, and are not as widely supported by other Markdown tools. Apart from this, the combination of setext and atx headers is inconsistent and nonstandard. This script fixes that by making all first level headings atx style by default.

Notably, this affects the default heading when a note is created uses the "New note" button/menu item.
