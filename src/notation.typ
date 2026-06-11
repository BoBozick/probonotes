#import "imports.typ": dd, dv, pdv
#import "utils.typ": delimiters

// DELIMITERS

#let parens = delimiters(delim: "(")
#let brackets = delimiters(delim: "[")
#let braces = delimiters(delim: "{")
#let chevrons = delimiters(delim: "<")

// ALGEBRA

#let ort = math.tack.t // Orthogonal

#let col = math.op("col") // Column space
#let row = math.op("row") // Row space
#let im = math.op("im") // Image
#let coker = math.op("coker") // Cokernel
#let span = math.op("span") // Span
#let rank = math.op("rank") // Rank
#let nullity = math.op("nullity") // Nullity
#let proj = math.op("proj") // Projection
#let adj = math.op("adj") // Adjugate
#let sgn = math.op("sgn") // Signum
#let diag = math.op("diag") // Diagonal
#let real = math.op("Re")
#let imaginary = math.op("Im")

// Vectors
#let ve(symbol) = math.upright(math.bold(symbol)) // Vector
#let hve(symbol) = math.accent(ve(symbol), math.hat) // Vector with hat

#let iprod = chevrons

// STATISTICS

#let choose(n, k) = math.vec(n, k, delim: "(")

// Distributions
#let geom = math.op("Geom")
#let bin = math.op("Bin")
#let pois = math.op("Pois")
#let hyp = math.op("Hyp")
#let ex = math.op("Exp")
#let gamm = math.op("Gamma")
#let no = math.op(math.cal("N"))

// Operators
#let var(symbol) = $op("var") [#symbol]$
#let cov(X, Y) = $op("cov") [#X, #Y]$
#let cor(X, Y) = $rho [#X, #Y]$
#let std(symbol) = $op("std") [#symbol]$
#let ev(symbol) = $op(EE) [#symbol]$
#let pr(symbol) = $op(PP) (#symbol)$

// Variables
#let mse = $"MSE"$

// ANALYSIS
#let argmin = math.op($"arg" med "min"$, limits: true)
#let argmax = math.op($"arg" med "max"$, limits: true)

// Trigonometry
#let arccot = math.op("arccot")
#let arccsc = math.op("arccsc")
#let arcsec = math.op("arcsec")