#' Get ICD-10 description for a code
#'
#' Looks up the description for one or more ICD-10 codes using the package dictionary.
#' Accepts quoted codes like "I10", bare vectors like c(I10, M272, E785),
#' and a single bare code like I10.
#'
#' @param code ICD-10 code(s), quoted or unquoted.
#' @return A character vector of descriptions.
#'
#' @examples
#' icd_desc("I10")
#' icd_desc(c("I10", "E11"))
#'
#' @export
icd_desc <- function(code) {
  dict <- load_icd_dictionary()

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
