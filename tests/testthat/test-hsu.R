context("Hsu's Backward Construction")


test_that("Default example", {
  data.graph <- structure(list(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                               to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                               cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L)),
                          .Names = c("from", "to", "cost"), class = "data.frame", row.names = c(NA, -13L))
  data.fpaths <- structure(list(V1 = c("u", "u", "w", "x"), V2 = c("v", "w", "v","w"), V3 = c("y", "y", "y", "v"),
                           V4 = c("u", "u", "", "y"), V5 = c("", "", "", "t")),
                      .Names = c("V1", "V2", "V3", "V4", "V5"), class = "data.frame", row.names = c(NA, -4L))

  expected.gStar <- structure(list(from = c("s", "s", "s", "w", "x", "v", "v", "y", "y", "u", "u|v", "u", "u|w", "w",
                                            "x", "x|w", "w|v", "x|w", "x|w|v"),
                                   to = c("u", "w", "x", "y", "y", "y", "t", "t", "u", "u|v", "u|v|y", "u|w", "u|v|y",
                                          "w|v", "x|w", "x|w|v", "t", "y", "t"),
                                   cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L)),
                              .Names = c("from", "to", "cost"),
                              row.names = c("1", "2", "3", "7", "9", "10", "11", "12", "13", "14", "21", "31",
                                            "4", "16", "23", "33", "17", "24", "34"), class = "data.frame")

  expect_equal(modify_graph_hsu(data.graph, data.fpaths), expected.gStar)
})



test_that("Additional example", {
  data.graph <- structure(list(from = c("c", "c", "u", "u", "t", "a", "a", "r", "e", "e", "e", "p", "i", "i", "n", "o"),
                               to = c("u", "p", "e", "t", "a", "r", "i", "u", "r", "i", "p", "n", "n", "o", "o", "m")),
                          .Names = c("from", "to"), row.names = c(NA, -16L), class = "data.frame")
  data.fpaths <- structure(list(u = c("u", "p", "a"), e = c("t", "n", "i"),
                                r = c("a", "o", "n"), u_1 = c("r", "m", "o"), X5 = c("u", NA, NA)),
                           .Names = c("u", "e", "r", "u_1", "X5"), row.names = c(NA, -3L), class = "data.frame")

  expected.gStar <- structure(list(from = c("c", "c", "u", "t", "a", "r", "e", "e", "e", "i", "i", "n", "o", "u", "u|t",
                                            "u|t|a", "p", "p|n", "a", "a|i", "u|t|a", "a|i"),
                                   to = c("u", "p", "e", "a", "r", "u", "r", "i", "p", "n", "o", "o", "m", "u|t",
                                          "u|t|a", "u|t|a|r", "p|n", "p|n|o", "a|i", "a|i|n", "a|i", "o")),
                              .Names = c("from", "to"),
                              row.names = c("1", "2", "3", "5", "6", "8", "9", "10", "11", "13", "14", "15", "16", "17",
                                            "22", "32", "4", "52", "62", "7", "18", "23"), class = "data.frame")

  expect_equal(modify_graph_hsu(data.graph, data.fpaths, 3L), expected.gStar)
})




test_that("Wrong input", {
  data.graph <- structure(list(from = c("s", "s", "s", "u", "u", "w", "w", "x", "x", "v", "v", "y", "y"),
                               to = c("u", "w", "x", "w", "v", "v", "y", "w", "y", "y", "t", "t", "u"),
                               cost = c(1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L, 1L)),
                          .Names = c("from", "to", "cost"), class = "data.frame", row.names = c(NA, -13L))
  data.fpaths <- structure(list(V1 = c("u", "u", "w", "x"), V2 = c("v", "w", "v","w"), V3 = c("y", "y", "y", "v"),
                                V4 = c("u", "u", "", "y"), V5 = c("", "", "", "t")),
                           .Names = c("V1", "V2", "V3", "V4", "V5"), class = "data.frame", row.names = c(NA, -4L))

  expect_error(modify_graph_hsu(NULL, data.fpaths, 1L))
  expect_error(modify_graph_hsu(NA, NA))
  expect_error(modify_graph_hsu(data.graph, NULL))
  expect_error(modify_graph_hsu("123", data.fpaths))
  expect_error(modify_graph_hsu(data.graph, 1234))
  expect_error(modify_graph_hsu(c(123,46), c(789,456)))
})