#' Add ICD-10 descriptions to a data frame
#'
#' @param df A data frame containing ICD codes.
#' @param code_col Column name with ICD codes.
#' @return The input data frame with a new ICD_desc column.
#' @export
add_icd_desc <- function(df, code_col = "code") {
  df$ICD_desc <- vapply(df[[code_col]], icd_desc, character(1))
  df
}
