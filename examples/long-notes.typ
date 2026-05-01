#import "/lib.typ": *

#show: style.with(
  course-name: "Analysis", // Title, also set as the exported PDF title.
  course-code: "AN1001",   // Subtitle.
  author: "John Doe",
  date: datetime(year: 2012, month: 8, day: 3),
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

  // Content
  language: "en",  // sv for Swedish.
  contents: true,
  memes: true,     // Whether contents with <meme> label are displayed.
)

= The Real Numbers

== Reals

=== Prerequisites

#theorem(title: [Induction])[
  Let $S subset.eq NN$. If
  + $1 in S$, and
  + $n in S ==> n + 1 in S$ (inductive step),
  then $S = NN$.
]

#definition(title: [Injective/Surjective/Bijective])[
  $f : X -> Y$ is _injective_ (or one-to-one) if
  $x_1 != x_2 ==> f(x_1) != f(x_2)$
  or equivalently if
  $f(x_1) = f(x_2) ==> x_1 = x_2$.
  
  $f$ is _surjective_ if $forall y space exists x : f(x) = y$.
  
  $f$ is _bijective_ if is both injective and surjective or equivalently
  if each $y$ is mapped to exactly one $x$.
]

=== Comparison

#definition(title: [Equality])[
  $a  = b <==> (forall epsilon > 0 => |a - b| < epsilon)$
]

#theorem(title: [Triangle Inequalities])[
  + $|a + b| <= |a| + |b|$
  + $|a - b| <= |a - c| + |c - b|$
  + $|a - b| >= ||a| - |b||$

  The reverse triangle inequality (iii) is seldom used.
]

=== Bounds

#definition(title: [Supremum Property or Axiom of Completeness])[
  Every bounded, nonempty set of real numbers has a least upper bound.
]

#note[
  The same does not apply for the rationals.
]

#definition(title: [Least Upper Bound])[
  Assume $s in RR$ is an upper bound for a set $A subset.eq RR$. Then,
  $ s = sup A #h(1em) <==> #h(1em)
  forall epsilon > 0 space exists a in A : s - epsilon < a. $
]

== Cardinality

#definition(title: [Cardinality])[
  A set $A$ has the same _cardinality_ as a set $B$ if
  there exists a bijective $f : A -> B$.
]

#definition(title: [Countable/Uncountable])[
  $A$ is _countably infinite_ if $NN tilde A$.

  $A$ is _countable_ if it is finite or countably infinite.

  Otherwise, $A$ is _uncountable_.
]

#theorem(title: [Countability])[
  $QQ$ is countable.

  #proof[
    Let $A_1 = {0}$ and let
    $ A_n = {plus.minus p slash q : p, q in NN_+, gcd(p, q) = 1,
    p + q = n} $
    for all $n >= 2$.
    Each $A_n$ is finite and
    every rational numbers appears in exactly one set.
  ]

  $RR$ is uncountable.

  #proof[
    Cantor's diagonalization method.
  ]

  $II$ is uncountable.

  #proof[
    $II = RR backslash QQ$ where $RR$ is uncountable and $QQ$ is countable.
  ]
]

#theorem(title: [Density of $QQ$ in $RR$])[
  + $forall a < b in RR space exists r in QQ : a < r < b$

  + $forall y in RR space exists (r_n) in QQ : (r_n) -> y$
]

#definition(title: [Axiom of Choice])[
  For any indexed family $cal(F)$ of nonempty sets,
  there exists a choice function $f$
  that selects one element from each set.
  That is,
  $ exists f : forall S in cal(F) : f(S) in S. $

  Note that this is equivalent to
  disjoint, nonempty $S subset.eq cal(F)$ for a set.
] <axiom-choice>

== Topology

=== Points

#definition(title: [Limit Point])[
  $x$ is a _limit point_ of $A$ if every $V_epsilon (x)$ intersects $A$
  at some point other than $x$.
]

#theorem(title: [Sequential Limit Point])[
  $x$ is a limit point of $A$ if $x = lim a_n$ for some
  $(a_n) subset.eq A : a_n != x space forall n in NN.$
]

#theorem(title: [Nested Interval Property])[
  Let $(I_n)$ be a nested sequence of nonempty closed
  and bounded intervals with
  $ I_1 supset.eq I_2 supset.eq I_3 supset.eq dots.h.c. $
  Then $ inter.big_(n=1)^oo I_n != emptyset. $
  In particular, there exists $a in inter.big_(n=1)^oo I_n$.
]

=== Open and Closed Sets

#definition(title: [Open/Closed Set])[
  $A subset.eq RR$ is _open_ if $forall a in A space exists V_epsilon (a)
  subset.eq A$ or equivalently if its complement is closed.
  
  $A subset.eq RR$ is _closed_ if it contains its limit points or
  equivalently if its complement is open.
]

#theorem(title: [Clopen Sets])[
  $RR$ and $emptyset$ are _clopen_ (both opened and closed).
]

#theorem(title: [Unions/Intersections])[
  Arbitrary unions of open sets are open;
  finite intersections of open sets are open.
  
  Arbitrary intersections of closed sets are closed;
  finite unions of closed sets are closed.  
]

=== Compactness

#definition(title: [Compact])[
  A set $K$ in a topological space is _compact_ if
  every open cover has a finite subcover.
]

#theorem(title: [Heine--Borel])[
  A set $K subset.eq RR^n$ is compact if and only if
  it is closed and bounded.
] <thm-heine-borel>

#theorem[
  $RR$ is not compact.

  $emptyset$ is compact.
]

#note[
  Compactness is like a generalization of closed intervals.
]

#theorem(title: [Tychonoff's])[
  The product of any collection of compact topological spaces
  is compact with respect to the product topology.
]

= The Basics of Limits

== Sequences

#definition(title: [Sequence])[
  A _sequence_ is a function whose domain is $NN.$
]

#definition(title: [Convergence])[
  A sequence _converges_ to $a$ if
  $ forall epsilon > 0 space exists N in NN :
  n >= N ==> |a_n - a| < epsilon $
  or equivalently if for any $V_epsilon (a)$ there exists a point
  in the sequence after which all terms are in $V_epsilon (a)$.
  In other words, if every $epsilon$-neighborhood of some point
  contains all but a finite number of the terms in $(a_n)$.

  We write this $lim_(n->oo) a_n = lim a_n = a$ or $a_n -> a$.

  #example[
    Template of a typical convergence proof:
    + Let $epsilon > 0$ be arbitrary.
    + Propose an $N in NN$ (found before writing the proof).
    + Assume $n >= N$.
    4. Show that $|a_n - a| < epsilon.$
  ]
]

#theorem(title: [Uniqueness of Limits])[
  The limit of a sequence, if it exists, is unique.
]

#corollary(title: [Subsequence Limits])[
  Subsequences of a convergent sequence converge to the same limit.
]

#theorem[
  A sequence $(ve(a))_n in RR^m$ converges to a limit $ve(b)$
  if and only if $a_i -> b_i$ for all coordinates $i in {1, 2, ..., m}$.
]

=== Bounded

#definition(title: [Bounded])[
  A sequence is _bounded_ if
  $exists M > 0 : |a_n| < M space forall n in NN$.
]

#lemma[
  $ "monotone & bounded" ==> "convergent" ==> "bounded" $
]

#theorem(title: [Bolzano--Weierstrass])[
  Each bounded sequence in $RR^n$ has a convergent subsequence.
] <thm-bolzano-weierstrass>

#definition(title: [Sequentially Compact])[
  A set $K subset RR^n$ is _sequentially compact_ if
  every sequence $(a_n) subset.eq K$ contains a convergent subsequence
  whose limit point is in $K$.
]

#lemma(title: [Real Sequential Compactness])[
  A set $K subset RR^n$
  is sequentially compact if and only if
  $K$ is closed and bounded.
] <thm-sequential-compactness>

#proof[
  We show the two implications seperately.

  If $K$ is sequentially compact
  it contains its limit points, hence being closed,
  and does not contain any unbounded sequences, hence being bounded.

  If $K$ is closed and bounded
  each sequence in it is bounded
  and thus, by  @thm-bolzano-weierstrass,
  contains a convergent subsequence
  with a limit point in the set,
  since a closed set contains all its limit points.
]

#theorem(title: [Metric Sequential Compactness])[
  In a metric space,
  the notions of
  sequential compactness, limit point compactness,
  countable compactness, and compactness
  are all equivalent
  (if one assumes the @axiom-choice.
]

=== Cauchy

#definition(title: [Cauchy Sequence])[
  A sequence $(a_n)$ is a _Cauchy sequence_ if
  $ forall epsilon > 0 space exists N in NN :
  m, n >= N ==> |a_n - a_m| < epsilon. $
]

#theorem(title: [Cauchy Criterion])[
  A sequence converges if and only if it is a Cauchy sequence.
]

== Functions

#theorem(title: [Function Limit])[ 
  Given $f : A -> RR$ with the limit point $c$,
  + $lim_(x->c) f(x) = L$ is equivalent to
  + if $forall (x_n) subset.eq A : (x_n != c "and" x_n -> c)$ it follows
  that $f(x_n) -> L$.
]

#note[
  In the $epsilon delta$-definition of limits,
  the additional restriction that $0 < abs(x - a)$
  is just a way to say $x != c.$
]

#definition(title: [Infinite Limit])[
  Given a limit point $c in D_f$, we say that $lim_(x->c) f(x) = oo$ if
  $ forall M space exists delta > 0 : 0 <|x - c| < delta ==> f(x) >=M. $
]

