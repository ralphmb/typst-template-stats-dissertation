#import "@preview/polylux:0.3.1": *
#set page(paper: "presentation-16-9")

#set text(size: 25pt)
#import themes.clean: *
#set text(font: "Inria Sans")

#show table: set text(20pt)
#set table(align:right)

#show: clean-theme.with(
  footer: [John Doe, Coventry University],
)

#title-slide(
  title: [Project Title],
  authors:[John Doe],
  date:[Jan 1 1970]
)

#new-section-slide("Introduction")


#slide(title:[Project Aims])[
  - The quick brown fox
  - jumped over the
  - lazy dog
]

#slide()[
  #side-by-side[
    == Here's a plot
    - Check it out
  ][
  #figure(
    image("./assets/contourplot_logistic.png", fit:"contain")
  )
  ]
]
