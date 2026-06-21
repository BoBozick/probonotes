#import "imports.typ": dd, dv, pdv
#import "utils.typ": delimiters

// DELIMITERS

#let parens = delimiters.with(delim: "(")
#let brackets = delimiters.with(delim: "[")
#let braces = delimiters.with(delim: "{")
#let chevrons = delimiters.with(delim: "<")

// ALGEBRA

#let cycle(..args) = math.mat(..args, delim: "(")

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

// STATISTICS

#let choose(n, k) = math.mat((n,), (k,), delim: "(")

// Distributions
#let geom = math.op("Geom")
#let bin = math.op("Bin")
#let pois = math.op("Pois")
#let hyp = math.op("Hyp")
#let ex = math.op("Exp")
#let gamm = math.op("Gamma")
#let no = math.op(math.cal("N"))

// Operators
#let var = brackets.with(operator: "var")
#let cov = brackets.with(operator: "cov")
#let cor = brackets.with(operator: $rho$)
#let std = brackets.with(operator: "std")
#let ev = brackets.with(operator: $EE$)
#let pr = brackets.with(operator: $PP$)

// Variables
#let mse = $"MSE"$

// ANALYSIS
#let argmin = math.op($"arg" med "min"$, limits: true)
#let argmax = math.op($"arg" med "max"$, limits: true)

// Trigonometry
#let arccot = math.op("arccot")
#let arccsc = math.op("arccsc")
#let arcsec = math.op("arcsec")