## Create Grade Distribution Report from Student Courses File

Start with repeating rows data extract from Banner or other enterprise database

```r
require('tidyverse')

df <- read_csv('student-courses.csv')

```
Student|Subject|Course Number|Final Grade
-------|-------|-------------|-----------
1|BIOL|101|C-
1|MATH|101|B-
2|ENGL|201|B+
2|SPAN|201|A-
