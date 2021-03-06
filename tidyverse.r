## 
## Some tidyverse efficiencies
##

library('tidyverse')

## Use list of IDs from a roster-type file to create variable in census

load('fall2017.RData') # Fall census file

# get IDs of interest from roster - tidyverse efficiency is that you just create vector of IDs
i <- read_csv('sports-roster.csv') %>% 
  filter(sport == 'badminton') %>%
  pull(ID)
  
fall2017 <- fall2017 %>% 
  mutate(badminton = ifelse(ID %in% i, 1, 0))


## Filtering joins can be very helpful

s <- read_csv('sports-roster.csv')

# Census for only those who participated in badminton
fall2017 %>% 
  semi_join(s, by = 'ID') # add to pipeline here

# Census for non badminton people
fall2017 %>% 
  anti_join(s, by = 'ID') # add to pipeline here


## Troubleshooting joins

# you can use pipes to look at results of join prior to creating dataframe in your workspace
fall2017 %>% 
  left_join(s, by = 'ID') %>% 
  count(sport) # did join behave as expected?
