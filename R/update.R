#' Update/modify a gist
#'
#' @export
#' @param gist A gist object or something coerceable to a gist
#' @param description (character) Brief description of gist (optional)
#' @template all
#' @examples \dontrun{
#' # add new files
#' gists(what = "minepublic")[[3]] %>%
#'  add_files("~/zillowstuff.Rmd", "~/zoo.json") %>%
#'  update()
#'
#' # update existing files
#' ### file name has to match to current name
#' gists(what = "minepublic")[[3]] %>%
#'  update_files("~/zillowstuff.Rmd") %>%
#'  update()
#'
#' # delete existing files
#' ### again, file name has to match to current name
#' gists(what = "minepublic")[[3]] %>%
#'  delete_files("~/zillowstuff.Rmd") %>%
#'  update()
#'
#' # rename existing files
#' # For some reason, this operation has to upload the content too
#' ### first name is old file name with path (must match), and second is new file name (w/o path)
#' gists(what = "minepublic")[[3]] %>%
#'  rename_files(list("~/zillowstuff.Rmd", "zillow_pillow.Rmd")) %>%
#'  update()
#' ### you can pass in many renames
#' rename_files(list("~/zillowstuff.Rmd", "zillow_pillow.Rmd"),
#'              list("~/myfile.Rmd", "herfile.Rmd"))
#' }

update <- function(gist, description = gist$description, ...)
{
  files <- list(update=gist$update_files, add=gist$add_files, delete=gist$delete_files, rename=gist$rename_files)
  body <- payload(filenames = files, description)
  res <- gist_PATCH(gist$id, gist_auth(), ghead(), body, ...)
  as.gist(res)
}
