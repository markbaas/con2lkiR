
test_that("contaminants values match with expect lki.", {
  no2  = c(15, 30, 100,  1, 201)
  o3   = c(35, 20,  58,  0, 201)
  pm10 = c(4,  30, 101,  0, 101)
  pm25 = c(45, 40,  99,  2, 110)

  expected_lki  = c(6, 6, 9, 2, 11)

  actual_lki = con2lki(no2, pm25, pm10, o3)

  expect_setequal(actual_lki, expected_lki)
})

test_that("having the same lki for all substances, it get increased by 1.", {
  no2  = c(10, 30, NA, 0)
  o3   = c(20, 41, NA, 0)
  pm10 = c(11, 33, 34, 34)
  pm25 = c(12, 25, 29, 29)

  expected_lki = c(3, 5, 5, 4)

  actual_lki = con2lki(no2, pm25, pm10, o3)

  expect_setequal(actual_lki, expected_lki)
})

test_that("not all variables are present.", {
  no2  = c(10, NA, NA)
  o3   = c(NA, NA, NA)
  pm10 = c(4,  10, NA)
  pm25 = c(25, NA, 10)

  expected_lki  = c(4, 2, 2)

  actual_lki = con2lki(no2, pm25, pm10, o3)

  expect_setequal(actual_lki, expected_lki)
})