#theorem[
  Let $f$ and $g$ be functions from $D subset.eq RR^n$ to $RR^m$.
  If $f(x) -> A$ and $g(x) -> B$ as $x -> c in dash(D)$, then
  + $f(x) + g(x) -> A + B$
  + $f(x) dot g(x) -> A dot B$
  + $f(x)/g(x) -> A/B$ if $m = 1$ and $B != 0$
  + $A <= B$ if $m = 1$ and $f(x) <= g(x)$
    for all $x$ in a punctured neighborhood to $c$
]

#theorem[
  Let $Omega subset RR^n$ be a neighborhood around the origin and
  $f : Omega -> RR$ be a map with
  $ abs(f(ve(x)) - A) <= M(norm(ve(x))) -> 0 $
  as $norm(ve(x)) -> 0$. Then,
  $ lim_(ve(x)->ve(0)) f(ve(x)) = A. $
]

== Continuity

=== Existence

#theorem(title: [Continuity])[
  The following are equivalent:
  + $f : A subset.eq RR -> RR$ is _continuous_ at $c in A$.
  + $forall epsilon > 0 space exists delta > 0 :
  |x - c| < delta ==> |f(x) - f(c)| < epsilon$, where $x in A$.
  + $forall V_epsilon (f(c)) space exists V_delta (c) :
  x in V_delta (c) inter A ==> f(x) in V_epsilon (f(c))$
  + $x_n -> c$, where $(x_n) subset.eq A$, implies $f(x_n) -> f(c)$.
  If $c$ is a limit point of $A$:
  5.  $lim_(x->c) f(x) = f(c)$, also written $lim_(h->0)f(c + h) - f(c) = 0$.

  Note that (ii) defines (i). Mostly (v) is used in practice.
]

#corollary(title: [Isolated Continuity])[
  All functions are continuous at isolated points.
]

#theorem(title: [Dirichlet Discontinuous])[ 
  The Dirichlet function $f : RR -> RR$ such that
  $f(x) = 1$ if $x in QQ$ and $f(x) = 0$ if $x in II$ is
  discontinuous everywhere.
]

#definition(title: [Uniform Continuity])[
  We say $f$ is _uniformly continuous_ on $I$ if
  $ forall epsilon > 0 space exists delta > 0 :
  x, y in I, abs(x - y) < delta ==> abs(f(x) - f(y)) < epsilon. $
  In particular, $delta$ can be chosen independent of $y$.
]

#theorem[
  If a function is uniformly continuous, it is also continuous.
]

#theorem(title: [Heine--Cantor])[
  If $f$ is continuous and defined on a compact set $K$,
  then it is also uniformly continuous on $K$.
]

#proof[
  Assume the opposite, that $f$ is continuous but not uniformly.
  Since $f$ is not uniformly continuous,
  $ exists epsilon_0 > 0 : forall delta > 0 space exists x, y in K :
  space abs(x - y) < delta "but" abs(f(x) - f(y)) >= epsilon_0. $

  Now, choose $(x_n)$ and $(y_n)$ such that
  $ abs(x_n - y_n) < 1/n space "and" space
  abs(f(x_n) - f(y_n)) >= epsilon_0. $
  @thm-bolzano-weierstrass asserts that there exists some subsequence
  $x_n_k -> x_0$ for some $x_0 in K$.
  From $abs(x_n - y_n) < 1/n$ it follows that $y_n_k -> x_0$. Thus,
  $ abs(x_n_k - y_n_k) -> 0, $
  and, because $f$ is continuous with $f(x_n_k) -> x_0$ and
  $f(y_n_k) -> x_0$,
  $ abs(f(x_n_k) - f(x_n_k)) -> 0. $
  However, this contradicts our assumption that
  $ abs(f(x_n_k) -> f(y_n_k)) >= epsilon_0. $
]

=== Composition

#theorem(title: [Composition])[ 
  Given $f : A -> B$ and $g : B -> RR$ with $f(A) subset.eq B$,
  if $f$ is continuous at $c in A$ and
  $g$ is continuous at $f(c) in B$,
  then $g compose f$ is continuous at $c$.
]

#theorem(title: [Composition Limit])[ 
  If $f$ is continuous at $y$ and $lim_(x->c) g(x) = y$, then
  $ lim_(x->c) f(g(x)) = f(lim_(x->c) g(x)) = f(y). $ 
]

=== Results

#theorem(title: [Intermediate Value])[
  If $f$ is continuous on $[a, b]$, then for any $y$ between $f(a)$ and
  $f(b)$, there exists some $c in (a, b)$ such that $f(c) = y$.
] <thm-intermediate>

#theorem(title: [Intermediate Value in $RR^n$])[
  Let $D subset.eq RR^n$ be an arcwise connected domain and let $f : D -> RR$.
  Then if $f$ assumes two values $f(a)$ and $f(b)$,
  $f$ assumes all intermediate values.
]

#theorem(title: [Weierstrass Extreme Value])[
  If $f$ is continuous on the compact set $K$,
  then $f$ attains a maximum and a minimum value on $K$.
] <thm-extreme>

#theorem(title: [Limit of Bounded Function])[
  If $f$ is bounded then $lim_(h->0) f(h) h = 0.$
]

= Calculus

== The Derivative

=== Differentiation

#definition(title: [Derivative at a Point])[
  Let $f : A -> RR$ and $c$ a limit point of $A$. If a finite
  $ f'(c) = lim_(h->0) (f(c + h) - f(c))/h $
  exists, we say $f$ is _differentiable_ at $c$ with _derivative_ $f'(c)$.
]

#definition[
  Let $f : D subset.eq RR^n -> RR$ and let $a$ be an interior point of $D$.
  We say that $f$ is _differentiable_ at $a$ if
  there exists some real constants $A_1, A_2, ..., A_n$ and
  some $rho : RR^n -> RR$ such that
  $ f(ve(a) + ve(h)) - f(ve(a)) = A_1 h_1 + A_2 h_2 + dots.c + A_n h_n
  + norm(ve(h)) rho(ve(h)) $
  and
  $ lim_(ve(h) -> ve(0)) rho(ve(h)) = 0. $ 
  Equivalently, one may use that
  $ norm(ve(h)) rho(ve(h)) in o(norm(ve(h))), quad ve(h) -> ve(0), $
  or that
  $ ve(A) dot ve(h) = nabla f_ve(a) dot ve(h). $
]

#definition[
  Let $D subset.eq RR^n$ be an open subset.
  Then a function $ve(f) : D -> RR^m$ is said to be
  (totally) _differentiable_ at a point $ve(a) in D$ if
  there exists a linear map $ve(D f_a) : RR^n -> RR^m$ such that
  $ lim_(ve(h) -> ve(0))
  norm( ve(f)(ve(a) + ve(h)) - ve(f)(ve(a)) - ve(D f_a)(ve(h)) ) /
  norm(ve(h)) = 0 $
  or equivalently
  $ lim_(ve(h) -> ve(0))
  ( ve(f)(ve(a) + ve(h)) - ve(f)(ve(a)) - ve(D f_a)(ve(h)) ) /
  norm(ve(h)) = ve(0) $
  or equivalently
  $ ve(f)(ve(a) + ve(h))
  = ve(f)(ve(a)) + ve(D f_a)(ve(h)) + ve(o)(norm(ve(h))),
  quad ve(h) -> ve(0). $
]

#definition(title: [Differential])[
  Let $D subset.eq RR^n$ be an open subset and let $f : D -> RR^m$ be
  differentiable at a point $ve(a) in D$.
  The _differential_ of $f$ at $ve(a)$,
  denoted $D f_ve(a)$ or $dif f_ve(a)$,
  is the linear map $D f_ve(a) : RR^n -> RR^m$ such that
  $ f(ve(a) + ve(h)) = f(ve(a)) + D f_ve(a) (ve(h)) + o(norm(ve(h))),
  quad ve(h) -> ve(0). $
  
  In the one-dimensional case,
  $ dif f_ve(a) = f'(ve(a)) dif ve(a), $
  or if the gradient exists,
  $ dif f_ve(a) = nabla f(ve(a)) dot dif ve(a), $
  where $dif ve(a) = ve(h).$
]

#definition(title: [Gradient])[
  In a real inner product space $(V, iprod(dot, dot))$,
  the gradient of a scalar function $f : V -> RR$ is defined by the identity
  $ D f(ve(x)) [ve(h)] = iprod(nabla f(ve(x)), ve(h)) "for all" ve(h) in V. $
]

#theorem[
  Let $V$ be $RR^n$ with the dot product and an orthonormal basis
  and let $f : V -> RR$ be differentiable. Then,
  $ nabla f = [J f]^T. $
]

#note[
  Loosely speaking, in an orthonormal $RR^n$-basis,
  the gradient $nabla f : RR^n -> RR^n$
  of a differentiable function $f : RR^n -> RR$
  is an $n$-dimensional vector field.
]

#definition(title: [Class $C^k$])[
  Let $D subset.eq RR^n$ be an open subset and let $k$ be a positive integer.
  The differentiability class $C^k (D)$
  is the set of all functions $f : D -> RR$
  with partial derivatives that exist and are continuous on $D$
  up to order $k$.
]

#theorem[
  If $f in C^1 (D)$ then $f$ is differentiable on $D$.
]

