# Loading in redditr package, check description for more info
library(redditr)


# This code chunk lets me parameterize
crawl_reddit(n_steps = 5,
             name ='politics',
             type = 'new', # what is this again?
             limit = 10,
             file_name = 'reddit_data.csv',
             sleep_time = 3)

#reads the output into csv and stores it inside response
response <- read_csv('reddit_data.csv')


#This code groups by to isolate distinct observations by submission key
response <-
  response %>%
  group_by(submission_key) %>%
  mutate(
    id = row_number()
  )

