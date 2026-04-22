#' Add ICD descriptions next to code column
#'
#' Takes a data frame with a code column and inserts a description column
#' immediately after it.
#'
#' @param df A data frame.
#' @param code_col Column name containing ICD codes, given as a string.
#' @param desc_col Name of the new description column.
#' @return The input data frame with description column inserted after code_col.
#' @export
add_icd_desc_df <- function(df, code_col = "code", desc_col = "desc") {
  if (!code_col %in% names(df)) {
    stop(sprintf("Column '%s' not found in df.", code_col))
  }
  desc <- icd_desc(df[[code_col]])
  pos <- match(code_col, names(df))
  df[[desc_col]] <- desc
  names(df) <- append(names(df)[-length(names(df))], desc_col, after = pos)
  df
}
