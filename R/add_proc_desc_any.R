#' Add procedure descriptions to a vector of codes
#'
#' @param x A character vector of procedure codes.
#' @return A character vector of descriptions.
#' @export
add_proc_desc_any <- function(x) {
  vapply(x, proc_desc, character(1))
}