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
    devtools.desc.author = c("Randy Jin 
                             <xin.2.jin@cuanschutz.edu> [aut, cre]",
                             "Elizabeth Juarez-Colunga 
                             <elizabeth.juarez-colunga@cuanschutz.edu> [ctb]",
                             "Katie Colborn 
                             <katie.colborn@cuanschutz.edu> [ctb]"),
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
    devtools.desc.author = c("Randy Jin 
                             <xin.2.jin@cuanschutz.edu> [aut, cre]",
                             "Elizabeth Juarez-Colunga 
                             <elizabeth.juarez-colunga@cuanschutz.edu> [ctb]",
                             "Katie Colborn 
                             <katie.colborn@cuanschutz.edu> [ctb]"),
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


# Create QMD template ----------------------------------------------------------
#' Title Create QMD template
#'
#' @param filename \code{character} The name of the file to create.
#'
#' @returns \code{character} A string containing the template for the QMD file.
#' @export
template <- function(filename) {
  title <- gsub("_", " ", 
                tools::file_path_sans_ext(basename(filename)))
  title <- tools::toTitleCase(title)
  paste0("---\n",
         "title: \"", title, "\"\n",
         "editor: source\n",
         "---\n\n",
         "```{r setup, include=FALSE}\n",
         "knitr::opts_chunk$set(echo = TRUE,\n",
         "                      warnings = FALSE,\n",
         "                      message = FALSE,\n",
         "                      comment = \"#>\",\n",
         "                      #results = \"hide\",\n",
         "                      digits = 4,\n",
         "                      error = FALSE)\n",
         "```\n\n",
         "```{css, echo=FALSE}\n",
         ".scroll-100 {\n",
         "  max-height: 300px;\n",
         "  max-width: 1000px;\n",
         "  overflow-y: auto;\n",
         "  background-color: inherit;\n",
         "}\n",
         "```\n\n",
         "## Section\n\n",
         "<!-- Content for ", title, " goes here.-->")
}

## new_aim---------------------------------------------------------------------
#' Title Create a new aim folder with all the QMD files
#'
#' @param folder \code{character} The name of the folder to create.
#' @param qmd_files \code{character} A vector of QMD file names to create. Default is a list of common QMD files.
#' @param overwrite \code{logical} If \code{TRUE}, overwrite existing files. Default is \code{FALSE}.
#'
#' @returns \code{NULL} This function does not return a value. 
#' It creates a folder and populates it with QMD files.
#' @export
#'
#' @examples 
new_aim <- function(folder,
                    qmd_files = c("index.qmd", 
                                  "references.bib",
                                  "reference.qmd",
                                  "01_hypothesis.qmd",
                                  "02_outcomes.qmd", 
                                  "03_overviews.qmd",
                                  "04_inclusion.qmd", 
                                  "05_randomization.qmd",
                                  "06_sample_size.qmd",
                                  "07_population.qmd", 
                                  "08_missing.qmd",
                                  "09_monitoring.qmd",
                                  "10_stopping.qmd", 
                                  "11_software.qmd", 
                                  "12_figures.qmd",
                                  "13_tables.qmd", 
                                  "14_listing.qmd",
                                  "15_consort.qmd",
                                  "16_adherence.qmd",
                                  "17_characteristics.qmd", 
                                  "18_safety.qmd"),
                    overwrite = FALSE) {
  if (missing(folder) || !nzchar(folder)) {
    stop("You must specify a folder name.")
  }
  
  dir.create(folder,
             showWarnings = FALSE, 
             recursive = TRUE)
  
  for (file in qmd_files) {
    full_path <- file.path(folder, file)
    
    if (file.exists(full_path) && !overwrite) {
      message("Skipping existing file: ", full_path)
      next
    }
    
    writeLines(template(file), con = full_path)
    message("Created: ", full_path)
  }
}
new_aim(folder = "new_aim",
        overwrite = TRUE)



# Create QMD template ----------------------------------------------------------
#' Title Create QMD template
#'
#' @param filename \code{character} The name of the file to create.
#'
#' @returns \code{character} A string containing the template for the QMD file.
#' @export
template <- function(filename) {
  title <- gsub("_", " ", 
                tools::file_path_sans_ext(basename(filename)))
  title <- tools::toTitleCase(title)
  paste0("---\n",
         "title: \"", title, "\"\n",
         "editor: source\n",
         "---\n\n",
         "```{r setup, include=FALSE}\n",
         "knitr::opts_chunk$set(echo = TRUE,\n",
         "                      warnings = FALSE,\n",
         "                      message = FALSE,\n",
         "                      comment = \"#>\",\n",
         "                      #results = \"hide\",\n",
         "                      digits = 4,\n",
         "                      error = FALSE)\n",
         "```\n\n",
         "```{css, echo=FALSE}\n",
         ".scroll-100 {\n",
         "  max-height: 300px;\n",
         "  max-width: 1000px;\n",
         "  overflow-y: auto;\n",
         "  background-color: inherit;\n",
         "}\n",
         "```\n\n",
         "## Section\n\n",
         "<!-- Content for ", title, " goes here.-->")
}

## new_aim---------------------------------------------------------------------
#' Title Create a new aim folder with all the QMD files
#'
#' @param folder \code{character} The name of the folder to create.
#' @param qmd_files \code{character} A vector of QMD file names to create. Default is a list of common QMD files.
#' @param overwrite \code{logical} If \code{TRUE}, overwrite existing files. Default is \code{FALSE}.
#'
#' @returns \code{NULL} This function does not return a value. 
#' It creates a folder and populates it with QMD files.
#' @export
#'
#' @examples 
new_aim <- function(folder,
                    qmd_files = c("index.qmd", 
                                  "references.bib",
                                  "reference.qmd",
                                  "01_hypothesis.qmd",
                                  "02_outcomes.qmd", 
                                  "03_overviews.qmd",
                                  "04_inclusion.qmd", 
                                  "05_randomization.qmd",
                                  "06_sample_size.qmd",
                                  "07_population.qmd", 
                                  "08_missing.qmd",
                                  "09_monitoring.qmd",
                                  "10_stopping.qmd", 
                                  "11_software.qmd", 
                                  "12_figures.qmd",
                                  "13_tables.qmd", 
                                  "14_listing.qmd",
                                  "15_consort.qmd",
                                  "16_adherence.qmd",
                                  "17_characteristics.qmd", 
                                  "18_safety.qmd"),
                    overwrite = FALSE) {
  if (missing(folder) || !nzchar(folder)) {
    stop("You must specify a folder name.")
  }
  
  dir.create(folder,
             showWarnings = FALSE, 
             recursive = TRUE)
  
  for (file in qmd_files) {
    full_path <- file.path(folder, file)
    
    if (file.exists(full_path) && !overwrite) {
      message("Skipping existing file: ", full_path)
      next
    }
    
    writeLines(template(file), con = full_path)
    message("Created: ", full_path)
  }
}
new_aim(folder = "new_aim",
        overwrite = TRUE)
