% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/con2lki.R
\name{con2lki}
\alias{con2lki}
\title{Calculate lki from contaminants}
\usage{
con2lki(no2, pm25, pm10, o3)
}
\arguments{
\item{no2}{A vector of no2 values}

\item{pm25}{A vector of pm25 values}

\item{pm10}{A vector of pm10 values}

\item{o3}{A vector of o3 values}
}
\value{
A vector of lki values
}
\description{
LKI is the air quality index used by the Netherlands. The index summarises
data on air quality. Each substance concentration is converted into a
number from 1 (little pollution) to 11 (a lot of pollution). The substance
with the hight index value determines to whole air quality index. If all
substances have the same index value, the total index value will be
one point higher.
}
\details{
This index was created on the basis of scientific studies of the health
effects of air pollution. From these studies it can be deduced at what
concentrations a certain percentage of the population can be affected.
For more information see:
https://www.rivm.nl/bibliotheek/rapporten/2014-0050.pdf
}
\examples{
library(dplyr)

df <- data.frame(
    no2  = c(15, 30, 100,  1, 201),
    o3   = c(35, 20,  58,  0, 201),
    pm10 = c(4,  30, 101,  0, 101),
    pm25 = c(45, 40,  99,  2, 110)
)

df \%>\% mutate(
    lki = con2lki(no2, pm25, pm10, o3)
)

}
