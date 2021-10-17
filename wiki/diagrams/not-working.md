## Not working

Examples of Mermaid diagrams that don't work for some reason.


```mermaid
sequenceDiagram
    participant Alice
    participant Bob
    Alice->>John: Hello John, how are you?
    loop Healthcheck
        John->>John: Fight against hypochondria
    end
    Note right of John: Rational thoughts <br/>prevail!
    John-->>Alice: Great!
    John->>Bob: How about you?
    Bob-->>John: Jolly good!
```

This could be because the above diagram is too long -- this is a known issue with using the current workaround

## Pie charts

The simple diagram on the [[pie chart]] page also does not appear to be rendering correctly. Cause currently undetermined, but this may be another limitation of the mermaid.ink service.
