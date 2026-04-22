#' Get ICD-10-PCS description for a procedure code
#'
#' Looks up the description for one or more ICD-10-PCS procedure codes using
#' the package procedure dictionary.
#'
#' @param code Procedure code(s), quoted or unquoted.
#' @return A character vector of descriptions.
#' @export
proc_desc <- function(code) {
  dict <- load_proc_dictionary()
  
  norm <- function(x) toupper(gsub("[^A-Z0-9]", "", as.character(x)))
  
  code_expr <- substitute(code)
  
  code_chr <- if (is.character(code)) {
    code
  } else if (is.call(code_expr) && identical(code_expr[[1]], quote(c))) {
    as.character(code_expr[-1])
  } else {
    as.character(code_expr)
  }
  
  code2 <- norm(code_chr)
  dict_codes <- norm(dict$code)
  
  idx <- match(code2, dict_codes)
  dict$description[idx]
}