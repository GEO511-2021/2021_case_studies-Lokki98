Case Study 04
================
Ziqi Tang
August 1, 2020

``` r
library(tidyverse)
library(nycflights13)
```

``` r
farthest_airport <- flights %>%
  arrange(desc(distance)) %>%
  slice(1) %>% 
  inner_join(airports, by=c("dest"="faa")) %>%
  select(name) 
as.character(farthest_airport) 
```

    ## [1] "Honolulu Intl"
