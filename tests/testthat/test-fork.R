# tests for fork
context("fork")

test_that("fork works", {
  forked <- gist(id='1642874') %>% fork()
  
  expect_equal(length(forked), 16)
  expect_is(forked, "gist")
  
  # cleanup
  suppressMessages(forked %>% delete())
})

test_that("forks works", {
  expect_equal(length(gist(id='1642874') %>% forks(per_page=2)), 2)
  
  hh <- gist(id='1642874') %>% forks(per_page=2)
  expect_is(hh[[1]], "gist")
})
