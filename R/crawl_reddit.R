#' @export crawl_reddit
crawl_reddit <- function(
    n_steps = 5,
    name ='all',
    type = 'new',
    limit = 1000,
    file_name = 'reddit_data.csv',
    sleep_time = 2
) {
    walk(
        5:1,
        function(iteration) {
            message(glue('{iteration} steps left'))
            response <-
                get_submission(
                    reddit = reddit_connector(),
                    name = name,
                    type = type,
                    limit = limit
                )
            if (!file_exists(file_name)) {
                write_csv(response, file_name)
            } else {
                write_csv(response, file_name, append = TRUE)
            }
            glimpse(response)
            message('Sleeping for two seconds')
            Sys.sleep(sleep_time)
        }
    )
}
