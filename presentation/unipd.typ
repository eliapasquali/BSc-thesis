#import "@preview/polylux:0.3.1": logic, utils

#let unipd-red = rgb("#9b0014");
#let unipd-gray = rgb("#484f59");
#let unipd-lightgray = rgb("#fbfef9");

#let unipd-author = state("unipd-author", none)
#let unipd-title = state("unipd-title", none)
#let unipd-date = state("unipd-date", none)
#let unipd-progress-bar = state("unipd-progress-bar", true)

#let unipd-theme(
  aspect-ratio: "16-9",
  author: none,
  title: none,
  date: none,
  progress-bar: true,
  body,
) = {
  set page(
    paper: "presentation-" + aspect-ratio,
    margin: 0em,
    header: none,
    footer: none,
  )
  set document(
    title: title,
    author: author,
  )
  set text(size: 22pt)
  set list(marker: (text(fill: unipd-red)[●], text(fill: unipd-red)[--]))
  show footnote.entry: set text(size: .6em)

  unipd-progress-bar.update(progress-bar)
  unipd-author.update(author)
  unipd-title.update(title)
  unipd-date.update(date)

  body
}

#let title-slide(subtitle: none) = {
  logic.polylux-slide({
    place(image("images/background.svg", width: 100%))
    place(
      bottom + right,
      dx: -2%,
      dy: -2%,
      image("images/logo.svg", width: 30%),
    )
    set text(fill: white)
    v(15%)
    align(
      center,
      box(inset: (x: 2em), text(size: 44pt, unipd-title.display())),
    )
    if (subtitle != none) {
      align(
        center,
        box(inset: (x: 2em), text(size: 24pt, subtitle)),
      )
    }
    v(8%)
    h(7.5%)
    text(size: 20pt, "Laureando: " + unipd-author.display())
    linebreak()
    h(7.5%)
    text(size: 18pt, unipd-date.display())
  })
  logic.logical-slide.update(0)
}

#let slide(
  title: none,
  header: none,
  footer: none,
  hide-section: false,
  new-section: none,
  body,
) = {
  let body = pad(x: 2em, y: .1em, body)

  let progress-barline = locate(loc => {
    if unipd-progress-bar.at(loc) {
      let cell = block.with(
        width: 100%,
        height: 100%,
        above: 0pt,
        below: 0pt,
        breakable: false,
      )

      utils.polylux-progress(ratio => {
        grid(
          rows: 4pt,
          columns: (ratio * 100%, 1fr),
          cell(fill: unipd-red),
          cell(fill: unipd-gray),
        )
      })
    } else { [] }
  })

  let header-text = {
    if header != none {
      header
    } else if title != none {
      if new-section != none {
        utils.register-section(new-section)
      }
      set text(fill: white)
      pad(
        x: 0.4em,
        top: 0.1em,
        bottom: 0.2em,
        grid(
          columns: (55%, 30%, 15%),
          align(horizon + left, heading(level: 2, title)),
          if (hide-section) {
            box()
          } else {
            align(horizon + right, text(
              fill: unipd-red.lighten(65%),
              utils.current-section,
            ))
          },
          align(top + right, image("images/logo_white.svg")),
        ),
      )
    } else { [] }
  }

  let header = {
    set align(top)
    block(fill: unipd-red, grid(
      rows: (auto, auto),
      progress-barline,
      header-text,
    ))
  }

  let footer = {
    set text(size: 10pt)
    set align(center + bottom)
    let cell(fill: none, it) = rect(
      width: 100%,
      height: 100%,
      inset: 1mm,
      outset: 0mm,
      fill: fill,
      stroke: none,
      align(horizon, text(fill: white, it)),
    )
    if footer != none {
      footer
    } else {
      place(
        bottom,
        image("images/background_wave.svg", width: 100%),
      )
      show: block.with(width: 100%, height: auto)
      grid(
        columns: (50%, 25%, 15%, 10%),
        rows: (1.5em, auto),
        cell(box()),
        cell(unipd-author.display()),
        cell(unipd-date.display()),
        cell(logic.logical-slide.display() + [~/ ~] + utils.last-slide-number),
      )
    }
  }

  set page(
    margin: (top: 3em, bottom: 1.5em, x: 0em),
    header: header,
    footer: footer,
    footer-descent: 0em,
    header-ascent: .6em,
  )

  logic.polylux-slide(body)
}

#let focus-slide(
  background-color: none,
  background-img: none,
  body,
) = {
  let background-color = if background-img == none and background-color == none {
    unipd-red
  } else {
    background-color
  }

  set page(fill: background-color, margin: 1em) if background-color != none
  set page(
    background: {
      set image(fit: "stretch", width: 100%, height: 100%)
      background-img
    },
    margin: 1em,
  ) if background-img != none

  set text(fill: white, size: 2em)

  logic.polylux-slide(align(horizon + center, body))
}

#let bullet-slide(
  title: none,
  header: none,
  footer: none,
  hide-section: false,
  new-section: none,
  ..bullets
) = slide(
  title: title,
  header: header,
  footer: footer,
  hide-section: hide-section,
  new-section: new-section,
  grid(
    rows: (1fr, ) * (bullets.pos().len() + 2),
    ..(([], ) + bullets.pos().map(b => align(horizon, list(b))) + ([], ))
  )
)

#let centered-slide(
  title: none,
  header: none,
  footer: none,
  hide-section: false,
  new-section: none,
  body,
) = slide(
  title: title,
  header: header,
  footer: footer,
  hide-section: hide-section,
  new-section: new-section,
  {
    v(1fr)
    body
    v(1fr)
  }
)

#let one-by-one-slide(
  title: none,
  header: none,
  footer: none,
  hide-section: false,
  ..body,
) = centered-slide(
  title: title,
  header: header,
  footer: footer,
  hide-section: hide-section,
  one-by-one(..body)
)

#let acronym(word) = word.split(" ").map(w => strong(w.at(0)) + smallcaps(w.slice(1))).join(" ")
