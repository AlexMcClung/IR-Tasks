## Create Grade Distribution Report from Student Courses File

Start with repeating rows data extract from Banner or other enterprise database

```r
require('tidyverse')

df <- read_csv('student-courses.csv')

```
Student|Subject|Course Number|Final Grade
-------|-------|-------------|-----------
1|BIOL|101|C-
