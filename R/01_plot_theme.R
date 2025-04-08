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


