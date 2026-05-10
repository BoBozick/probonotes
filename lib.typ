#import "src/notation.typ": *
#import "src/style.typ": style
#import "src/utils.typ": capitalize, custom-list
#import "src/theorion.typ": (
  // Base objects from TheOrion and new additions,
  // which are marked as added.
  
  // FUNCTIONS

  // Restate
  theorion-restate,
  compact-restate, // Added.
  
  // ENVIRONMENTS
  
  // Numbered
  theorem,
  definition,
  axiom-box as axiom,
  lemma-box as lemma,
  corollary-box as corollary,
  
  // Blocks
  note-block as note,
  remark-block as remark,
  tip-block as tip,
  warning-block as warning,
  quote-block as quotation, // Avoid name collision with quote.
  
  // Texts
  proof,
  problem,
  solution,
  example,
  examples, // Added. Only supported for Swedish and English.
)
