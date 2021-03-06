

#' Defunct parameters for hansard package
#'
#'

lords_ammendments <- function() {
  .Defunct("lords_amendments")
  lords_amendments()
}



lords_vote_record <- function(lord.id,
                              lordsRecord = c(
                                "all", "content",
                                "notContent"
                              )) {
  .Deprecated("lord_vote_record")
  lord_vote_record(peer_id = lord.id, lobby = tolower(lordsRecord))
}



#' House of Lords attendance - Deprecated
#
#' Deprecated function, please see [lords_attendance_date()] and
#' [lords_attendance_session()].
#'
#' Imports data on House of Lords attendance. Please note that the attendance
#' data is not as tidy as some of the others that are accessible through this
#' API, and so additional work to prepare this data in a way that you want may
#' be required.
#'
#' @param session_id The ID of the House of Lords session. If `NULL`,
#' returns a list of all sessions, subject to other parameters.
#' Defaults to `NULL`.
#'
#' @param start_date Only includes attendance on or after this date. Accepts
#' character values in `'YYYY-MM-DD'` format, and objects of class
#' `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything else
#' that can be coerced to a date with `as.Date()`.
#' Defaults to `'1900-01-01'`.
#'
#' @param end_date Only includes attendance on or before this date. Accepts
#' character values in `'YYYY-MM-DD'` format, and objects of class
#' `Date`, `POSIXt`, `POSIXct`, `POSIXlt` or anything
#' else that can be coerced to a date with `as.Date()`.
#' Defaults to the current system date.
#' @inheritParams all_answered_questions
#' @return A tibble with details on the lords who attended a given session.
#' @export
#' @examples
#' \dontrun{
#' x <- lords_attendance(session_id = 706178)
#' }
#' @export
lords_attendance <- function(session_id = NULL, start_date = "1900-01-01",
                             end_date = Sys.Date(),
                             extra_args = NULL, tidy = TRUE,
                             tidy_style = "snake", verbose = TRUE) {

  # .Deprecated('lords_attendance_session')

  warning("lords_attendance has been deprecated.
            To retrieval attendance data by session,
            use lords_attendance_session. By date, use lords_attendance_date")

  if (is.null(session_id) == FALSE) {
    query <- paste0("/", session_id, ".json?")
  } else {
    query <- ".json?"
  }

  dates <- paste0(
    "&max-date=", as.Date(end_date),
    "&min-date=", as.Date(start_date)
  )

  baseurl <- paste0(url_util, "lordsattendances")

  if (verbose == TRUE) {
    message("Connecting to API")
  }

  attend <- jsonlite::fromJSON(paste0(
    baseurl, query,
    dates, extra_args
  ), flatten = TRUE)

  if (is.null(session_id) == FALSE) {
    df <- tibble::as_tibble(as.data.frame(attend$result$primaryTopic))
  } else {
    jpage <- floor(attend$result$totalResults / 100)

    pages <- list()

    for (i in 0:jpage) {
      mydata <- jsonlite::fromJSON(paste0(
        baseurl, query, dates,
        extra_args,
        "&_pageSize=100&_page=", i
      ),
      flatten = TRUE
      )
      if (verbose == TRUE) {
        message("Retrieving page ", i + 1, " of ", jpage + 1)
      }
      pages[[i + 1]] <- mydata$result$items
    }

    df <- tibble::as_tibble(dplyr::bind_rows(pages))
  }

  if (nrow(df) == 0) {
    message("The request did not return any data.
                Please check your parameters.")
  } else {
    if (tidy == TRUE) {
      df <- lords_attendance_tidy(df, tidy_style)
    }

    df
  }
}


#' @rdname lords_attendance
#' @export
hansard_lords_attendance <- function(session_id = NULL,
                                     start_date = "1900-01-01",
                                     end_date = Sys.Date(), extra_args = NULL,
                                     tidy = TRUE, tidy_style = "snake",
                                     verbose = TRUE) {
  df <- lords_attendance(
    session_id = session_id,
    start_date = start_date, end_date = end_date,
    extra_args = extra_args, tidy = tidy,
    tidy_style = tidy_style, verbose = verbose
  )

  df
}
