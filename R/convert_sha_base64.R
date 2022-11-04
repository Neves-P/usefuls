#' Convert sha256 to base 64 using system call to xxd
#'
#' @note At the moment this function only works correctly on unix like systems.
#' This is because the system call relies on the pipe which is intepreted
#' differently in Windows.
#'
#' @param sha256 Character vector with sha256 sum to be converted.
#'
#' @return Charecter vector with the converted string.
#' @export
#'
#' @examples
#'
convert_sha_base64 <- function(sha256) {
  if (.Platform$OS.type == "unix") {
    command <- paste0("echo ", sha256, " | xxd -r -p | base64")
    converted_sha <- system(command, intern = TRUE)
    testit::assert(length(converted_sha) >= 1 && is.character(converted_sha))
    converted_sha
  } else {
    stop("This function requires a Unix-like system to run.")
  }
}
