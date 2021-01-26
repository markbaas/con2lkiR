
<!-- README.md is generated from README.Rmd. Please edit that file -->

# con2lki

<!-- badges: start -->

[![CRAN
status](https://www.r-pkg.org/badges/version/con2lki)](https://CRAN.R-project.org/package=con2lki)
[![Travis build
status](https://travis-ci.com/markbaas/con2lkiR.svg?branch=master)](https://travis-ci.com/markbaas/con2lkiR)
<!-- badges: end -->

LKI is the air quality index used by the Netherlands. The index
summarises data on air quality. Each substance concentration is
converted into a number from 1 (little pollution) to 11 (a lot of
pollution). The substance with the hight index value determines to whole
air quality index. If all substances have the same index value, the
total index value will be one point higher.

This index was created on the basis of scientific studies of the health
effects of air pollution. From these studies it can be deduced at what
concentrations a certain percentage of the population can be affected.
For more information see:
<https://www.rivm.nl/bibliotheek/rapporten/2014-0050.pdf>

## Installation

You can install the released version of con2lki from
[CRAN](https://CRAN.R-project.org) with:

``` r
install.packages("con2lki")
```

## Example

This is a basic example:

``` r
library(dplyr, quietly = T, warn = F)
library(con2lki)

df <- data.frame(
   no2  = c(15, 30, 100,  1, 201),
   o3   = c(35, 20,  58,  0, 201),
   pm10 = c(4,  30, 101,  0, 101),
   pm25 = c(45, 40,  99,  2, 110)
)

df %>% mutate(
   lki = con2lki(no2, pm25, pm10, o3)
)
#>   no2  o3 pm10 pm25 lki
#> 1  15  35    4   45   6
#> 2  30  20   30   40   6
#> 3 100  58  101   99   9
#> 4   1   0    0    2   2
#> 5 201 201  101  110  11
```