#definition[
  The Jacobian determinant of $ve(f) : RR^n -> RR^n$ is
  the well-defined function $det ve(J f) : RR^n -> RR$.
]

#theorem[
  $ det ve(J (f compose g) [a]) = (det ve(J f [g(a)]))(det ve(J g [a])) $
]

#corollary[
  The identity map has determinant 1.
]

#theorem(title: [Inverse Function])[
  Let $ve(f) : U subset.eq RR^n -> RR^n$ with $U$ open
  be a $C^k$ map for some $k >= 1$.
  Suppose that its derivative at som point $ve(a) in U$,
  $ det D ve(f)(ve(a)) != 0. $

  Then there exist
  neighborhoods $V$ to $ve(a)$ and $W$ to $ve(f)(ve(a))$ such that
  $ve(f) : V -> W$ is a bijection with
  a $C^k$ inverse $ve(g)= ve(f)^(-1) : W -> V$.

  At a point $ve(y) in W$, the inverse has the derivative
  $ D ve(g)(ve(y)) = [D ve(f)(ve(g)(ve(y)))]^(-1) $
  and the Jacobian determinant
  $ det D ve(g)(ve(y)) = 1 / (det D ve(f)(ve(g)(ve(y)))). $
]

#theorem(title: [Implicit Function, Two-Variable Case])[
  Let $F : D subset.eq RR^3 -> RR$ be $C^1$ yielding a curve $F(x, y, z) = 0$.
  If $F(x_0, y_0, z_0) = 0$ and $F_z (x_0, y_0, z_0) != 0$
  then near $(x_0, y_0)$ there exists
  a unique differentiable function $z = f(x, y)$
  with $F(x, y, f(x, y)) = 0$.
  and as a consequence the partial derivatives
  $ f_x (x, y) = - (F_x (x, y, f(x,y ))) / (F_z (x, y, f(x, y))) $
  and
  $ f_y (x, y) = - (F_y (x, y, f(x,y ))) / (F_z (x, y, f(x, y))). $
]

=== Rules of Calculation

#theorem(title: [Chain Rule])[
  Let $f : X -> Y$ and $g : Y -> RR$.
  If $f$ is differentiable at $c in X$ and
  $g$ is differentiable at $f(c) in Y$,
  then $g compose f$ is differentiable at $c$ with
  $ (g compose f)'(c) = g'(f(c)) f'(c). $
] <thm-chain>

#theorem(title: [Chain Rule, Multivariable Case])[
  Let $f : RR^n -> RR$ be differentiable
  and let $ve(g) : RR -> RR^n$ be a vector of
  individually differentiable functions.
  Then, $f compose ve(g) : RR -> RR$ is differentiable
  and its derivative is
  $ dv(, t) f(g_1 (t), g_2 (t), ..., g_n (t))
  = sum_(i=1)^n dv(g_i, t) pdv(, g_i (t)) f(g_1 (t), g_2 (t), ..., g_n (t)) $
  or equivalently
  $ dv(, t)(f compose ve(g))(t) = nabla f(ve(g)(t)) dot ve(g)'(t). $
] <thm-chain-multivariable>

#corollary[
  Let $f : RR^n -> RR$ be differentiable
  and let $ve(g) : RR^m -> RR^n$ be a vector of
  individually differentiable functions.
  Then, $f compose ve(g) : RR^m -> RR$ is differentiable and
  its partial derivatives are given by
  $ pdv(, x_j) (f compose ve(g))(ve(x))
  = sum_(i=1)^n pdv(, y_i) f(ve(g)(ve(x))) pdv(, x_j) g_i (ve(x)) $
  for all $j in {1, 2, ..., m}.$
]

#theorem(title: [Basic Derivatives],
  grid(
    columns: (1fr, 1.2fr),
    [$
      &dv(,x) (arcsin x) = 1 / sqrt(1 - x^2) \
      &dv(,x) (arccos x) = -1 / sqrt(1 - x^2) \
      &dv(,x) (arctan x) = 1 / (1 + x^2) \
      &dv(,x) (arccot x) = -1 / (1 + x^2) \
      &dv(,x) (x^a) = a x^(a - 1) #h(0.7em) (a != 0) \
    $],
    [$
      &dv(,x) (sin x) = cos x \
      &dv(,x) (cos x) = -sin x \
      &dv(,x) (tan x) = 1 / (cos^2 x) \
      &dv(,x) (ln abs(x)) = 1 / x \
      &(f^(-1))'(y) = 1/(f'(x)) #h(0.7em)
      (y = f(x), f'(x) != 0)
    $],
  )
)

#theorem(title: [Dot and Scalar Product Rules])[
  $ dv(,t) ve(x)(t) dot ve(y)(t)
  &= ve(x)'(t) dot ve(y)(t) + ve(x)(t) dot ve(y)'(t)
  \ dv(,t) ve(x)(t) times ve(y)(t)
  &= ve(x)'(t) times ve(y)(t) + ve(x)(t) times ve(y)'(t) $
]

#theorem(title: [L'Hôpital's Rule])[
  Let $f$ and $g$ be differentiable on an open interval containing $c$
  (except possibly at $c$), with $g'(x) != 0$ near $c$. Suppose
  + $lim_(x->c) f(x) = lim_(x->c) g(x) = 0$
    (or both $plus.minus oo$), and
  + $lim_(x->c) (f'(x))/(g'(x)) = L$ exists (or $plus.minus oo$).
  Then, $ lim_(x->c) (f(x))/(g(x)) = L. $
]

#proof(title: "Proof of the zero case")[
  Assume the limits are zero.

  Let the functions be differentiable on the open interval $(c, x)$.
  Then, rewriting and applying @thm-gmv gives
  $ lim_(x->c) f(x)/g(x) = lim_(x->c)
  (f(x)-f(c))/(g(x)-g(c))
  = lim_(x->c) (f'(p))/(g'(p)) = lim_(p->c) (f'(p))/(g'(p)) $
  for some $p "between" c "and" x$.
]

#proof(title: "Proof of the infinity case")[
  The proof is too complicated.
  // Assume the limits are infinite. We will only prove the right-hand limit.
  // Let $c < a < b$.
  // The @thm-gmv states that there exists a $p in (a, b)$ such that
  // $ f'(p)[g(b) - g(a)] = g'(p)[f(b) - f(a)]. $
  // Solving for $f(a)$, we get 
  // $ f(a) = f(b) + (f'(p)(g(a) - g(b)))/(g'(p)). $
  // We divide by $g(a)$ and get
  // $ f(a)/g(a) = (f'(p))/(g'(p)) + 1/g(a) (f(b)-g(b) (f'(p))/(g'(p))) $
  // which we rewrite as
  // $ f(a)/g(a) - L =
  // (f'(p))/(g'(p)) - L + 1/g(a) (f(b)-g(b) (f'(p))/(g'(p))) $
]

#warning[
  This is only an implication, not an equivalence,
  so there may exist some other solution if this method fails.
]

=== Function Character

#theorem(title: [Fermat's or Interior Extremum])[
  Let $f : (a, b) -> RR$  be differentiable at the local extremum
  $c in (a, b)$. Then $f'(x) = 0$.

  However, note that a zero-derivative point may also be
  a stationary point of inflection. 
] <thm-fermat>

#theorem(title: [Darboux's])[
  If $f$ is differentiable on $[a, b]$ and
  if $y$ lies strictly between
  $f'(a)$ and $f'(b)$, then $exists c in (a, b) : f'(c) = y$.

  In other words, if $f$ is differentiable on an interval,
  then $f'$ satisfies the Intermediate Value Property (IVP).
]

#proof[
  Assume that $f'(a) < y < f'(b).$

  Let $g(x) = f(x) - y x$ with $g'(x) = f'(x) - y$.
  Note that $f'(c) = y$ if $g'(c) = 0$ for some $c in (a, b)$.
  
  @thm-extreme states that $g$ must have a minimum point $c in [a, b]$.
  More precisely $c in (a, b)$ since, from the assumption,
  $g'(a) < 0$ and $g'(b) > 0$.
  Furthermore, $g'(c) = 0$ according to @thm-fermat.
  More precisely $c in (a, b)$ since, per assumption, $g'(a) < 0$ and
  $g'(b) > 0$.
]

#theorem(title: [Newton's Method])[
  Find roots to a differentiable function $f(x)$.

  Given $x_n$ with the coordinates $(x_n, f(x_n))$,
  the tangent line is given by
  $ T(x) = f'(x_n)(x - x_n) + f(x_n) $
  and intersects the $x$-axis at
  $ T(x_(n+1)) = 0 #h(0.8em) <==>
  #h(0.8em) x_(n+1) = x_n - f(x_n)/(f'(x_n)). $

  The method fails if it iterates endlessly or $f'(x_n) = 0$.
]

=== The Mean Value Theorems

Let $f$ and $g$ be continuous on $[a, b]$ and differentiable on $(a, b)$.

#theorem(title: [Rolle's])[
  $ f(a) = f(b) ==> exists c in (a, b) : f'(c) = 0 $
] <thm-rolles>

#proof[
  $f(x)$ is bounded and
  $f'(x) = 0$ at its interior extreme points by @thm-fermat.
]

#theorem(title: [Mean Value])[
  $ exists c in (a, b) : f'(c) = (f(b) - f(a))/(b - a) $
]

