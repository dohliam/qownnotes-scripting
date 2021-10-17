# Anchor links examples

See also related issue [[issues/bugs|here]] (note that there is no way to link directly to the relevant subheading...).

- [this links to a heading in the current document](#heading)
- [this links to a heading in a different document](another-note.md#heading)

Test using wiki syntax script:

- [[#heading]] - link to heading in current document
  - [[#heading|link to heading in current document]] - with link text
- [[another-note.md#heading]] - link to heading in a different document
  - [[another-note.md#heading|link to heading in a different document]] - with link text
- [[issues/bugs#anchors]] - link to heading in different group
  - [[issues/bugs#anchors|link to heading in different group]] - with link text

Results:

- Clicking on any of the above links gives an error, `The file or folder #heading does not exist.`

**Update as of v21.10.8:** Linking to anchor headings is now supported, but only the second link at the top of this page works, i.e.:

- [this links to a heading in a different document](another-note.md#heading)

(the other links still give errors)

## Heading

Test.
