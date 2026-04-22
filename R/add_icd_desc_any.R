#' Add ICD-10 descriptions to a vector of codes
#'
#' @param x A character vector of ICD codes.
#' @return A character vector of descriptions.
#' @export
add_icd_desc_any <- function(x) {
  vapply(x, icd_desc, character(1))
}
