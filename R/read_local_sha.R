#' Read .lst file with sha
#'
#' @param path
#'
#' @return A data frame with two columns. The sha256 as returned by `sha256sum`.
#'
#' @export
#'
#' @examples
read_local_sha <- function(path) {
  shas <- read.table(
    path,
    quote = "\"",
    comment.char = "",
    col.names = c("sha256", "path")
  )
  shas
}
