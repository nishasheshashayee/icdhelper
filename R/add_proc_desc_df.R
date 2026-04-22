#' Add ICD-10-PCS descriptions to a data frame
#'
#' Takes a data frame with a procedure code column and inserts a description
#' column immediately after it.
#'
#' @param df A data frame.
#' @param proc_col Column name containing procedure codes, given as a string.
#' @param desc_col Name of the new description column.
#' @return The input data frame with description column inserted after proc_col.
#' @export
add_proc_desc_df <- function(df, proc_col = "proc", desc_col = "desc") {
  if (!is.data.frame(df)) stop("df must be a data frame.")
  if (!proc_col %in% names(df)) {
    stop(sprintf("Column '%s' not found in df.", proc_col))
  }
  if (!is.character(proc_col) || length(proc_col) != 1) {
    stop("proc_col must be a single string.")
  }
  if (!is.character(desc_col) || length(desc_col) != 1) {
    stop("desc_col must be a single string.")
  }
  
  pos <- match(proc_col, names(df))
  desc <- proc_desc(df[[proc_col]])
  
  if (desc_col %in% names(df)) {
    df[[desc_col]] <- NULL
  }
  
  df[[desc_col]] <- desc
  
  nms <- names(df)
  nms <- c(nms[seq_len(pos)], desc_col, nms[seq_len(pos - 1) + pos < length(nms)])
  nms <- unique(nms)
  df <- df[, nms, drop = FALSE]
  
  df
}