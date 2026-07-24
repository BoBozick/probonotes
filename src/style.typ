#import "imports.typ": show-theorion, super-T-as-transpose


#let url(link) = underline(link)

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
  max-heading-lvl: 3, // Maximum outlined and numbered heading level.

  // Content
  language: "en", // sv for Swedish.
  contents: false,
  memes: true,
  doc,
) = {
  // SET PREFERENCES.

  // Headings
  set heading(
    numbering: (..numbers) => {
      let nums = numbers.pos()

      if nums.len() > max-heading-lvl or nums.first() == 0 {
        return "---"
      }

      numbering("1.1.", ..nums)
    },
  )

  show heading: it => {
    let heading-sizes = size * (20, 14, 12) / 12
    let target-size = heading-sizes.at(it.level - 1, default: size)
    set text(size: target-size)
    
    set heading(outlined: false) if it.level > max-heading-lvl

    if it.level == 2 {
      return smallcaps(it)
    }

    if heading-break and it.level == 1 and not it.body == [Contents] {
      pagebreak()
    }

    it
  }

  // Title
  let author-array = if type(author) == array {
    author
  } else if author != "" {
    (author,)
  } else {
    ()
  }
  
  set document(title: course-name, date: date, author: author-array)

  let make-title(title-content, subtitle-content, author-content, date-content) = {
    if title-content != "" {
      align(center, {
        text(title-content, size: title-size, weight: "bold")
        v(-title-size * 0.85)
        text(subtitle-content, size: subtitle-size,)

        if author-content != "" or date-content != none {
          v(size)

          author-date-size = calc.max(subtitle-size * 0.8, size)
          set text(size: author-date-size)

          author-content

          if date-content != none {
            if author-content != "" [ \ ]

            if date-content == auto {
              datetime.today().display()
            } else {
              date-content.display()
            }
          }
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

  show outline.entry.where(level: 1): set text(weight: "bold")
  show outline.entry.where(level: 2): smallcaps

  // Text
  set text(
    size: size,
    font: ("New Computer Modern", "STIX Two Text", "Times New Roman"),

    lang: language,
    region: "SE",
  )
  show raw: set text(
    font: ("Monaspace Neon", "Monaspace Neon NF", "DejaVu Sans Mono"),
    features: ("cv01": 1), // Use normal 0.
  )

  set terms(separator: " ")
  set enum(numbering: "(i)")

  show link: it => if type(it.dest) == str { url(it) } else { it }

  // Math
  set math.mat(delim: "[")
  set math.vec(delim: "[")

  show math.mat: math.display
  show math.vec: math.display

  show math.equation.where(block: false): set math.frac(style: "horizontal")
  show math.equation: box

  show: super-T-as-transpose
  show: show-theorion

  // Layout
  set par(leading: 0.80em)

  set page(
    margin: margin,
    height: height,
    width: width,
  )

  // Graphics
  show <meme>: it => if memes { it } else { none }
  show image: it => align(center, it)
  show figure.where(kind: image): set align(center)
  set figure(numbering: none)

  // MAKE DOCUMENT

  // Title and headings
  make-title(course-name, course-code, author, date)

  if contents { outline() }

  // Document
  doc
  
  v(end-space)
}
