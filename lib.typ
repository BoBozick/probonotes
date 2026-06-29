#import "src/notation.typ": *
#import "src/style.typ": style
#import "src/utils.typ": capitalize, custom-list, match-width
#import "src/theorion.typ": (
  // Base objects from TheOrion and new additions,
  // which are marked as added.
  
  // FUNCTIONS

  // Restate
  theorion-restate,
  compact-restate, // Added.
  
  // ENVIRONMENTS
  
  // Numbered boxes
  theorem,
  definition,

  // Boxes
  lemma-box as lemma,
  corollary-box as corollary,
  proposition-box as proposition,
  axiom-box as axiom,
  postulate-box as postulate,
  
  // Blocks
  note-block as note,
  remark-block as remark,
  tip-block as tip,
  warning-block as warning,
  quote-block as quotation, // Avoid name collision with 'quote' from base Typst.
  
  // Texts
  proof,
  problem,
  solution,
  example,
  examples, // Added. Only supported for Swedish and English.
)
