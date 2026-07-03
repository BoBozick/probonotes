#import "imports.typ": *
#import "utils.typ": capitalize

// Add custom names.

#let probonotes-i18n-map = (
  examples: (
    en: (us: "Examples", gb: "Examples"),
    sv: "Exempel",
  ),
)

#{theorion-i18n-map += probonotes-i18n-map}

// Add simple containers.
#let simple(
  default-name: [],
  ..args,
) = {
  let contents = args.pos() // Into array.
  if contents.len() > 2 {
    panic(
      "Invalid number of arguments for simple container: " +
      "expected 0, 1, or 2: " +
      "received " + str(contents.len())
    )
  }

  let body = contents.remove(-1, default: [])

  let name = contents.first(default: default-name)
  let name-str = if type(name) == content and name.has("text") {
    name.text
  } else {
    str(name)
  }
  let translations = theorion-i18n-map.at(name-str, default: none)
  let title = if translations == none {
    name
  } else {
    theorion-i18n(translations)
  }

  [#emph(title).#sym.space#body]
}

#let proof = simple.with(default-name: "proof")
#let problem = simple.with(default-name: "problem")
#let solution = simple.with(default-name: "solution")
#let example = simple.with(default-name: "example")
#let examples = simple.with(default-name: "examples")


// Modify complex containers with environments.
#let (theorem-counter, theorem-box, theorem, show-theorem) = make-frame(
  "theorem",
  theorion-i18n-map.at("theorem"),
  inherited-levels: 1,
  render: render-fn.with(fill: red.darken(20%)),
)

#let (lemma-counter, lemma-box, lemma, show-lemma) = make-frame(
  "lemma",
  theorion-i18n-map.at("lemma"),
  counter: theorem-counter,
  render: render-fn.with(fill: red.darken(20%)),
)

#let (corollary-counter, corollary-box, corollary, show-corollary) = make-frame(
  "corollary",
  theorion-i18n-map.at("corollary"),
  counter: theorem-counter,
  render: render-fn.with(fill: red.darken(20%)),
)

#let (proposition-counter, proposition-box, proposition, show-proposition) = make-frame(
  "proposition",
  theorion-i18n-map.at("proposition"),
  counter: theorem-counter,
  render: render-fn.with(fill: red.darken(20%)),
)

#let (definition-counter, definition-box, definition, show-definition) = make-frame(
  "definition",
  theorion-i18n-map.at("definition"),
  inherited-levels: 1,
  render: render-fn.with(fill: orange),
)

#let (axiom-counter, axiom-box, axiom, show-axiom) = make-frame(
  "axiom",
  theorion-i18n-map.at("axiom"),
  inherited-levels: 0,
  render: render-fn.with(fill: orange),
)

#let (postulate-counter, postulate-box, postulate, show-postulate) = make-frame(
  "postulate",
  theorion-i18n-map.at("postulate"),
  inherited-levels: axiom-counter,
  render: render-fn.with(fill: orange),
)


// Add complex containers.

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