#proof[
  Let the signed distance $d$ between
  the function value $f$ and the secant $y$ through $a$ and $b$ be
  $ d(x) = f(x) - y(x) =  f(x) - (f(b) - f(a))/(b - a) (x - a) - f(a) $
  and note that $d(a) = d(b) = 0$. Then apply @thm-rolles.
]

#theorem(title: [Generalized Mean Value])[
  $ exists c in (a, b) : [f(b) - f(a)] g'(c) = [g(b) - g(a)] f'(c) $
  If $g'$ is never zero on $(a, b)$, then the above can be stated as
  $ (f'(c))/(g'(c)) = (f(b) - f(a))/(g(b) - g(a)). $
] <thm-gmv>

#proof[
  Let $h(x) = f(x)[g(b) - g(a)] - g(x)[f(b) - f(a)]$
  and then apply @thm-rolles.
]

=== Constrained Optimization

#lemma[
  At a feasible stationary point, $f$ and $g$ are parallel.
  In the case of multiple constraints, we seek a feasible point where
  $ nabla f in span{nabla g_1, nabla g_2, ..., nabla g_n}. $
]

#lemma(title: [Lagrange Multipliers])[
  Let $f : D subset.eq RR^n -> RR$ and $g : D subset.eq RR^n -> RR$
  be differentiable.
  If $c in D$ is a local extremum of $f$ under the
  constraint $g(x) = 0$, then
  $ nabla g(c) != ve(0) quad ==> quad
  exists lambda in RR : nabla f(c) = lambda nabla g(c). $
]

#theorem(title: [Lagrange Multipliers, Generalized])[
  Let $f : D subset.eq RR^n -> RR$ and
  $g_1, g_2, ..., g_m : D subset.eq RR^n -> RR$
  be continuously differentiable.
  Suppose $c in D$ is a local extremum of $f$ subject to the constraints
  $ g_1 (c) = g_2 (c) = dots.h.c = g_m (c) = 0, $
  with linearly independent gradients
  $nabla g_1 (c), nabla g_2 (c), ..., nabla g_m (c)$.
  Then there exist _Lagrange multipliers_
  $lambda_1, lambda_2, ..., lambda_m in RR$
  such that
  $ nabla f(c)
  = lambda_1 nabla g_1 (c) + lambda_2 nabla g_2 (c)
  + dots.h.c + lambda_m nabla g_m (c). $
]

== Function Graphs

#tip(title: [Tip (Sketching Graphs)])[
  ==== Information
  + symmetries
  + split into cases
  + domain → vertical asymptotes
  + factorize → oblique asymptotes & roots
  + first and second derivative and their roots
  + sign tables
  + calculate interesting points: intersection with $y$-axis, defined
    nondifferentiable points, local extremums, endpoints, inflection
  
  ==== Sketching
  + axes
  + symmetries
  + asymptotes
  + interesting points
  + curves
]

=== Asymptotes

#definition(title: [Asymptote])[
  The line $y = k x + m$ is an _oblique_ asymptote of $f$ if
  $ lim_(x->oo) (f(x) - (k x + m)) = 0. $

  The line $x = c$ is a _vertical_ asymptote of $f$ if
  $ lim_(x->c+) f(x) = plus.minus oo #h(1.5em) "or"
  #h(1.5em) lim_(x->c-) f(x) = plus.minus oo. $

  The line $y = b$ is a _horizontal_ asymptote of $f$ if
  $ lim_(x->oo) f(x) = b #h(1.5em) "or"
  #h(1.5em) lim_(x->-oo) f(x) = b. $
]

#theorem(title: [Oblique Asymptote])[ 
  If $f(x)$ has an oblique asymptote $y = k x + m$, then
  $ k = lim_(x->oo) (f(x))/x $ and
  $ m = lim_(x->oo) (f(x) - k x). $
]

=== Convexity

#theorem(title: [Convexity])[
  Let $f$ be twice differentiable on $(a, b)$.
  Then, $f''(x) >= 0$ if and only if $f$ is convex on $(a, b)$.
]

#definition(title: [Concave])[
  On $[a, b]$, a function $f : [a, b] -> RR$ is _concave_ if $-f$ is convex.
]

=== Points

#definition(title: [Local Extremum])[
  A _local maximum_ of $f : D subset.eq RR -> RR$ is a point $c$ for which
  there exists an open neighborhood $N(c) subset.eq D$ such that
  $ f(c) >= f(x) quad forall x in N(c). $
]

#definition(title: [Stationary])[
  The point $c$ is a _stationary point_ of $f : RR -> RR$ if $f'(c)=0$.

  In general, a point $c$ at which $f : RR^n -> RR^m$ is differentiable
  is stationary if $D f(c) = 0,$
  where $0 in cal(L)(RR^n, RR^m)$ is the zero map.
]

#definition(title: [Stationary Order])[
  The _stationary order_ is the smallest $n>=2$ such that
  $ f'(c) =  f''(c)=dots.h.c=f^((n-1))(c)=0 space "but" space
  f^((n))(c)!=0. $
]

#definition(title: [Critical])[
  The point $c$ is a _critical point_ if $f(c)$ is stationary or undefined.
]

#definition(title: [Inflection])[
  A point $c$ is an _inflection point_ of $f$ if $f$ is continuous at $c$
  and if $f$ is convex on one side of $c$ and concave on the other side.
]

#theorem(title: [First Nonzero Derivative])[
  If $f$ has stationary order $n$, then:
  - If $n$ is _even_ $==>$ $f$ has a local extremum at $c$.

    Furthermore: $f^((n))(c)>0$ $==>$ local minimum, $f^((n))(c)<0$
    $==>$ local maximum.
  - If $n$ is _odd_ $==>$ $c$ is a stationary inflection point.
]

#proof[
  The Taylor series with remainder simplifies to
  $ f(c +  h)=f(c)+(f^((n))(c))/n! h^n+O(h^(n+1)). $
  Its change close to $c$ is thus
  $ f(c + h) - f(c) approx (f^((n))(c))/n! h^n, $
  which changes sign if and only if $n$ is odd.
  Similarly,
  $  f'(c + h) - f'(c) approx (f^((n-1))(c))/(n-1)! h^(n-1) $
  for the first derivative and
  $ f''(c + h) - f''(c) approx (f^((n-2))(c))/(n-2)! h^(n-2) $
  for the second derivative.
]

#corollary(title: [Second Derivative Test])[
  If $f''$ is continuous at $c$ and $f'(c)=0$, then:
  - $f''(c)>0$ $==>$ local minimum.
  - $f''(c)<0$ $==>$ local maximum.
  - $f''(c)=0$ and $f^((3))(c)!=0$ $==>$ stationary inflection point.  
  Note that $f''(c)=0$ alone is insufficient for an inflection; the curvature
  must change sign.
]

#examples[
  - $f(x)=x^3$: $f'(0)=f''(0)=0$, $f^((3))(0)=6!=0$ (odd $n=3$)
    $==>$ stationary inflection at $0$.
  - $f(x)=x^4$: $f'(0)=f''(0)=f^((3))(0)=0$, $f^((4))(0)=24>0$ (even $n=4$)
    $==>$ local minimum at $0$, no inflection.
  - $f(x)=-x^4$: local maximum at $0$, no inflection.
]

#lemma[
  Assume $ve(a) in RR^n$ is a stationary point of
  a $C^2$-function $f : RR^n -> RR$.
  The second-order Taylor series expansion can be rewritten as
  $ f(ve(a) + ve(h)) - f(ve(a)) = 1/2 Q(ve(h)) + o(norm(ve(h))^3),
  wide ve(h) -> ve(0), $
  showing that its local behavior is dominated by the quadratic term
  $ Q(ve(h)) = ve(h)^T H ve(h), wide H = D f_ve(a). $
]

#theorem[
  In the scenario above,
  $ H "positive definite" &==> ve(a) "local minimum"
  \ H "negative definite" &==> ve(a) "local maximum"
  \ H "indefinite" &==> ve(a) "saddle point"
  \ H "positive semidefinite" &==> ve(a) "local minimum or saddle point"
  \ H "negative semidefinite" &==> ve(a) "local maximum or saddle point" $
]

#corollary(title: [ABC-test])[
  #set math.mat(gap: 0.8em)
  If $n = 2$ in the scenario above, let
  $ H = mat(f_(x x), f_(y x); f_(x y), f_(y y)) = mat(A, B; B, C) $
  - $A C - B^2 > 0$ and $A > 0$ $==>$ local minimum.
  - $A C - B^2 > 0$ and $A < 0$ $==>$ local maximum.
  - $A C - B^2 < 0$ $==>$ saddle point.
  - $A C - B^2 = 0$ and $A > 0$ $==>$ local minimum or saddle point.
  - $A C - B^2 = 0$ and $A < 0$ $==>$ local maximum or saddle point.
]

== The Riemann Integral

=== Definition

#definition(title: [Partition])[
  A _partition_ of $[a,b]$ is
  a finite set $ P = {x_0, x_1, ..., x_n} $
  such that $ a = x_0 < x_1 < dots.h.c < x_n = b, $
  
  The partition $P$ has _subintervals_
  $ [x_(i-1), x_i] quad i = 1, 2, ..., n $
  of which the length of the largest is its _mesh_ or _norm_
  $ norm(P) = max_(1<=i<=n) (x_i - x_(i-1)). $
  A smaller such is indicative of a finer partition.
]

Let $f : [a,b] -> RR$ be bounded. We now define its definite integral.

