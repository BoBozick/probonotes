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

// Computes uniformly padded boxes and passes them as an array to a callback function.
//
// - callback (function): An anonymous function that accepts the array of processed boxes,
//   e.g., `((even, odd)) => [ ... ]`.
// - alignment (alignment): Mechanical alignment of the text inside each box wrapper.
// - fill (none, color, paint): Optional background color fill for the generated boxes.
// - inset (length, dictionary): Internal padding/margin inside the boxes.
// - outboard (length): A minimum width threshold; forces boxes to stretch to this width
//   if content is smaller.
// - items (arguments): The varying content elements that need their widths equalized.
#let uniform-box(
  callback,
  alignment: start, 
  fill: none, 
  inset: 0pt, 
  outboard: 0pt, 
  ..items
) = context {
  let elements = items.pos()
  if elements.len() == 0 { return callback(()) }
  
  let max-width = calc.max(..elements.map(it => measure(it).width))
  let target-width = calc.max(max-width, outboard)
  
  let processed = elements.map(it => box(
    width: target-width, 
    fill: fill, 
    inset: inset, 
    align(alignment, it)
  ))
  
  callback(processed)
}
