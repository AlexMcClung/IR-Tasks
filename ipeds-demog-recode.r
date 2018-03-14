##
## PURPOSE : Recode Banner data so it sorts in IPEDS order
## 
## TO DO : uses Base R but look into easier way to do this with forcats pkg
## 


df <- read_csv('your-data-set.csv')


# IPEDS Gender
# in Banner coded M/F

table(df$GENDER, useNA = 'i')

df$GENDER[df$GENDER=='F'] <- 'W'

table(df$GENDER, useNA = 'i')


# IPEDS Race/Ethnicity 
# codes end up sorted alphabetically & levels dropped when there are none
# this adds Pac Isl back in but could be used for other levels that are 0

table(df$FedRace, useNA = 'i')

df$FedRace <- factor(df$FedRace)

df$FedRace <- factor(df$FedRace, levels = c(levels(df$FedRace), "Pac Isl"))

lvl <- c('Non-Resident Alien', 'Hispanic', 'American Indian or Alaskan Native', 'Asian', 'Black or African American',
         'Pac Isl', 'White', 'More Than One Race', 'Unknown')

df$FedRace <- factor(h2$FedRace, levels = lvl)

table(df$FedRace, useNA = 'i')