#definition(title: [Darboux Integral])[
  Define the _lower sum_
  $ L(f,P) = sum_(i=1)^n (inf { f(x) : x in [x_(i-1), x_i] })
  (x_i - x_(i-1)). $
  and the _upper sum_
  $ U(f,P) = sum_(i=1)^n (sup { f(x) : x in [x_(i-1), x_i] })
  (x_i - x_(i-1)) $
  The function $f$ is _Darboux integrable_ if
  $sup_P L(f,P) = inf_P U(f,P)$. 
  The common value is denoted as the _definite integral_
  $ integral_a^b f(x) dif x$.
]

#definition(title: [Alternative Darboux Integral])[
  Let $Phi$ and $Psi$ be the _lower and upper step functions_ such that
  $ Phi(x) <= f(x) <= Psi(x) quad forall x in [a, b], $
  forming the _lower integral_
  $ L(f) = sup{integral_a^b Phi(x) dif x :
  Phi "is a lower step function to" f} $
  and the _upper integral_
  $ U(f) = inf{integral_a^b Psi(x) dif x :
  Psi "is an upper step function to" f} $
  which, if equal, give the definite integral.

  Note that the integral of a step function is simply its signed area.
]

#definition(title: [Riemann Integral])[
  From a partition $P$ of $[a, b]$ pick _sample points_
  $ t_i in [x_(i-1), x_i], quad i = 1, 2, ..., n $
   and form the (tagged) _Riemann sum_
  $ S(f, P, (t_i)) = sum_(i=1)^n f(t_i) (x_i - x_(i-1)). $

  We say $f$ is _Riemann integrable_ if
  there exists $L in RR$ such that
  $ forall epsilon > 0 space exists delta > 0 :
  norm(P) < delta ==> |S(f,P,(t_i)) - L| < epsilon $
  for every choice of sample points $(t_i)$. In that case we write
  $ L = integral_a^b f(x) dif x. $
]

#theorem[
  The Darboux and Riemann integrals are equivalent.
]

#definition(title: [Simple Function])[
  A simple function is a measurable function that
  takes only finitely many values.
]

=== Integrability

#theorem(title: [Integrability])[
  Let $f : [a, b] -> RR$ be bounded.

  The function is integrable if and only if:
  + $forall epsilon > 0 space exists P : U(f,P) - L(f,P) < epsilon$.
  + $forall (P_n) : norm(P_n) -> 0 ==>
    U(f,P_n) - L(f,P_n) -> 0.$
  + (Lebesgue Criterion for Riemann Integrability) \
    Its set of discontinuities has Lebesgue measure zero.
  + $ forall epsilon > 0 space exists Phi, Psi :
    integral_a^b Psi(x) dif x - integral_a^b Phi(x) dif x < epsilon, $
    where $Phi$ and $Psi$ are lower and upper step functions.
  
  The function is integrable if:
  3. $f$ is _monotone_ on $[a, b]$
  + $f$ is continuous except at finitely many points, or at countably many
    points where it has only removable or jump discontinuities.
]

#theorem[
  If $f$ is a real continuous function defined on a rectangle $Delta$,
  then $f$ is integrable on $Delta$.
]

#theorem[
  Assume $f$ is continuous on $[a, b]$. Let
  $ M_i = max_(x in [x_(i-1), x_i]) f(x)
  space "and" space
  m_i = min_(x in [x_(i-1), x_i]) f(x). $
  Then,
  $ lim_(norm(P)->0) sum_(i=1)^n M_i (x_i - x_(i-1))
  = lim_(norm(P)->0) sum_(i=1)^n m_i (x_i - x_(i-1))
  = integral_a^b f(x) dif x. $
]

#theorem(title: [Absolute Value / Triangle])[
  If $f$ is integrable, then $|f|$ is integrable and
  $ abs(integral_a^b f(x) dif x) <= integral_a^b |f(x)| dif x. $
]

#theorem(title: [Products and Composition])[
  If $f,g$ are integrable, then $f g$ is integrable.
  
  If $f$ is integrable and
  $phi$ is continuous on a set containing $f([a,b])$,
  then $phi compose f$ is integrable.
]

#theorem(title: [Uniform Limit])[
  If $(f_n)$ are integrable on $[a,b]$ and $f_n -> f$ uniformly,
  then $f$ is integrable and
  $ integral_a^b f_n (x) dif x -> integral_a^b f(x) dif x. $
]

=== Properties

#theorem(title: [Linearity])[
  If $f,g$ are integrable and $alpha, beta in RR$, then
  $ integral_a^b (alpha f(x) + beta g(x)) dif x
  = alpha integral_a^b f(x) dif x
  + space  beta integral_a^b g(x) dif x. $
]

#theorem(title: [Additivity of the Interval])[
  If $c in (a,b)$ and $f$ is integrable on $[a,b]$, then
  $ integral_a^b f(x) dif x = integral_a^c f(x) dif x
   + integral_c^b f(x) dif x. $
  It follows that $ integral_a^a f(x) dif x = 0$ and
  $integral_b^a f(x) dif x = - integral_a^b f(x) dif x.$
]

#theorem(title: [Order / Comparison])[
  If $f,g$ are integrable and $f(x) <= g(x)$ on $[a,b]$, then
  $ integral_a^b f(x) dif x <= integral_a^b g(x) dif x. $
] <thm-integral-comparison>

#corollary(title: [Positivity])[
  If $f(x) >= 0$ on $[a,b]$, then $ integral_a^b f(x) dif x >= 0$.
  Moreover, if $f$ is continuous and the integral is $0$, then $f equiv 0$.
]

#theorem(title: [Bounding by a Supremum])[
  If $|f(x)| <= M$ on $[a,b]$, then
  $ abs(integral_a^b f(x) dif x) <= M (b - a). $
]

#theorem(title: [Mean Value for Integrals])[
  If $f$ is continuous on $[a, b]$, then
  $ integral_a^b f(x) dif x = f(xi) (b - a). $
  for some $xi in [a, b]$ or,
  to be more strict if $f$ is not constant, $xi in (a, b)$.
] <thm-mean-integrals>

#theorem(title: [Generalized Mean Value for Integrals])[
  If $f$ is continuous and $g$ is integrable and
  does not change sign on $[a, b]$,
  $ integral_a^b f(x) g(x) dif x = f(xi) integral_a^b g(x) dif x $
  for some $xi in [a, b]$ or,
  to be more strict if $f$ is not constant, $xi in (a, b)$.
]

#proof[
  Let $m = min f(x)$ and $M = max f(x)$ for $x in [a, b].$ Then,
  $ m integral_a^b g(x) <= integral_a^b f(x) g(x)
  <= M integral_a^b g(x) $
  by @thm-integral-comparison, or rewritten,
  $ m <= 1/(integral_a^b g(x)) integral_a^b f(x) g(x)
  <= M. $
  Since $m <= f(x) <= M$, @thm-intermediate gives that
  $ f(xi) = 1/(integral_a^b g(x)) integral_a^b f(x) g(x) $
  for some $xi in [a, b]$. Rewritten, this is the theorem.
]

#theorem(title: [Fundamental Theorems of Calculus])[
  If $f$ is continuous on $[a, b]$, then the two theorems follow:
  
  + Let $F(x) = integral_a^x f(t) dif t$ for $x in [a, b]$.
    Then, $F$ is continuous on $[a, b]$,
    differentiable on $(a, b)$, and $F'(x) = f(x).$

  + If $F'(x) = f(x)$ for $x in (a, b)$, then
    $ integral_a^b f(x) dif x = F(b) - F(a). $
] <thm-fundamental>

#proof(title: [Proof of FTC1])[
  We want to show that $F'(x) = f(x)$.

  Applying the definition of derivatives,
  $ F'(x) = lim_(h->0) 1/h (F(x+h) - F(x))
  = lim_(h->0) 1/h integral_x^(x+h) f(x) dif x, $ 
  where $x$ and $x + h$ are in $(a, b)$.
  By @thm-mean-integrals,
  $ integral_x^(x+h) f(t) dif t = f(xi) h $
  for some $xi$ between $x$ and $x + h$,
  which in our previous result gives
  $ F'(x) = lim_(h->0) f(xi) = f(x) $
  since $f$ is continuous.
]

#proof(title: [Proof of FTC2])[
  Let $G(x)$ have $G'(x) = f(x) = F'(x)$ for all $x in (a, b)$.
  Then, $G'(x) - F'(x) = 0$ gives that $G(x) - F(x) = C$ for some constant.
  We have $G(a) - F(a) = C$, but
  $ G(a) = integral_a^a f(t) dif t = 0, $
  so $C = -F(a)$ and hence $G(b) = F(b) - F(a)$, but by definition
  $ G(b) = integral_a^b f(t) dif t, $
  so the statement holds.
]

=== Integration Techniques

#theorem(title: [Integration by Substitution])[
  Also known as _change of variables_ or _u-substitution_.

  Let $g$ be injective and continuously differentiable on $[a,b]$
  and let $f$ be continuous on $g([a, b])$.
  Then, with $u = g(x)$ and $dif u = g'(x) dif x$,
  $ integral_a^b f(g(x)) g'(x) dif x
  = integral_(g(a))^(g(b)) f(u) dif u. $

  Equivalently, if $g$ is strictly monotonic and 
  thus invertible as $x = g^(-1)(u)$,
  $ integral_a^b f(x) dif x =
  integral_(g^(-1)(a))^(g^(-1)(b)) f'(g(u)) g'(u) dif u. $
]

