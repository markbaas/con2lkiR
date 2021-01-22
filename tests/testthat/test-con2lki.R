
test_that("contaminants values match with expect lki.", {
  no2  = c(15, 30, 100,  1, 201)
  o3   = c(35, 20,  58,  0, 201)
  pm10 = c(4,  30, 101,  0, 101)
  pm25 = c(45, 40,  99,  2, 110)


  expected_lki  = c(6, 6, 9, 1, 11)

  actual_lki = con2lki(no2, pm25, pm10, o3)

  expect_setequal(actual_lki, expected_lki)
})
