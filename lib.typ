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
  lemma-block as lemma,
  corollary-block as corollary,
  
  // Blocks
  note-block as note,
  tip-block as tip,
  remark-block as remark,
  warning-block as warning,
  
  // Texts
  proof,
  problem,
  solution,
  example,
  examples, // Added. Only supported for Swedish and English.
)
