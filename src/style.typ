#import "imports.typ": show-theorion, super-T-as-transpose

#let url(link) = underline(link)

#let style(
  // Title and subtitle
  course-name: "", // Title, also set as the exported PDF title.
  course-code: "", // Subtitle.
  author: none,
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
  // Metadata
  if author == () {
    panic("parameter error: set author to `none` instead of `()`")
  }

  if date == auto { date = datetime.today() }
  
  set document(
    title: course-name,
    author: if author == none { () } else { author },
    date: date,
  )

  // Headings
  set heading(numbering: (..numbers) => {
      let nums = numbers.pos()

      if nums.len() > 3 or nums.first() == 0 {
        return "---"
      }

      numbering("1.", ..nums)
    }
  )
  
  let heading-sizes = (size + 8pt, size + 2pt, size + 0pt)
  show heading: it => {
    let target-size = heading-sizes.at(it.level - 1, default: size)
    set text(size: target-size)
    
    if it.level == 2 {
      return smallcaps(it)
    }

    if heading-break and it.level == 1 and it.body != [Contents] {
      pagebreak()
    }

    it
  }

  // Outline
  show outline.entry: it => link(
    it.element.location(),
    it.indented(it.prefix(), it.body()), // Drop the fill and the page.
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

  // Title
  align(center, {
    set par(leading: 0.6 * size)

    if course-name != "" {
      text(course-name, size: title-size, weight: "bold")
      linebreak()
    }

    if course-code != "" {
      text(course-code, size: subtitle-size)
      linebreak()
    }

    if author != none or date != none {
      let author-date-size = calc.max(subtitle-size * 0.8, size)
      set text(size: author-date-size)

      if type(author) == array {
        author.join(" ")
      } else {
        author
      }

      if date != none {
        if author != none { linebreak() }

        date.display()
      }
    }

    v(title-space)
  })

  // Outline

  set heading(outlined: false)

  if contents { outline() }

  show heading.where(level: 1): set heading(outlined: true)
  show heading.where(level: 2): set heading(outlined: true)
  show heading.where(level: 3): set heading(outlined: true)

  // Document

  doc
  
  v(end-space)
}
