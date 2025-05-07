#show figure: set block(breakable: true)
#figure( // start figure preamble
  
  kind: "tinytable",
  supplement: "Table", // end figure preamble

block[ // start block

#let nhead = 1;
#let nrow = 15;
#let ncol = 4;

  #let style-array = ( 
    // tinytable cell style after
(pairs: ((0, 0), (0, 1), (0, 2), (0, 3), (0, 4), (0, 5), (0, 6), (0, 7), (0, 8), (0, 9), (0, 10), (0, 11), (0, 12), (0, 13), (0, 14), (0, 15), (1, 0), (1, 1), (1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7), (1, 8), (1, 9), (1, 10), (1, 11), (1, 12), (1, 13), (1, 14), (1, 15), (2, 0), (2, 1), (2, 2), (2, 3), (2, 4), (2, 5), (2, 6), (2, 7), (2, 8), (2, 9), (2, 10), (2, 11), (2, 12), (2, 13), (2, 14), (2, 15), (3, 0), (3, 1), (3, 2), (3, 3), (3, 4), (3, 5), (3, 6), (3, 7), (3, 8), (3, 9), (3, 10), (3, 11), (3, 12), (3, 13), (3, 14), (3, 15),), ),
  )

  // tinytable align-default-array before
  #let align-default-array = ( left, left, left, left, ) // tinytable align-default-array here
  #show table.cell: it => {
    if style-array.len() == 0 {
      it 
    } else {
      let tmp = it
      for style in style-array {
        let m = style.pairs.find(k => k.at(0) == it.x and k.at(1) == it.y)
        if m != none {
          if ("fontsize" in style) { tmp = text(size: style.fontsize, tmp) }
          if ("color" in style) { tmp = text(fill: style.color, tmp) }
          if ("indent" in style) { tmp = pad(left: style.indent, tmp) }
          if ("underline" in style) { tmp = underline(tmp) }
          if ("italic" in style) { tmp = emph(tmp) }
          if ("bold" in style) { tmp = strong(tmp) }
          if ("mono" in style) { tmp = math.mono(tmp) }
          if ("strikeout" in style) { tmp = strike(tmp) }
        }
      }
      tmp
    }
  }

  #align(center, [

  #table( // tinytable table start
    columns: (auto, auto, auto, auto),
    stroke: none,
    align: (x, y) => {
      let sarray = style-array.filter(a => "align" in a)
      let sarray = sarray.filter(a => a.pairs.find(p => p.at(0) == x and p.at(1) == y) != none)
      if sarray.len() > 0 {
        sarray.last().align
      } else {
        left
      }
    },
    fill: (x, y) => {
      let sarray = style-array.filter(a => "background" in a)
      let sarray = sarray.filter(a => a.pairs.find(p => p.at(0) == x and p.at(1) == y) != none)
      if sarray.len() > 0 {
        sarray.last().background
      }
    },
    // tinytable lines before

    table.header(
      repeat: true,
[**Characteristics**], [**testing**  
N = 457], [**training**  
N = 913], [**Overall**  
N = 1,370],
    ),

    // tinytable cell content after
[___Genotype___], [NA], [NA], [NA],
[One allele F508del], [158 (35%)], [319 (35%)], [477 (35%)],
[Others or Unknown], [66 (14%)], [84 (9.2%)], [150 (11%)],
[Two alleles F508del], [233 (51%)], [510 (56%)], [743 (54%)],
[___Gender___], [NA], [NA], [NA],
[Female], [240 (53%)], [453 (50%)], [693 (51%)],
[Male], [217 (47%)], [460 (50%)], [677 (49%)],
[___Ethnicity___], [NA], [NA], [NA],
[Hispanic], [19 (4.3%)], [24 (2.7%)], [43 (3.3%)],
[Non-Hispanic], [421 (96%)], [853 (97%)], [1,274 (97%)],
[Unknown], [17], [36], [53],
[___Visit number___], [49 (25)], [48 (22)], [48 (23)],
[___Age baseline___], [3.17 (0.15)], [3.17 (0.17)], [3.17 (0.16)],
[___Follow up years___], [9.9 (3.6)], [10.0 (3.6)], [9.9 (3.6)],
[___Height baseline___], [94.2 (3.9)], [94.1 (4.1)], [94.1 (4.1)],

    // tinytable footer after

  ) // end table

  ]) // end align

] // end block
) // end figure
