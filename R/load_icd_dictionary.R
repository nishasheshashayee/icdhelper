#' Load ICD-10 dictionary
#'
#' Reads the ICD-10 code dictionary bundled inside the package.
#'
#' @return A data frame with ICD-10 codes and descriptions.
#' @export
load_icd_dictionary <- function() {
  xlsx_file <- system.file("extdata", "icd10_unique_codes.xlsx", package = "icdhelper")
  if (!nzchar(xlsx_file)) stop("icd10_unique_codes.xlsx not found in package extdata.")

  dict <- readxl::read_xlsx(xlsx_file)

  names(dict) <- tolower(names(dict))
  if ("icd_code" %in% names(dict)) names(dict)[names(dict) == "icd_code"] <- "code"
  if ("icd10_code" %in% names(dict)) names(dict)[names(dict) == "icd10_code"] <- "code"
  if ("desc" %in% names(dict)) names(dict)[names(dict) == "desc"] <- "description"
  if ("label" %in% names(dict)) names(dict)[names(dict) == "label"] <- "description"

  dict
}
