#import "imports.typ": *
#import "utils.typ": capitalize

// Add custom names.

#let probonotes-i18n-map = (
  examples: (
    en: (us: "Examples", gb: "Examples"),
    sv: "Exempel",
  ),
)

#let theorion-i18n-map = theorion-i18n-map + probonotes-i18n-map


// Add simple containers.

#let simple(
  title,
  body,
) = {
  let translated-title = theorion-i18n(theorion-i18n-map.at(title))
  [#emph(translated-title).#sym.space#body]
}

#let proof(   title: "Proof",    body) = simple("proof",    body)
#let problem( title: "Problem",  body) = simple("problem",  body)
#let solution(title: "Solution", body) = simple("solution", body)
#let example( title: "Example",  body) = simple("example",  body)
#let examples(title: "Examples", body) = simple("examples", body)


// Modify theorem environments.

#let (corollary-counter, corollary-block, corollary, show-corollary) = make-frame(
  "corollary",
  theorion-i18n-map.at("corollary"),
  counter: theorem-counter, // Has 2 inherited levels by default.
  render: render-fn.with(fill: red.darken(20%)),
)

#let (lemma-counter, lemma-block, lemma, show-lemma) = make-frame(
  "lemma",
  theorion-i18n-map.at("lemma"),
  counter: theorem-counter, // Has 2 inherited levels by default.
  render: render-fn.with(fill: red.darken(20%)),
)

#let (definition-counter, definition-block, definition, show-definition) = make-frame(
  "definition",
  theorion-i18n-map.at("definition"),
  inherited-levels: 2, // Create new counter with 2 inherited levels.
  render: render-fn.with(fill: orange),
)

#let warning-block = note-block.with(
  fill: rgb("#8250DF"),
  title: theorion-i18n-map.at("warning"),
  icon-name: "alert",
)


// Add functionality.

#let compact-restate(labels, numbered: true) = {
  theorion-restate(
    filter: it => labels.contains(it.label),
    render: it => (
      prefix: none,
      title: auto,
      full-title: auto,
      body,
    ) => if numbered {
      block[
        *#full-title* \ #body
      ]
    } else {
      block[
        *#capitalize(it.kind) #{ if it.title != "" { [ (#title) ] } }* \ #body
      ]
    },
  )
}

#let examples = example.with(title: context {
  if text.lang == "sv" { [Exempel] } else { [Examples] }
})
