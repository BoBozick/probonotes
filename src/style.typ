#import "imports.typ": show-theorion, super-T-as-transpose


#let style(
  // Title and subtitle
  course-name: "", // Title, also set as the exported PDF title.
  course-code: "", // Subtitle.
  author: "",
  date: none,
  title-size: 30pt,
  subtitle-size: 16pt,
  title-space: 0em,

  // Layout
  size: 12pt,
  margin: 0.5cm,   // 0.5cm for computer, 0.1cm for phone.
  width: 14cm,     // 14-16cm for computer, 8cm for phone.
  height: auto,
  end-space: 40em, // 40em to cover computer screen.
  heading-break: false,

  // Content
  language: "en", // sv for Swedish.
  contents: false,
  memes: true,
  doc,
) = {
  // SET PREFERENCES.

  // Headings
  set heading(
    numbering: (..levels) => {
      if levels.pos().len() <= 3 {
        levels.pos().map(str).join(".") + "."
      } else {
        "---"
      }
    },
  )

  show heading.where(level: 1): it => {
    if heading-break and not it.body == [Contents] {
      pagebreak()
    }
    set text(size: size + 8pt)
    it
  }
  show heading.where(level: 2): it => {
    set text(size: size + 2pt)
    smallcaps(it)
  }
  show heading.where(level: 3): it => {
    set text(size: size)
    it
  }
  show heading.where(level: 4): set heading(
    outlined: false,
  )

  // Title
  let doc-author = if type(author) == array { author } else if author != "" { (author,) } else { () }
  set document(title: course-name, author: doc-author, date: date)

  let make-title(title-content, subtitle-content, author-content, date-content) = {
    if title-content != "" {
      align(center, {
        text(size: title-size, title-content, weight: "bold")
        v(-title-size * 0.85)
        text(size: subtitle-size, subtitle-content)

        if author-content != "" or date-content != none {
          v(0em)
          text(size: calc.max(subtitle-size * 0.8, size), {
            author-content
            if date-content != none {
              if author-content != "" [ \ ]
              if date-content == auto { datetime.today().display() } else { date-content.display() }
            }
          })
        }
        v(title-space)
      })
    }
  }

  // Outline
  show outline.entry: it => link(
    it.element.location(),
    // Drop the fill and the page.
    it.indented(it.prefix(), it.body()),
  )
  show outline.entry.where(
    level: 1,
  ): set text(weight: "bold")
  show outline.entry.where(
    level: 2,
  ): smallcaps

  // Text
  set text(
    size: size,
    font: "New Computer Modern",

    lang: language,
    region: "SE",
  )
  show raw: set text(
    font: ("Monaspace Neon NF", "DejaVu Sans Mono"),
    features: ("cv01": 1), // Use normal 0.
  )
  set terms(
    separator: " ",
  )
  set enum(
    numbering: "(i)",
  )
  show link: it => {
    // Only underline URL links.
    if type(it.dest) == str {
      let first-chars = it.dest.slice(0, 3)
      if first-chars in ("htt", "www") { return underline(it) }
    }
    return it
  }

  // Math
  set math.mat(delim: "[")
  set math.vec(delim: "[")
  show math.mat: math.display
  show math.vec: math.display
  show math.equation.where(block: false): set math.frac(style: "horizontal")
  show math.equation: box

  show: super-T-as-transpose

  // Layout
  set par(
    leading: 0.80em,
  )
  set page(
    margin: margin,
    height: height,
    width: width,
  )

  // Graphics
  show <meme>: it => if not memes {} else { it }
  show image: it => align(center, it)
  set figure(numbering: none)

  show: show-theorion

  // MAKE DOCUMENT

  // Title and headings
  make-title(course-name, course-code, author, date)

  if contents { outline() }

  // Document
  doc
  v(end-space)
}
