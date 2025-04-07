## report font and graphic setup -----------------------------------------------


# update_geom_defaults(geom = "text",
#                      aes(family = "Open Sans"))


#' Title 
#'
#' @param ... 
#'
#' @returns
#' @export
#'
#' @examples

theme_alt <- function(...) {
  theme_bw(base_family = "Open Sans") +
    theme()
}


# Create all the files 
# Define the list of file names
qmd_files <- c("a00_hypothesis.qmd",
               "a01_outcomes.qmd",
               "a02_overviews.qmd",
               "a03_inclusion.qmd",
               "a04_randomization.qmd",
               "a05_sample_size.qmd",
               "a06_population.qmd",
               "a07_missing.qmd",
               "a08_monitoring.qmd",
               "a09_stopping.qmd",
               "a10_software.qmd",
               "a11_figures.qmd",
               "a12_tables.qmd",
               "a13_listing.qmd",
               "a14_consort.qmd",
               "a15_adherence.qmd",
               "a16_characteristics.qmd",
               "a17_safety.qmd")

# Template content for each file
template <- function(filename) {
  title <- gsub("_", " ", 
                tools::file_path_sans_ext(basename(filename)))
  title <- tools::toTitleCase(title)
  paste0(
    "---\n",
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
    "Content for ", title, " goes here.\n"
  )
}

# Write each file
for (file in qmd_files) {
  writeLines(template(file), con = file)
}