#proof[
  We prove the first formulation of the theorem. We have,
  $ integral_a^b f(g(x)) g'(x)
  = [f(g(x))]_a^b
  = [f(u)]_(g(a))^(g(b))
  = integral_(g(a))^(g(b)) f(u) dif u $   
  according to @thm-fundamental (ii) and @thm-chain.
]

#theorem(title: [Integration by Parts])[
  If $f,g$ are continuously differentiable on $[a,b]$, then
  $ integral_a^b f(x) g(x) dif x =
  [F(x) g(x)]_a^b - integral_a^b F(x) g'(x) dif x. $
] <thm-parts>

#tip(title: [LIATE])[
  The LIATE rule helps choose $f(x)$ and $g(x)$ for integration by parts:
  - Logarithmic: $ln(x)$, $log_a(x)$
  - Inverse trigonometric: $arctan(x)$, $arcsin(x)$, $arccos(x)$
  - Algebraic: $x$, $x^2$, $x^3$, etc.
  - Trigonometric: $sin(x)$, $cos(x)$, $tan(x)$, etc.
  - Exponential: $e^x$, $a^x$
  Choose $g(x)$ as the function that appears first in this list.
]

#tip(title: [Trigonometric Functions])[
  ==== Arctangent

  + Addition: $(a b < 1, "otherwise add or subtract" pi slash 2)$
    $ arctan(a) + arctan(b) = arctan((a + b)/(1 - a b)) $
  + Subtraction: $(a b > 1, "otherwise add or subtract" pi slash 2)$
    $ arctan(a) - arctan(b) = arctan((a - b)/(1 + a b)) $
  + Inverse:
    $ arctan(x) = -arctan(-x) $
  + Integration:
    $ integral a/(b^2 + c^2 x^2) dif x
    &= a/b^2 integral 1/(1 + c^2 x^2 slash b^2) \
    &= vec(u &= c x slash b, dif u &= c slash b, delim: "{") \
    &= a/(b c) integral 1/(1 + u^2) dif u \
    &= a/(b c) arctan((c x)/b) $
  
  ==== Elementary

  + Double angle formulas:
    $ sin(2x) = 2 sin(x) cos(x) $
    $ cos(2x) = cos^2(x) - sin^2(x) = 2 cos^2(x) - 1 = 1 - 2 sin^2(x) $
    $ tan(2x) = (2 tan(x)) / (1 - tan^2(x)) $
  + Half angle formulas:
    $ sin^2(x) = (1 - cos(2x))/2 $
    $ cos^2(x) = (1 + cos(2x))/2 $
    $ tan^2(x) = (1 - cos(2x))/(1 + cos(2x)) $
    $ tan(x/2) = (1-cos(x))/sin(x) = sin(x)/(1+cos(x)) $
    (Weierstrass Substitution) 
    Let $t = tan(x slash 2)$, then:
    $
    sin(x) &= (2t)/(1 + t^2) \
    cos(x) &= (1 - t^2)/(1 + t^2) \
    tan(x) &= (2t)/(1 - t^2) \
    dif x &= (2 dif t)/(1 + t^2)
    $
    This substitution is especially useful for integrating rational functions of trigonometric expressions.
  + Antiderivatives:

    $sin(x^2), cos(x^2), "and" tan(x^2)$ lack elementary antiderivatives.
]

== Vector Field Integrals

=== Measure Zero

#definition(title: [Null Set])[
  A set is a null set if it has measure zero. 
]

#theorem[
  A null set is integrable and its integral is $0$.
]

#corollary[
  If a set $A subset RR^n$ has $dim N < n$ then it has measure zero.
]

#definition(title: [Jordan Measurable])[
  A bounded set in $RR^n$ is _Jordan measurable_
  if its boundary has measure zero.
]

#lemma[
  If $f$ is uniformly continuous and bounded on a Jordan measurable set $D$,
  then $f$ is integrable over $D$.
]

=== Multiple Integrals

#theorem[
  If $f$ is continuous on
  $ D = {(x, y) : alpha(x) <= y <= beta(x), a <= x <= b}, $
  where $alpha$ and $beta$ are
  continuous on $[a, b]$ with $alpha(x) <= beta(x)$,
  then $f$ is integrable over $D$ and
  $ integral.double_D f(x, y) dif x dif y
  = integral_a^b (integral_(alpha(x))^(beta(x)) f(x, y) dif y) dif x. $

  An equivalent form with respect to the other variable exists.
]

#proof[
  Using earlier lemmas and theorems, 
  $ D "compact" ==> f "uniformly continuous" ==> f "integrable over" D. $
  The rest of the proof is left.
]

#theorem(title: [Mean Value for Double Integrals])[
  If $f$ is continuous on a compact, connected region $D subset RR^2$, then
  $ integral.double_D f(x, y) dif x dif y = f(a, b) mu(D) $
  then for some $(xi, eta) in D$.
]

#theorem[
  If $f$ is seperable with
  $ f(x, y) = g(x) h(y) $
  then we may rewrite
  $ integral.double_([a,b]times[c,d]) g(x) h(y) dif x dif y
  = integral_a^b g(x) dif x integral_c^d h(y) dif y. $
]

#theorem(title: [Power Test for Improper Integrals])[
  For $ve(x) in RR^n$ and $p in RR$, the improper integral
  $ integral_(0 < norm(ve(x)) < 1) 1/norm(ve(x))^p dif^n ve(x) $
  converges if and only if $p < n$, while
  $ integral_(norm(ve(x)) > 1) 1/norm(ve(x))^p dif^n ve(x) $
  converges if and only if $p > n$.
  Note that $p = n$ always diverges.
]

=== Defining Line and Surface Integrals

#definition[
  $ &dif s
  &&= norm(ve(r)'(t)) dif t

  \ &dif ve(s)
  &&= ve(r)'(t) dif t

  \ &dif S
  &&= norm(ve(r)_s (s, t) times ve(r)_t (s, t)) dif s dif t

  \ &dif ve(S)
  &&= (ve(r)_s (s, t) times ve(r)_t (s, t)) dif s dif t
  = ve(hat(n)) dif S $
]

#definition(title: [Line Integral, Riemann])[
  Let $f : C -> RR$ be a function defined on a curve $C in RR^n$.
  The line integral of $f$ along $C$ is
  $ integral_C f(x) dif s
  = lim_(norm(P)->0) sum_(i=1)^n f(t_i) norm(x_i - x_(i-1)), $
  where $P = {x_0, x_1, ...., x_n}$ is a partition of $C$ and
  $t_i in C$ is a sample point in the subcurve between $x_(i-1)$ and $x_i$.
]

#definition(title: [Surface Integral, Riemann])[
  Let $f : S -> RR$ be a function defined on a surface $S in RR^3$.
  The surface integral of $f$ along $S$ is
  $ integral_S f(x) dif S
  = lim_(norm(P)->0) sum_(i=1)^n f(t_i) "area"(S_i), $
  where $P = {S_1, S_2, ..., S_n}$ is a partition of $S$ and
  $t_i in S$ is a sample point in the sub-surface $S_i$.
]

#theorem[
  If $f$ is continuous on $C$, then the line integral exists.
]

#definition(title: [Line Integral, Scalar Field])[
  For a scalar field $f : RR^n -> RR$,
  the line integral along a smooth curve $C$
  parametrized by $ve(r)(t)$ for $t in [a, b]$ is
  $ integral_C f dif s
  = integral_a^b f(ve(r)(t)) norm(ve(r)'(t)) dif t $
  under the assumption that $ve(r)'(t) != ve(0)$ for every $t in [a, b]$.
]

#definition(title: [Line Integral, Vector Field])[
  Likewise, for a vector field $ve(F) : RR^n -> RR^n$ the line integral is
  $ integral_C ve(F) dot dif ve(r)
  = integral_a^b ve(F)(ve(r)(t)) dot ve(r)'(t) dif t. $
]

#definition(title: [Surface Integral, Scalar Field])[
  For a scalar field $f : RR^3 -> RR$,
  the surface integral along a smooth surface $S$
  parametrized by $ve(r)(s, t)$ for $(s, t) in D$ is
  $ integral.double_S f dif S
  = integral.double_D f(ve(r)(s, t))
  norm(ve(r)_s (s, t) times ve(r)_t (s, t)) dif s dif t. $
]

#definition(title: [Surface Integral, Vector Field])[
  For a vector field $ve(F) : RR^3 -> RR^3$,
  the surface integral along a smooth surface $S$
  parametrized by $ve(r)(s, t)$ for $(s, t) in D$ is
  $ integral.double_S ve(F) dot dif ve(S)
  = integral.double_D ve(F)(ve(r)(s, t))
  dot (ve(r)_s (s, t) times ve(r)_t (s, t)) dif s dif t. $
]

=== Line Integral Properties

#theorem[
  If $C$ is a smooth curve
  parametrized by $ve(r)(t)$ for $t in [a, b]$, then
  $ integral_C f(x) dif s
  = integral_a^b f(ve(r)(t))
  sqrt((x'_1 (t))^2 + (x'_2 (t))^2 + dots.h.c + (x'_n (t))^2) dif t. $
]

#theorem(title: [Green's])[
  Let $P, Q in C^1 (Omega)$, where $Omega in RR^2$ is an open set.
  If the compact region $D subset Omega$ has
  a piecewise smooth boundary $partial D$
  and is positively oriented, then
  $ integral.cont_(partial D) P dif x + Q dif y
  = integral.double_D (pdv(Q, x) - pdv(P, y)) dif x dif y. $
]

