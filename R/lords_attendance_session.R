
#' House of Lords attendance by session
#'
#' Imports data on House of Lords attendance from each parliamentary session.
#' Please note that the attendance data is not as tidy as some of the others
#' that are accessible through this API, and so additional work to prepare
#' this data in a way that you want may be required.
#'
#' To return a tibble with all codes from available individual sessions, use
#' `lords_attendance_session(session_id=NULL)`, or use
#' [lords_sessions()] to retrieve codes for a given date range.
#' Attendance from multiple sessions can be accessed by using `lapply`
#' with the output from [lords_sessions()].
#'
#' Please note that House of Lords attendance data is not as tidy as some of
#' the others that are accessible through this API, and so additional work
#' on the return from the API may be required.
#'
#' Also note that this API does not appear to have been
#' updated with data after 2017-01-31.
#'
#' @param session_id The ID of the House of Lords session. If `NULL`,
#' returns a list of all sessions, subject to other parameters.
#' Defaults to `NULL`.
#' @inheritParams all_answered_questions
#' @return A tibble with details on the lords who attended a given session.
#' @export
#' @seealso [lords_attendance_date()]
#' @seealso [lords_sessions()]
#'
#' @examples
#' \dontrun{
#' x <- lords_attendance_session(session_id = 706178)
#'
#' # Returns a list of data frames with details of
#' # attendance for each day of a given vector of sessions.
#' u <- lords_sessions(start_date = "2017-01-01")
#' m <- lapply(u$about, lords_attendance_session)
#' }
#'
lords_attendance_session <- function(session_id = NULL, extra_args = NULL,
                                     tidy = TRUE, tidy_style = "snake",
                                     verbose = TRUE) {
  json_query <- ifelse(
    is.null(session_id) == FALSE,
    paste0("/", session_id, ".json?"),
    ".json?"
  )

  baseurl <- paste0(url_util, "lordsattendances")

  if (verbose == TRUE) {
    message("Connecting to API")
  }

  attend <- jsonlite::fromJSON(paste0(
    baseurl, json_query,
    extra_args
  ), flatten = TRUE)

  if (is.null(session_id) == FALSE) {
    if (verbose == TRUE) {
      message("Retrieving attendance data")
    }

    df <- tibble::as_tibble(as.data.frame(attend$result$primaryTopic))
  } else {
    jpage <- floor(attend$result$totalResults / 100)

    query <- paste0(baseurl, json_query, extra_args)

    df <- loop_query(query, jpage, verbose) # in utils-loop.R
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



#' @rdname lords_attendance_session
#' @export
hansard_lords_attendance_session <- lords_attendance_session
