#import "/lib.typ": *

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