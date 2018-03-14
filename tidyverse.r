## 
## Some tidyverse efficiencies
##

require('tidyverse')

# Use list of IDs from a roster-type file to create variable in census

load('fall2017.RData') # Fall census file

# get IDs of interest from roster - tidyverse efficiency is that you just create vector of IDs
i <- read_csv('sports-roster.csv') %>% 
  filter(sport == 'badminton') %>%
  pull(ID)
  
fall2017 <- fall2017 %>% mutate(badminton = ifelse(ID %in% i, 1, 0))
