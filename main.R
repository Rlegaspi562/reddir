library(redditr)



crawl_reddit(n_steps = 5,
             name ='politics',
             type = 'new',
             limit = 10,
             file_name = 'reddit_data.csv',
             sleep_time = 3)


response <- read_csv('reddit_data.csv')
