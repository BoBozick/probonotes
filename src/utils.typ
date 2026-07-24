// Capitalize first letter in string.
#let capitalize(text) = {
  upper(text.first()) + text.slice(1)
}

// Display list that aligns with bullet lists regardless of marker.
#let custom-list(
    ..children,
    body-indent: 0.5em, // Base body indent.
    indent: 0pt,
    marker: ([•], [‣], [–]),
    spacing: auto,
    tight: true,
) = context {
  let bullet-width = measure(sym.bullet).width // Typically 9.34pt.
  let marker-width = measure(marker).width
  let new-body-indent = bullet-width - marker-width + body-indent

  list(
    ..children,
    body-indent: new-body-indent,
    indent: indent,
    marker: marker,
    spacing: spacing,
    tight: tight,
  )
}

// Pads `body` to the maximum width found among itself and the `among` array elements.
#let max-width-box(body, among: (), alignment: start) = context {
  let among-flattened = if type(among) == array { among } else { (among,) }
  let candidates = (body,) + among-flattened

  let max-w = calc.max(..candidates.map(it => measure(it).width))

  box(width: max-w, align(alignment, body))
}

// Pads each item in `items` to the maximum width found among them,
// aligning each according to `alignment`.
#let match-widths(..items, alignment: start) = {
  let elements = items.pos()
  assert(type(elements) == array)

  let make-element = max-width-box.with(among: elements, alignment: alignment)
  elements.map(it => make-element(it))
}

// Add delimiters for notation.

#let delim-pairs = (
  "(": (math.paren.l, math.paren.r),
  "[": (math.bracket.l, math.bracket.r),
  "{": (math.brace.l, math.brace.r),
  "<": (math.chevron.l, math.chevron.r),
  "|": (math.bar.v, math.bar.v),
  "||": (math.bar.v.double, math.bar.v.double),
)

#let get-delim-pair(delim: "(") = {
  return delim-pairs.at(delim, default: (delim, delim))
}

#let delimiters(
  ..args,
  cond: none,
  operator: none,
  delim: "(",
  set-builder: $|$,
  size: 100% + 0pt,
) = {
  let body = $#args.pos().join($,$)$
  if cond != none { body = $#body mid(#set-builder) #cond$ }

  let (left, right) = get-delim-pair(delim: delim)
  let delimited = $lr(#left #body #right, size: size)$
  
  if operator != none { delimited = $op(operator) #delimited$ }
  
  return delimited
}
