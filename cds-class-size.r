# Use this to create class section size bands for the Common Data Set

df$SizeBand[df$ENROLLMENT<=9] <- '2-9' 
df$SizeBand[df$ENROLLMENT>=10 & df$ENROLLMENT<=19] <- '10-19'
df$SizeBand[df$ENROLLMENT>=20 & df$ENROLLMENT<=29] <- '20-29'
df$SizeBand[df$ENROLLMENT>=30 & df$ENROLLMENT<=39] <- '30-39'
df$SizeBand[df$ENROLLMENT>=40 & df$ENROLLMENT<=49] <- '40-49'
df$SizeBand[df$ENROLLMENT>=50 & df$ENROLLMENT<=99] <- '50-99'
df$SizeBand[df$ENROLLMENT>=100] <- '100+'

df$SizeBand <- factor(df$SizeBand, levels = c('2-9', '10-19', '20-29', '30-39', '40-49', '50-99', '100+'))

table(df$SizeBand, useNA = 'i')
