
#' House of Lords Amendments.
#'
#' Returns a tibble with all available House of Lords amendments, subject
#' to parameters.
#'
#' @param decision The decision on the amendments. Accepts one of
#' `'Withdrawn'`, `'Agreed'`, `'Disagreed'`, `'Pending'`,
#' `'NotMoved'`, `'Disposed'`. This parameter is not case sensitive.
#' Defaults to `NULL`.
#'
#' @param start_date Only includes amendments to bills introduced on or after
#' this date. Accepts character values in `'YYYY-MM-DD'` format, and
#' objects of class `Date`, `POSIXt`, `POSIXct`, `POSIXlt`
#' or anything else that can be coerced to a date with `as.Date()`.
#' Defaults to `'1900-01-01'`.
#'
#' @param end_date Only includes amendments to bills introduced on or before
#' this date. Accepts character values in `'YYYY-MM-DD'` format, and
#' objects of class `Date`, `POSIXt`, `POSIXct`, `POSIXlt`
#' or anything else that can be coerced to a date with `as.Date()`.
#' Defaults to the current system date.
#' @inheritParams all_answered_questions
#' @return A tibble with details on amendments proposed by the House of Lords.
#'
#' @export
#' @examples
#' \dontrun{
#' x <- lords_amendments()
#'
#' x <- lords_amendments(decision = "Withdrawn")
#' }
#'
lords_amendments <- function(decision = NULL, start_date = "1900-01-01",
                             end_date = Sys.Date(), extra_args = NULL,
                             tidy = TRUE, tidy_style = "snake",
                             verbose = TRUE) {
  dates <- paste0(
    "&min-bill.date=", as.Date(start_date),
    "&max-bill.date=", as.Date(end_date)
  )

  decision_query <- ifelse(
    is.null(decision) == FALSE,
    paste0("&decision=", gsub(
      "\\b([[:lower:]])([[:lower:]]+)", "\\U\\1\\L\\2",
      tolower(decision),
      perl = TRUE
    )),
    ""
  )

  baseurl <- paste0(url_util, "lordsbillamendments.json?")

  if (verbose == TRUE) {
    message("Connecting to API")
  }

  ammend <- jsonlite::fromJSON(paste0(
    baseurl, decision_query,
    dates, extra_args, "&_pageSize=1"
  ),
  flatten = TRUE
  )

  jpage <- floor(ammend$result$totalResults / 100)

  pages <- list()

  query <- paste0(baseurl, decision_query, dates, extra_args)

  df <- loop_query(query, jpage, verbose) # in utils-loop.R

  if (nrow(df) == 0) {
    message("The request did not return any data.
                Please check your parameters.")
  } else {
    if (tidy == TRUE) {
      df <- lords_amendments_tidy(df, tidy_style)
    }

    df
  }
}


#' @rdname lords_amendments
#' @export
hansard_lords_amendments <- lords_amendments
