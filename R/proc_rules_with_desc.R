#' Add procedure descriptions to association rules
#'
#' @param rules An object of class rules from arules.
#' @return A data.frame with descriptions placed next to lhs and rhs.
#' @export
proc_rules_with_desc <- function(rules) {
  lhs_txt <- labels(lhs(rules))
  rhs_txt <- labels(rhs(rules))
  
  code_to_desc <- function(x) {
    x <- gsub("[\\{\\}]", "", x)
    if (x == "") return(NA_character_)
    parts <- unlist(strsplit(x, ","))
    desc <- vapply(parts, proc_desc, character(1))
    paste(desc, collapse = " + ")
  }
  
  q <- quality(rules)
  
  data.frame(
    lhs = lhs_txt,
    lhs_desc = vapply(lhs_txt, code_to_desc, character(1)),
    rhs = rhs_txt,
    rhs_desc = vapply(rhs_txt, code_to_desc, character(1)),
    support = q$support,
    confidence = q$confidence,
    coverage = q$coverage,
    lift = q$lift,
    count = q$count,
    stringsAsFactors = FALSE
  )
}