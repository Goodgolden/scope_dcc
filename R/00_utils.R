# Miscellaneous function -------------------------------------------------------

## this file contains some of the functions used in this project
## be careful use in other situations, not sure for correctness

## read_excel_allsheets --------------------------------------------------------
#' Read Multiple Sheets from an Excel File
#'
#' @description This function reads all sheets from an Excel file and returns them as a list of data frames or tibbles, depending on the format specified by the \code{tibble} argument.
#'
#' @param filename \code{character} The file path of the Excel file to read.
#' @param tibble \code{logical} If \code{TRUE}, the sheets will be returned as tibbles (default behavior of \code{readxl}). If \code{FALSE}, the sheets will be converted to \code{data.frame}. Defaults to \code{FALSE}.
#'
#' @return A list of data frames (or tibbles), where each element corresponds to a sheet in the Excel file, with sheet names as the list names.
#' @export
#'
#' @examples
#' \dontrun{
#'   # Reading an Excel file and returning the sheets as data.frames
#'   sheets <- read_excel_allsheets("path_to_file.xlsx", tibble = FALSE)
#'
#'   # Reading an Excel file and returning the sheets as tibbles
#'   sheets <- read_excel_allsheets("path_to_file.xlsx", tibble = TRUE)
#' }

read_excel_allsheets <- function(filename, tibble = FALSE) {
  # I prefer straight data.frames
  # but if you like tidyverse tibbles (the default with read_excel)
  # then just pass tibble = TRUE
  sheets <- readxl::excel_sheets(filename)
  x <- lapply(sheets, function(X) readxl::read_excel(filename, sheet = X))
  if(!tibble) x <- lapply(x, as.data.frame)
  names(x) <- sheets
  return(x)
}



## package info ----------------------------------------------------------------
.onAttach <- function(libname, pkgname) {
  packageStartupMessage("Welcome to ", pkgname, " version 0.0.1 !\n",
                        "For help, use: ?scope\n",
                        "To cite this package in publications, use: citation('", pkgname, "')\n",
                        "\n",
                        "Note: This package makes use of the following important packages:\n",
                        " - tidyverse: To cite tidyverse, use: citation('tidyverse')\n",
                        "\n",
                        "Check the documentation for more details and examples! \n",
                        "This package is developed by Randy Jin's PhD. \n")
}


.onLoad <- function(libname, pkgname) {
  ## Retrieve the current R options
  op <- options()
  
  ## Define custom options related
  ## to package development using devtools
  op.devtools <- list(
    devtools.path = "~/R-dev",
    ## Default path for package development
    devtools.install.args = "",
    ## Arguments to be passed to install.packages
    devtools.name = "Randy Jin",
    devtools.desc.author = c("Randy Jin <xin.2.jin@cuanschutz.edu> [aut, cre]",
                             "Elizabeth Juarez-Colunga <elizabeth.juarez-colunga@cuanschutz.edu> [ctb]",
                             "Katie Colborn <katie.colborn@cuanschutz.edu> [ctb]"),
    ## Package author and maintainer
    devtools.desc.license = "MIT",
    ## Default license for the package
    devtools.desc.suggests = NULL,
    ## Suggested packages, if any
    devtools.desc = list()
    ## Additional description fields can be added here
  )
  
  ## Check if the options are already set,
  ## and set them only if they are not
  toset <- !(names(op.devtools) %in% names(op))
  if (any(toset)) options(op.devtools[toset])
  
  ## Ensure the function runs silently
  invisible()
}