context("XBASE (.dbf) imports/exports")
require("datasets")

test_that("Export to XBASE (.dbf)", {
    skip_if_not_installed("foreign")
    expect_true(export(iris, "iris.dbf") %in% dir())
})

test_that("Import from XBASE (.dbf)", {
    skip_if_not_installed("foreign")
    d <- import("iris.dbf")
    expect_true(is.data.frame(d))
    expect_true(!"factor" %in% vapply(d, class, character(1)))
})

unlink("iris.dbf")
