
# icdhelper

An R package for converting ICD-10 diagnosis codes and ICD-10-PCS procedure codes into descriptions.

-------------------------

Overview

This package helps you:
- Convert ICD-10 codes to descriptions
- Convert procedure codes to descriptions
- Add description columns to data frames
- Make association rules (apriori) readable

-------------------------

Installation

install.packages('devtools')
devtools::install_github('nishasheshashayee/icdhelper')

-------------------------

Load package

library(icdhelper)

-------------------------

Example 1: Single ICD code

icd_desc('I10')

-------------------------

Example 2: Multiple ICD codes

icd_desc(c('I10','E11'))

-------------------------

Example 3: Add descriptions to a data frame

df <- data.frame(code = c('I10','E11'))
df2 <- add_icd_desc(df, 'code')

-------------------------

Example 4: Insert description column

df2 <- add_icd_desc_df(df, 'code')

-------------------------

Procedure codes

proc_desc('0DJ07ZZ')

df_proc <- data.frame(proc = c('0DJ07ZZ'))
df_proc2 <- add_proc_desc_df(df_proc, 'proc')

-------------------------

Association rules

rules_with_desc(rules)
proc_rules_with_desc(rules)

-------------------------

Data

Dictionaries are stored inside the package (inst/extdata)

-------------------------

Author

Nisha Sheshashayee

-------------------------

Notes

- Works with ICD-10 diagnosis codes
- Works with ICD-10-PCS procedure codes
- Accepts single values and vectors
")
