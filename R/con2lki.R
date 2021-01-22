#' Calculate lki from contaminants
#'
#' LKI is the air quality index used by the Netherlands. The index summarises
#' data on air quality. Each substance concentration is converted into a
#' number from 1 (little pollution) to 11 (a lot of pollution). The substance
#' with the hight index value determines to whole air quality index. If all
#' substances have the same index value, the total index value will be
#' one point higher.
#'
#' This index was created on the basis of scientific studies of the health
#' effects of air pollution. From these studies it can be deduced at what
#' concentrations a certain percentage of the population can be affected.
#' For more information see:
#' https://www.rivm.nl/bibliotheek/rapporten/2014-0050.pdf
#'
#' @param no2 A vector of no2 values
#' @param pm25 A vector of pm25 values
#' @param pm10 A vector of pm10 values
#' @param o3 A vector of o3 values
#' @return A vector of lki values
#'
#' @examples
#'
#' df <- data.frame(
#'     no2  = c(15, 30, 100,  1, 201),
#'     o3   = c(35, 20,  58,  0, 201),
#'     pm10 = c(4,  30, 101,  0, 101),
#'     pm25 = c(45, 40,  99,  2, 110)
#' )
#'
#' df %>% mutate(
#'     lki = con2lki(no2, pm25, pm10, o3)
#' )
#'
#' @export
con2lki <- function(no2, pm25, pm10, o3) {
  # check length of each vector
  stopifnot(var(c(length(no2), length(pm25), length(pm10), length(o3))) == 0)

  steps_no2 = c(0, 10, 20, 30, 45, 60, 75, 100, 125, 150, 200)
  steps_pm25 = c(0, 10, 15, 20, 30, 40, 50, 70, 90, 100, 140)
  steps_pm10 = c(0, 10, 20, 30, 45, 60, 75, 100, 125, 150, 200)
  steps_o3 = c(0, 15, 30, 40, 60, 80, 100, 140, 180, 200, 240)

  lki_no2 <- findInterval(no2, steps_no2)
  lki_pm25 <- findInterval(pm25, steps_pm25)
  lki_pm10 <- findInterval(pm10, steps_pm10)
  lki_o3 <- findInterval(o3, steps_o3)

  lki <- pmax(lki_no2, lki_pm25, lki_pm10, lki_o3)

  if (var(c(lki_no2, lki_pm25, lki_pm10, lki_o3)) == 0) {
    lki <- lki + 1
  }

  lki
}
