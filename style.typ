#import "imports.typ": super-T-as-transpose, show-theorion


#let style(
  // Title and subtitle
  course-name: "", // Title, also set as the exported PDF title.
  course-code: "", // Subtitle.
  title-size: 30pt,
  subtitle-size: 16pt,
  title-space: 0em,

  // Layout
  size: 12pt,
  margin: 0.5cm,   // 0.5cm for computer, 0.1cm for phone.
  width: 14cm,     // 14-16cm for computer, 8cm for phone.
  height: auto,
  end-space: 0em,  // 40em to cover computer screen.
  heading-break: false,

  // Elements
  language: "en",  // sv for Swedish.
  contents: false,
  memes: true,

  doc
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
    }
  )

  show heading.where(level: 1): it =>{
    if heading-break and not it.body == [Contents] {
      pagebreak()
    }
    set text(size: size + 8pt)
    it
  }
  show heading.where(level: 2): it =>{
    set text(size: size + 2pt)
    smallcaps(it)
  }
  show heading.where(level: 3): it =>{
    set text(size: size)
    it
  }
  show heading.where(level: 4): set heading(
    outlined: false,
  )

  // Title
  set document(title: course-name)
  show title: it =>{
    set text(size: title-size)
    set align(center)
    it
  }
  let subtitle = {
    set text(size: subtitle-size)
    set align(center)
    course-code
  }
  let make-title(title-content, subtitle-content) = {
    if title-content != "" {
      align(center, {
        title()
        v(-title-size * 0.4)
        text(size: subtitle-size, subtitle-content)
        v(title-space)
        }
      )
    }
  }

  // Outline
  show outline.entry: it => link(
    it.element.location(),
    // Drop the fill and the page.
    it.indented(it.prefix(), it.body()),
  )
  show outline.entry.where(
    level: 1
  ): set text(weight: "bold")
  show outline.entry.where(
    level: 2
  ): smallcaps

  // Text
  set text(
    size: size,
    font: "New Computer Modern",

    lang: language,
    region: "SE",
  )
  set terms(
    separator: " ",
  )
  set enum(
    numbering: "(i)",
  )
  show link: underline

  // Math
  set math.mat(delim: "[")
  set math.vec(delim: "[")
  show math.mat: math.display
  show math.vec: math.display
  show math.equation.where(block: false): set math.frac(style: "horizontal")
  
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
  show math.equation.where(block: false): box // Prevent line wrapping.
  show <meme>: it => if not memes {} else {it}
  show image: it => align(center, it)
  
  show: show-theorion

  // MAKE DOCUMENT
  
  // Title and headings
  if course-name != "" {
    title()
    v(-title-size * 0.4)
    subtitle
    v(title-space)
  }
  if contents {outline()}

  // Document
  doc
  v(end-space)
}