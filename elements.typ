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

// Capitalize first letter in string.
#let capitalize(text) = {
  upper(text.first()) + text.slice(1)
}