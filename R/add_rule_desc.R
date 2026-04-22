#' Add descriptions to rule table codes
#'
#' @param rules_df A data frame with LHS and RHS columns.
#' @return The same data frame with LHS_desc and RHS_desc added.
#' @export
add_rule_desc <- function(rules_df) {
  norm_rule <- function(x) gsub("[\\{\\}]", "", x)
  rules_df$LHS_desc <- vapply(norm_rule(rules_df$LHS), icd_desc, character(1))
  rules_df$RHS_desc <- vapply(norm_rule(rules_df$RHS), icd_desc, character(1))
  rules_df
}
