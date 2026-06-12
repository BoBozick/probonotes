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
  size: 100% + 0pt,
  scale-builder: true,
) = {
  let (left, right) = get-delim-pair(delim: delim)

  let body = $#args.pos().join($,$)$

  if cond != none {
    let set-builder = if scale-builder { $mid(|)$ } else { $|$ }
    body = $#body #set-builder #cond$
  }
  
  $lr(op(operator) #left #body #right, size: size)$
}

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
