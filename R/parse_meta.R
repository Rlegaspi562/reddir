#' @export parse_meta
parse_meta <- function(subreddit_data) {
    chosen_columns <- c(
        "author",
        "author_fullname",
        "author_premium",
        "author_patreon_flair",
        "can_gild",
        "can_mod_post",
        "clicked",
        "comment_limit",
        "created",
        "created_utc",
        "downs",
        "edited",
        "fullname",
        "gilded",
        "hidden",
        "hide_score",
        "id",
        "is_crosspostable",
        "is_meta",
        "is_original_content",
        "is_reddit_media_domain",
        "is_robot_indexable",
        "is_self",
        "is_video",
        "locked",
        "media_only",
        "name",
        "no_follow",
        # 'num_comments',
        # 'num_crossposts',
        # 'num_duplicates',
        "over_18",
        # 'parent_whitelist_status',
        "permalink",
        "pinned",
        # 'pwls',
        "quarantine",
        "saved",
        # 'score',
        "selftext",
        # 'send_replies',
        "shortlink",
        # 'spoiler',
        # 'stickied',
        "subreddit",
        "subreddit_id",
        "subreddit_name_prefixed",
        "subreddit_subscribers",
        "subreddit_type",
        "thumbnail",
        "title",
        # 'total_awards_received',
        # 'ups',
        # 'upvote_ratio',
        "url"
    )

    meta_data <- as_tibble(t(tibble(map_chr(chosen_columns, function(x) {
        tryCatch(
            {
                # if(as.character(subreddit_data)=='giy5fv') {
                #   browser()
                # }
                response <- tryCatch(
                    {
                        as.character(subreddit_data[[x]])
                    },
                    error = function(err) {
                        as.character(err)
                    }
                )
                if (is.null(response) | length(response) == 0) {
                    return("")
                }
                response
            },
            error = function() {
                return("")
            }
        )
    }))), .name_repair = "minimal")

    colnames(meta_data) <- chosen_columns

    meta_data %>%
        mutate_at(vars(starts_with("num")), as.numeric) %>%
        mutate_at(vars(starts_with("is")), as.logical) %>%
        mutate(
            created_utc = as.POSIXct(x = as.numeric(created_utc), origin = "1970-01-01", tz = "UTC")
        )

}
