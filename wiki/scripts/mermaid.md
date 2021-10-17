# Mermaid

Provides support for rendering [mermaid.js](https://mermaid-js.github.io/) diagrams.

## Description

In the current version of this script, support for mermaid diagrams is made possible by using the [mermaid.ink](https://mermaid.ink) API. This renders mermaid diagrams in the QOwnNotes preview window by sending the mermaid code to the mermaid.ink online service, which generates an image URL that can be displayed directly.

## Examples

A collection of examples can be found in the [[Diagrams/diagrams]] folder.

## Limitations

As can be seen from the examples in the link above, [[diagrams/not-working|not all diagrams render correctly]] (or at all). A known limitation of the mermaid.ink API is that diagrams that are too large (i.e., whose underlying code is too long after being base64 encoded) will not be rendered. This script should be considered a temporary workaround until full mermaid.js support can be provided.

## To do

The `scripts/mermaid`  folder in the main repo contains the official `mermaid.js` file. This can be used to provide full local support for rendering mermaid diagrams. There are a number of issues making adapting `mermaid.js` to QML difficult.