=== Vector Differential Operators

#tip[
  Vector calculus is heavily centered around the
  three vector differential operators and
  their respective fundamental theorems.

  Furthermore, all of these are generalized by
  @thm-generalized-stokes.
]

#theorem(title: [Generalized Stoke's])[
  Let $Omega$ be an orientable manifold with boundary $partial Omega$,
  and let $omega$ be a differential form of degree $dim(Omega)-1$.
  Then
  $ integral_(partial Omega) omega = integral_Omega dif omega. $
] <thm-generalized-stokes>

#definition(title: [Conservative Vector Field])[
  A vector field $ve(F) : Omega -> RR^n$
  is _conservative_ if there exists
  a scalar _potential function_ $phi : Omega -> RR$
  such that $ve(F) = nabla phi.$
]

#lemma(title: [Path Independence])[
  $ "path independent" <==> "conservative" $ 
]

#theorem(title: [Gradient or FTC for Line Integrals])[
  If $ve(F)$ is a conservative vector field,
  then the line integral of $ve(F)$ along
  any curve $C$ from $ve(a)$ to $ve(b)$
  is independent of the path and equals
  $ integral_C ve(F) dot dif ve(r)
  = integral_C nabla phi dot dif ve(r)
  = phi(ve(b)) - phi(ve(a)). $
]

#proof[
  With a parameterization such that
  $ve(r)(a) = ve(a)$ and $ve(r)(b) = ve(b)$,
  $ integral_C nabla phi dot dif ve(r)
  = integral_a^b nabla phi(ve(r)(t)) dot ve(r)'(t) dif t
  = integral_a^b dv(, t) phi(ve(r)(t)) dif t
  = phi(ve(b)) - phi(ve(a)) $
  is the evaluated line integral, since
  $ dv(, t) phi(ve(r)(t)) = nabla phi(ve(r)(t)) dot ve(r)'(t), $
  by @thm-chain-multivariable.
]

#theorem[
  If the vector field $ve(F) = (F_x, F_y)$
  has a $C^2$ potential function,
  then
  $ pdv(F_y, x) = pdv(F_x, y). $

  Likewise, if the equality above holds then
  $ve(F)$ has a potential function.
]

#definition(title: [Divergence])[
  Let $ve(F) = (F_x, F_y, F_z)$ be a $C^1$ vector field.
  Its divergence is the scalar-valued function
  $ "div" ve(F) = nabla dot ve(F) = pdv(F_x, x) + pdv(F_y, y) + pdv(F_y, y). $
]

#theorem(title: [Divergence or Gauss's])[
  Let $V subset RR^3$ be compact and
  with a piecewise smooth boundary $delta V$.
  If $ve(F)$ is a $C^1$ vector field on a neighborhood of $V$, then
  $ integral.triple_V (nabla dot ve(F)) dif V =
  integral.surf_(delta V) (ve(F) dot ve(hat(n))) dif S. $

  This may be generalized for $V subset RR^n$.
]

#definition(title: [Curl])[
  Let $ve(F) = (F_x, F_y, F_z)$ be a $C^1$ vector field.
  Its curl is the vector-valued function
  $ "curl" ve(F) = nabla times ve(F) =
  (pdv(F_z, y) - pdv(F_y, z),
   pdv(F_x, z) - pdv(F_z, x),
   pdv(F_y, x) - pdv(F_x, y)). $
]

#theorem(title: [Curl or Stokes's])[
  Let $S subset RR^3$ be a compact, orientable surface with
  a piecewise smooth boundary $partial S$ and
  let $ve(hat(n))$ be a unit normal vector field on $S$.
  If $ve(F)$ is a $C^1$ vector field on a neighborhood of $S$, then
  $ integral.double_S (nabla times ve(F)) dot ve(hat(n)) dif S =
  integral.cont_(partial S) ve(F) dot dif ve(r). $
]

#definition(title: [Irrotional])[
  A vector field is _irrotational_ if its curl is the zero vector.
]

#theorem[
  $ "conservative" ==> "irrotational" $
]

= Infinite Series

== Series

#definition(title: [Infinite Series])[
  Let $(a_j)^oo_(j=0)$ and let $(s_n)^oo_(n=0)$.
  The sum of the infinite series is defined as
  $ sum^oo_(j=0) a_j = lim_(n->oo) s_n
  = lim_(n->oo) sum^n_(j=0) a_j. $

  If $a_j >= 0$ for every $j$ we say that the series is _positive_.
]

#warning[
  Beware of treating infinite series like elementary algebra,
  e.g., by rearranging terms.
]

#theorem(title: [Geometric Series])[
  If $abs(x) < 1$, then
  $ sum_(j=0)^oo x^j = 1/(1 - x) $
  since
  $ s_n = sum_(j=0)^n x^j = (1 - x^(n+1))/(1 - x). $
]

=== Convergence

#theorem(title: [Cauchy Criterion for Series])[
  The series $sum_(k=0)^oo a_k$ converges if and only if
  $ forall epsilon > 0 space exists N :
  n > m > N ==> abs(a_m + a_(m+1) + dots.h.c + a_(n-1) + a_n)
  < epsilon. $
]

#corollary(title: [Series Term Test])[
  If $sum^oo_(k=1) a_k$ converges, then $a_k -> 0$.
  However, the reverse is not implied.
] <thm-term>

#lemma[
  The series $sum_(j=1)^oo 1 slash j$ is divergent.
]

#theorem(title: [Inverse Power Series])[
  The series $sum_(j=1)^oo 1 slash j^p$ converges if and only if
  $p > 1$.
] <thm-inverse-power>

#theorem(title: [Ratio Test])[
  Let $(a_n)$ be a sequence of positive terms and define
  $ L = limsup_(n->oo) abs(a_(n+1)/a_n). $
  Then:
  + If $L < 1$, the series $sum_(n=1)^oo a_n$ converges.
  + If $L > 1$ (including $L = oo$), the series diverges.
  + If $L = 1$, the test is inconclusive.
] <thm-ratio>

#theorem(title: [Direct Comparison Test])[
  Let $(a_k)$ and $(b_k)$ satisfy $0 <= a_k <= b_k.$ Then,
  + $sum^oo_(k=1) (a_k)$ converges if
    $sum^oo_(k=1) (b_k)$  converges.
  + $sum^oo_(k=1) (b_k)$ diverges if
    $sum^oo_(k=1) (a_k)$  diverges.
] <thm-direct-comparison>

#theorem(title: [Limit Comparison Test])[
  Let $sum_(j=0)^oo a_j$ and $sum_(j=0)^oo b_j$
  be positive series with terms such that
  $ lim_(j->oo) a_j/b_j = K $
  for some finite $K != 0.$
  Then, $sum_(j=0)^oo a_j$ converges if and only if
  $sum_(j=0)^oo b_j$ converges.
] <thm-limit-comparison>

#theorem(title: [Alternating Series Test])[
  Let $(a_n)$ satisfy
  + $a_1 >= a_2 >= dots.h.c >= a_n >= a_(n+1) >= dots.h.c$ and
  + $(a_n) -> 0$.
  Then, $sum^oo_(n=1) (-1)^(n+1) a_n$ converges.
] <thm-alternating>

#definition(title: [Absolutely Convergent])[
  A series $sum_(j=0)^oo a_j$ is _absolutely convergent_ if
  $sum_(j=0)^oo abs(a_j)$ is convergent.
]

#theorem[
  If a series is absolutely convergent then it is convergent.
] <thm-absolutely-convergent>

#theorem(title: [Cauchy Condensation Test])[
  Let $(a_n)$ be a decreasing sequence of nonnegative real numbers.
  Then $sum_(n=1)^(oo) a_n$ converges if and only if
  $sum_(n=0)^(oo) 2^n a_(2^n)$ converges.
]

#theorion-restate(filter: it => it.label == <thm-integral>)

== Indefinite Integrals

=== Unlimited Intervals

#definition[
  Let $f$ be integrable on $[a, R]$ for all $R > a$.
  Then the integral is defined
  $ integral_a^oo f(x) dif x = lim_(R->oo)
  integral_a^R f(x) dif x. $
  If this limit exists, then the integral is said to be convergent.
]

#definition[
  Let $f$ be integrable on every closed and bounded interval.
  If _both_
  $ integral_(-oo)^a f(x) dif x space "and" space
  integral_(a)^oo f(x) dif x $
  are convergent, then for any real $a$
  we define the convergent integral
  $ integral_(-oo)^oo f(x) dif x =
  integral_(-oo)^a f(x) dif x
  + integral_a^oo f(x). $
]

#theorem(title: [Properties])[
  Let $f$ and $g$ be integrable on $[a, R]$.
  The following applies.
  #compact-restate((
    <thm-inverse-power>, <thm-limit-comparison>,
    <thm-direct-comparison>, <thm-absolutely-convergent>,
  ))
]

#warning[
  The following does not apply.
  #compact-restate((<thm-term>, <thm-alternating>, <thm-ratio>))
]

