#' reddit_connector
#' @description Given a .Renviron file, connects to reddit
#' @example
#' \dontrun {
#' reddit_connector()
#' }
#'
#' @export reddit_connector
reddit_connector <- function() {
    praw <- import("praw")
    reddit_con <- praw$Reddit(
        client_id = Sys.getenv("REDDIT_CLIENT"),
        client_secret = Sys.getenv("REDDIT_AUTH"),
        user_agent = Sys.getenv("USER_AGENT"),
        username = Sys.getenv("USERNAME"),
        password = Sys.getenv("PASSWORD")
    )
}
