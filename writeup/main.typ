#import "./other/template.typ": getHeader

#let my_name = "John Doe"
#let thesis_title = "Project Title"
#let thesis_domain = "Mathematics and Statistics"
#let my_institution = "Coventry University"

#set document(author: my_name, title: thesis_title)
#set text(font: "New Computer Modern", lang: "en")
#set heading(numbering: "1.1")
#set par(justify: true)



// Title Page
#v(0.25fr)
#align(center)[
  #text(2em, weight: 700, thesis_title)
]
#pad(
  top: 0.7em,
  grid(
    columns: (1fr),
    gutter: 1em,
    align(center)[
      *#my_name* \
      #thesis_domain \
      #my_institution \
    ]
  ),
)




// Table of contents
#outline(depth: 3, indent: true)
#pagebreak()


// Main body
#set page(numbering: "1", number-align: center)
#set page(header: getHeader(),
          margin: (x:30pt, y:50pt))
#counter(page).update(1)//

// Formatting for tables
// Highlighting top and left columns
#set table(
  fill: (x, y) =>
    if x == 0 or y == 0 {
      gray.lighten(40%)
    },
  align: right,
)
// Make the highlighted text bold
#show table.cell.where(x: 0): strong
#show table.cell.where(y: 0): strong

// Center them and make the text smaller
#show table: set text(8pt) 
#show table: set align(center)


// And here's where we include all the sections.

= Introduction
#include("./sections/introduction.typ")

#pagebreak(weak: true)


#set par(first-line-indent: 20pt) // Indents first line of a new paragraph
#set page(columns: 2)

= Review of Literature
#include("./sections/litreview.typ")


= Preliminary Steps

== Data Collection
#include("./sections/datacollection.typ")

== Exploratory Analysis
#include("./sections/exploratory.typ")


= Main Topic
#include("./sections/bigsection.typ")


// Bibliography section

#set page(header: [])
#set text(8pt)// Setting smaller text sizes to save paper
#bibliography("./sections/bibliography.bib")
//.bib files work here as in latex, get references in bibtex format and copy/paste them into it

#pagebreak(weak: true)

#set page(columns: 1)
#set text(7pt)
#set par(first-line-indent: 0pt)
#show table: set text(7pt)

#heading([Appendices], numbering:none)
#linebreak()

#include("./sections/appendix.typ")