#theorem[
  Let $f$ be decreasing on $[m, n]$, where $m < n$ are integers.
  Then,
  $ sum_(j=m+1)^n f(j) <= integral_m^n f(x) dif x <= sum_(j=m)^(n-1) f(j) $
  and
  $ f(n) + integral_m^n f(x) dif x <= sum_(j=m)^n f(j) <=
  f(m) + integral_m^n f(x) dif x. $

  Let $f$ instead be increasing. Then,
  $ sum_(j=m)^(n-1) f(j) <= integral_m^n f(x) dif x <= sum_(j=m+1)^n f(j) $
  and
  $ f(m) + integral_m^n f(x) dif x <= sum_(j=m)^n f(j) <=
  f(n) + integral_m^n f(x) dif x. $
]

#corollary(title: [Integral Test])[ // AKA Maclaurin--Cauchy Test
  Let $f$ be continuous, positive, and decreasing on $[m, oo)$,
  where $m in NN$.
  Then,
  $ sum_(n=m)^oo f(n) $
  converges if and only if
  $ integral_m^oo f(x) dif x $
  converges.
] <thm-integral>

=== Open Intervals

== Taylor's Theorem

=== Statement

#theorem(title: [Taylor's])[
  Suppose $f$ is continuously differentiable $n$ times on $[a, b]$ and
  $n + 1$ times on $(a, b)$. Fix $c in [a, b]$. Then,
  $ f(x) = P_n (x) + R_n (x), $
  where the _Taylor polynomial_ of degree $n$ around $c$ is
  $ P_n (x) = sum_(k=0)^(n) (f^((k))(c))/k! (x - c)^k $
  and the _Lagrange remainder_ of degree $n$ around $c$ is
  $ R_n (x) = (f^((n+1))(xi))/(n+1)! (x - c)^(n+1) $
  for some $xi$ strictly between $c$ and $x$.

  Note that other remainder forms exist.
]

#proof[
  Let $h = x - c$ be the deviation from the point. Then,
  $ f(x) = f(c + h) = sum_(k=0)^(n) (f^((k))(c))/k! h^k
  + (f^((n+1))(xi))/(n+1)! h^(n+1) = p_n (h) + r_n (h), $
  where $p_n (h)$ and $r_n (h)$ correspond to $P_n (x)$ and $R_n (x)$.

  Define
  $ F_(n,h)(t) = sum_(k=0)^(n) (f^((k))(t))/k! (c + h - t)^k, $
  with $F_(n,h)(c) = p_n(h)$ and $F_(n,h)(c + h) = f(c + h)$, and
  derivative
  $ F'_(n,h)(xi) = (f^((n+1))(xi)) / n! (c + h - xi)^n. $

  Also let
  $ g_(n,h) (t) = (c + h - t)^(n+1), $
  with $g_(n,h)(c) = h^(n+1)$ and $g_(n,h)(c + h) = 0$ and
  $ g'_(n,h)(xi) = -(n + 1)(c + h - xi)^n. $

  @thm-gmv gives
  $ (F_(n,h)(c+h) - F_(n,h)(c)) / (g_(n,h)(c+h) - g_(n,h)(c))
  = (F'_(n,h)(xi)) / (g'_(n,h)(xi)) $
  for some $xi$ between $c$ and $c + h$. Substituting,
  $ (f(c + h) - p_n (h))/(0 - h^(n+1)) =
  (f^((n+1))(xi) (c + h - xi)^n slash n!)/(-(n + 1)(c + h - xi)^n) $
  so
  $ f(c + h) - p_n (h) = (f^((n+1))(xi))/(n + 1)! h^(n+1). $
  Hence
  $ f(c + h) = p_n (h) + r_n (h) $
  or in $x$-notation
  $ f(x) = P_n (x) + R_n (x) $
  with $xi$ strictly between $c$ and $x$.
]
  
#proof(title: [Proof using integrals])[
  From @thm-fundamental (ii) we have
  $ integral_c^x f'(t) dif t = f(t) - f(c) $
  which we expand using @thm-parts as
  $ f(x)
  &= f(c) + integral_c^x 1 dot f'(t) dif t \
  &= f(c) + [(t-x)f'(t)]_c^x  - integral_c^x (t-x)f''(x) dif t \
  &= f(c) + f'(c)(x - c) -
    ([(t-x)^2/2 f''(t)]_c^x - integral_c^x (t-x)^2/2 f^((3))(t) dif t) \
  &= f(c) + f'(c)(x-c) + (f''(t))/2 (x-c)^2 +
    integral_c^x (t-x)^2/2 f^((3))(t) dif t \
  &= dots.h.c \
  &= P_n (x) + (-1)^n integral_c^x (t-x)^n/n! f^((n+1))(t) dif t $
]

#definition[
  The Peano form of the remainder is
  $ R_n (x) = o(abs(x - c)^n), quad x -> c. $ 
]

#definition(title: [Radius of Convergence])[
  Let $R_n (x)$ be the remainder to the Taylor polynomial around a point $c$.
  The _radius of convergence_ $R$ is the supremum of $r >= 0$ such that
  $ forall x : abs(x - c) < r ==> lim_(n->oo) R_n (x) = 0, $
  which implies that the Taylor series converges to $f(x)$
  for all such $x$ (so $f(x) = P_oo (x)$).
]

#theorem(title: [Common Maclaurin Series])[
  The following functions have a Maclaurin series with
  radius of convergence $r = oo$:
  #block[$
    & e^x = sum_(k=0)^oo x^k / k! = 1 + x + x^2/2! + x^3/3! + dots.h.c \
    & sin x = sum_(k=0)^oo (-1)^k x^(2k+1) / (2k+1)! = x - x^3/3!
      + x^5/5! - dots.h.c \
    & cos x = sum_(k=0)^oo (-1)^k x^(2k) / (2k)! = 1 - x^2/2!
      + x^4/4! - dots.h.c \
    & arctan x = sum_(k=0)^oo (-1)^k x^(2k+1) / (2k+1) = x - x^3/3
      + x^5/5 - x^7/7 + dots.h.c quad(|x| <= 1) \
    & ln(1 + x) = sum_(k=1)^oo (-1)^(k+1) x^k / k = x - x^2/2
      + x^3/3 - x^4/4 + dots.h.c quad(|x| < 1) \
    & (1 + x)^a = sum_(k=0)^oo binom(a, k) x^k quad(|x| < 1) \
  $]
]

=== Function Order

#definition[ // Beware of the possibility of errors here.
  If $f$ is in something of the below of $g$:
  - little $o$: $f$ lies _below every_ constant multiple of $g$.
  - big $O$: $f$ lies _below some_ constant multiple of $g$.
  - big $Omega$: $f$ lies _above some_ constant multiple of $g$.
  - big $Theta$: $f$ lies _between two_ constant multiples of $g$.

  More explicitly:
  - little $o$:
    - $f$ is eventually smaller than any scalar multiple of $g$ as $x -> oo$
    - $f$ vanishes strictly faster than $g$ with $f/g -> 0$ as $g(x) -> 0$
  - big $O$:
    - $f$ grows at most as fast as $g$ as $x -> oo$
    - $f$ vanishes at least as fast as $g$ as $g(x) -> 0$
  - big $Omega$:
    - $f$ grows at least as fast as $g$ as $x -> oo$
    - $f$ vanishes at most as fast as $g$ as $g(x) -> 0$
  - big $Theta$:
    - $f$ grows asymptotically at the same rate as $g$ as $x -> oo$
    - $f$ vanishes asymptotically at the same rate as $g$ as $g(x) -> 0$
  For simplicity's sake we assume
  $f$ and $g$ are eventually non-negative.
  Also, by $g(x) -> 0$ we actually mean $x -> a$.
]

#theorem[
  $ f in O(g) <==> g in Omega(f) $
]

#theorem[
  $ f in o(g) ==> f in O(g) $
]

#theorem[
  $ f in O(g) ==> lim f/g "is bounded" $
]

#theorem[
  $ f in o(g) ==> lim f/g = 0 $
]

#definition(title: [Big _O_ at Infinity])[
  Let $f$ and $g$ be defined on $(c, oo)$.
  We say that $f$ belongs to the set _O_ of $g$ as $x -> oo$,
  writing $O(g(x))$, if there exists $M$ and $x_0$ such that
  $ abs(f(x)) <= M abs(g(x)), $
  for every $x > x_0$.
]

#definition(title: [Big _O_ at a Point])[
  Let $f$ and $g$ be defined on a neighborhood of $c$.
  We say that $f$ belongs to the set _O_ of $g$ around $c$,
  writing $O(g(x))$, if there exists $M$ and $delta > 0$ such that
  $ abs(f(x)) <= M abs(g(x)) $
  for every $x in (c - delta, c + delta)$.
]

#theorem(title: [Big _O_ Behavior])[
  If $h(x) = O(f(x))$ and $k(x) = O(g(x))$
  (same limiting regime), then
  $h(x) k(x) = O(f(x) g(x))$.

  If $m <= n$ then as $x -> 0$, $x^n = O(x^m)$ so
  $O(x^m) + O(x^n) = O(x^m)$. As $x -> oo$, $x^m = O(x^n)$ so
  $O(x^m) + O(x^n) = O(x^n)$.
]

#theorem[
  Let $f(x) : [a, b] -> RR$ and fix $c in [a, b]$.
  Suppose $f$ is continuously differentiable $n$ times on $[a, b]$ and
  $n + 1$ times on $(a, b)$. Then,
  $ f(x) = sum_(k=0)^n (f^((k))(c))/k! (x - c)^k + O(abs(x - c)^(n+1))
  "as" x-> c. $

  Furthermore, the coefficients $f^((k))(c) slash k!$ are
  unique to each $(x - c)^k$.
]