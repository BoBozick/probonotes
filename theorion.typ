#import "imports.typ": *
#import "elements.typ": capitalize


// Modify theorem environments.
#let (corollary-counter, corollary-box, corollary, show-corollary) = make-frame(
  "corollary",
  theorion-i18n-map.at("corollary"),
  counter: theorem-counter, // Has 2 inherited levels by default.
  render: render-fn.with(fill: red.darken(20%)),
)

#let (lemma-counter, lemma-box, lemma, show-lemma) = make-frame(
  "lemma",
  theorion-i18n-map.at("lemma"),
  counter: theorem-counter,
  render: render-fn.with(fill: red.darken(20%)),
)

#let (definition-counter, definition-box, definition, show-definition) = make-frame(
  "definition",
  theorion-i18n-map.at("definition"),
  inherited-levels: 2, // Create new counter with 2 inherited levels.
  render: render-fn.with(fill: orange),
)

#let warning-box = note-box.with(
  fill: rgb("#8250DF"),
  title: theorion-i18n-map.at("warning"),
  icon-name: "alert",
)

#let remark-box = remark // Fix inconsistent naming.


// Add functionality.
#let compact-restate(labels, numbered: true) = {
  theorion-restate(
    filter: it => labels.contains(it.label),
    render: it => (
      prefix: none, title: auto, full-title: auto, body,
      ) => if numbered { block[
          *#full-title* \ #body
        ] } else { block[
          *#capitalize(it.kind) #{ if it.title != "" {[ (#title) ]} }* \ #body
        ] }
  )
}

#let examples = example.with(title: context {
    if text.lang == "sv" {[Exempel]} else {[Examples]}
  }
)