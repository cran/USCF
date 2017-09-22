#' Get Elo Rating
#'
#' Given a USCF ID number, the elo() function will return the classical Elo rating of that player.
#'
#' @param id A USCF ID number
#' @return a classical Elo rating, as an integer
#' @importFrom utils read.table
#' @export
#' @examples
#' elo(12641216)
#' elo(13145890)

elo <- function(id)
{
  if (!is.double(id) & !is.integer(id))
  {
    stop("id must be an integer")
  } else
  {
  site <- paste("http://www.uschess.org/msa/MbrDtlMain.php?", id, sep = "")
  rating <- read.table(site, fill = TRUE)
  rating <- rating[[1]]
  rating <- as.character(rating)
  rating <- rating[117]
  rating <- substr(rating, 1, 4)
  if (is.character(rating))
  {
  return(as.integer(rating))
  } else
  {
    stop("Are you sure that is a valid USCF ID?")
  }
  }
}
