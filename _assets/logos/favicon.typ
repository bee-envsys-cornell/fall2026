// Course favicons: the red hexagon of the course icons with one piece of each course's graphic
// and no lettering, since nothing is legible at 16 px.
// Render:  typst compile --ppi 72 --input course=<ej|envsys|envdata> favicon.typ favicon.png
#let course = sys.inputs.at("course", default: "ej")
#let red = rgb("#b32025")
#set page(width: 256pt, height: 256pt, margin: 0pt, fill: none)

#place(polygon(fill: red, (128pt, 4pt), (236pt, 66pt), (236pt, 190pt), (128pt, 252pt), (20pt, 190pt), (20pt, 66pt)))
#let inner = ((128pt, 35pt), (209pt, 81.5pt), (209pt, 174.5pt), (128pt, 221pt), (47pt, 174.5pt), (47pt, 81.5pt))
#let dot(x, y, r, fill) = place(dx: x - r, dy: y - r, circle(radius: r, fill: fill))

#if course == "ej" {
  // one facility and the area within reach of it, over two tracts
  place(polygon(fill: rgb("#cfe5f4"), ..inner))
  place(polygon(fill: rgb("#6fb0dc"), (128pt, 35pt), (209pt, 81.5pt), (209pt, 174.5pt), (150pt, 208pt), (112pt, 120pt)))
  place(dx: 128pt - 44pt, dy: 128pt - 44pt, circle(radius: 44pt, stroke: 15pt + rgb("#dba520")))
  dot(128pt, 128pt, 17pt, rgb("#104080"))
} else if course == "envsys" {
  // three linked nodes from the system diagram
  place(polygon(fill: white, ..inner))
  let pts = ((128pt, 80pt), (84pt, 160pt), (172pt, 160pt))
  for (a, b) in ((0, 1), (1, 2), (2, 0)) {
    place(line(start: pts.at(a), end: pts.at(b), stroke: 11pt + black))
  }
  dot(128pt, 80pt, 25pt, rgb("#d8a830"))
  dot(84pt, 160pt, 25pt, rgb("#b85060"))
  dot(172pt, 160pt, 25pt, rgb("#104080"))
} else {
  // the density curve
  place(polygon(fill: white, ..inner))
  let n = 60
  let curve = range(n + 1).map(i => {
    let x = 56pt + 144pt * i / n
    let z = (i / n - 0.5) / 0.17
    (x, 178pt - 104pt * calc.exp(-z * z / 2))
  })
  place(polygon(fill: rgb("#b8b8b8"), stroke: (paint: black, thickness: 9pt, join: "round"), ..curve))
  place(line(start: (50pt, 178pt), end: (206pt, 178pt), stroke: (paint: black, thickness: 9pt, cap: "round")))
}
