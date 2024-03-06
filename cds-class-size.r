
#______________________________________________________________________________
# 
#  Creating class section size bands for the Common Data Set
#
#
#______________________________________________________________________________


# Simulate some course data
df <- data.frame(
  SUBJ = sample(c('BIOL','CHEM','ENGL','SOC','PSCI','ECON','HIST','SPAN'), 
                size = 50, replace = TRUE),
  NUMB = sample(c(101, 201, 301, 401), size = 50, replace = TRUE),
  ENROLLMENT = sample(2:120, size = 50)
  )


# Using only Base R
df$SizeBand[df$ENROLLMENT <= 9] <- '2-9' 
df$SizeBand[df$ENROLLMENT >= 10 & df$ENROLLMENT <= 19] <- '10-19'
df$SizeBand[df$ENROLLMENT >= 20 & df$ENROLLMENT <= 29] <- '20-29'
df$SizeBand[df$ENROLLMENT >= 30 & df$ENROLLMENT <= 39] <- '30-39'
df$SizeBand[df$ENROLLMENT >= 40 & df$ENROLLMENT <= 49] <- '40-49'
df$SizeBand[df$ENROLLMENT >= 50 & df$ENROLLMENT <= 99] <- '50-99'
df$SizeBand[df$ENROLLMENT >= 100] <- '100+'

df$SizeBand <- factor(df$SizeBand, levels = c('2-9', '10-19', '20-29', '30-39', '40-49', '50-99', '100+'))

table(df$SizeBand, useNA = 'ifany')


# Using the tidyverse
library(tidyverse)

df %>% 
  mutate(
    SizeBand = case_when(
      ENROLLMENT <= 9 ~ '2-9',
      ENROLLMENT >= 10 & ENROLLMENT <= 19 ~ '10-19',
      ENROLLMENT >= 20 & ENROLLMENT <= 29 ~ '20-29',
      ENROLLMENT >= 30 & ENROLLMENT <= 39 ~ '30-39',
      ENROLLMENT >= 40 & ENROLLMENT <= 49 ~ '40-49',
      ENROLLMENT >= 50 & ENROLLMENT <= 99 ~ '50-99',
      ENROLLMENT >= 100 ~ '100+',
      TRUE ~ 'CHECK'
      ),
    SizeBand = fct_relevel(SizeBand, '2-9'),
    SizeBand = fct_relevel(SizeBand, '100+', after=Inf)
  ) %>% 
  count(SizeBand)

