## Create Grade Distribution Report from Student Courses File

Start with repeating rows data extract from Banner or other enterprise database

```r
require('tidyverse')

df <- read_csv('student-courses.csv')

```
Student|Subject|CourseNumber|FinalGrade
-------|-------|------------|----------
1|BIOL|101|C-
1|MATH|101|B-
2|ENGL|201|B+
2|SPAN|201|A-

```r
df$Course <- paste(df$Subject, df$CourseNumber)

df$FinalGrade <- ifelse(df$FinalGrade %in% c(), 'A', df$FinalGrade) # example for recoding any errant values
df$FinalGrade <- factor(df$FinalGrade, levels = c()) # specify the correct order of grades

# produce the distribution
gd <- as.data.frame.matrix(table(df$Course, df$FinalGrade))

# output to csv
write_csv(gd, 'grade-dist.csv')
```
