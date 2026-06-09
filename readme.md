# Probonotes 📝

Probonotes is a Typst styling package for mathematical notes with theorem environments and mathematical notation.

> **Note:** This package is primarily a personal project. It is not published to the official Typst repository, but you can easily [install it locally](https://github.com/typst/packages?tab=readme-ov-file#local-packages) to use in your own documents.

The name is a [double entendre](https://en.wikipedia.org/wiki/Double_entendre)
of _pro bono publico_ (for the public good)
and _pro Bo's notes_ (for my notes).

## Features ✨

- **Document Styling**: Unified layout with robust paragraph tuning, table of contents formatting, and a well-structured title page.
- **Theorem Environments**: Built on top of [TheOrion](https://github.com/OrangeX4/typst-theorion/) as an even easier interface for various numbered and unnumbered styled containers.
- **Notation Library**: Shorthands for algebra, analysis, probability, and statistics.

## Usage 🚀

1. Clone or download this repository to your local Typst packages directory.
2. Initialize your document by importing the package and applying the `style` function:

```typst
#import "@local/probonotes:0.2.1": *

#show: style.with(
  course-name: "Geometry",
  course-code: "MM1234",
  language: "en",
  contents: true,
  end-space: 0em,
)

= Triangles

== Pythagoras

#theorem(title: "Pythagorean")[
  In a right-angled triangle,
  $ a^2 + b^2 = c^2. $ 
]

#lemma[
  $ c = sqrt(a^2 + b^2) $
]

== Visualization

#tip[
  Use a ruler when drawing polygons.
]
```

Examples can be found in [examples/](examples/).

### Dependencies

- [TheOrion](https://github.com/OrangeX4/typst-theorion/)
- [Physica](https://github.com/Leedehai/typst-physics/)

### License

Released under the **MIT License**.
