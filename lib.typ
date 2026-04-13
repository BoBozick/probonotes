#import "style.typ": style
#import "notation.typ": *
#import "elements.typ": capitalize, custom-list
#import "theorion.typ": (
  // Base objects from TheOrion and new additions,
  // which are marked as added.
  
  // FUNCTIONS
  theorion-restate,
  compact-restate, // Added
  
  // ENVIRONMENTS
  
  // Numbered
  theorem,
  corollary-block as corollary,
  lemma-block as lemma,
  definition,
  
  // Blocks
  warning-block as warning,
  tip-block as tip,
  note-block as note,
  remark-block as remark,
  
  // Texts
  proof,
  problem,
  solution,
  example,
  examples, // Added, only supported for Swedish and English.
)
