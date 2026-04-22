#' Load ICD-10-PCS procedure dictionary
#'
#' Reads the procedure code dictionary bundled inside the package.
#'
#' The Excel file must be stored in `inst/extdata/procedure_list.xlsx`
#' and must contain two columns: `code` and `description`.
#'
#' @return A data frame with procedure codes and descriptions.
#' @export
load_proc_dictionary <- function() {
  xlsx_file <- system.file("extdata", "procedure_list.xlsx", package = "icdhelper")
  if (!nzchar(xlsx_file)) {
    stop("procedure_list.xlsx not found in package extdata.")
  }
  
  dict <- readxl::read_xlsx(xlsx_file)
  
  names(dict) <- tolower(names(dict))
  if (!all(c("code", "description") %in% names(dict))) {
    if ("desc" %in% names(dict)) names(dict)[names(dict) == "desc"] <- "description"
    if ("label" %in% names(dict)) names(dict)[names(dict) == "label"] <- "description"
    if ("procedure_code" %in% names(dict)) names(dict)[names(dict) == "procedure_code"] <- "code"
    if ("proc_code" %in% names(dict)) names(dict)[names(dict) == "proc_code"] <- "code"
  }
  
  if (!all(c("code", "description") %in% names(dict))) {
    stop("procedure_list.xlsx must contain columns named code and description.")
  }
  
  dict <- dict[, c("code", "description")]
  dict$code <- trimws(as.character(dict$code))
  dict$description <- as.character(dict$description)
  dict <- dict[!is.na(dict$code) & dict$code != "", , drop = FALSE]
  
  dict
}