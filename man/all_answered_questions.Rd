% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/all_answered_questions.R
\name{all_answered_questions}
\alias{all_answered_questions}
\alias{hansard_all_answered_questions}
\title{All answered parliamentary questions}
\usage{
all_answered_questions(mp_id = NULL, tabling_mp_id = NULL,
  house = NULL, answering_body = NULL, start_date = "1900-01-01",
  end_date = Sys.Date(), extra_args = NULL, tidy = TRUE,
  tidy_style = "snake", verbose = TRUE)

hansard_all_answered_questions(mp_id = NULL, tabling_mp_id = NULL,
  house = NULL, answering_body = NULL, start_date = "1900-01-01",
  end_date = Sys.Date(), extra_args = NULL, tidy = TRUE,
  tidy_style = "snake", verbose = TRUE)
}
\arguments{
\item{mp_id}{Accepts a member ID or vector of member IDs, and returns a
tibble with all available questions answered by that member. Includes both
oral and written questions, and includes members of the House of Commons
and the House of Lords. If \code{NULL}, returns a tibble with all available
answered questions, subject to other parameters. Defaults to \code{NULL}.}

\item{tabling_mp_id}{Accepts a member ID or vector of member IDs, and
returns a tibble with all available questions asked by that member,
subject to all other parameters. Includes both oral and written questions,
and includes members of the House of Commons and the House of Lords. If
\code{NULL}, returns a tibble with all available answered questions,
subject to other parameters. Defaults to \code{NULL}.}

\item{house}{The house to return questions from. Accepts either the short
name of the legislature (e.g. \code{'commons'} or \code{'lords'}) or the
ID of the legislature (\code{1} for the House of Commons, \code{2} for the
House of Lords). The short names are not case sensitive.
If \code{NULL}, returns answers from both houses, subject to other
parameters. Defaults to \code{NULL}.}

\item{answering_body}{The name of the government department that answers the
question, or a vector of government deparment names. Accepts either the
short name name of a department (e.g. \code{'Education'} for the Department
for Education, \code{'Digital, Culture, Media and Sport'} for the Department
for Digital, Culture, Media and Sport), or the ID of a particular department
(e.g. 60 for the Department for Education). If \code{NULL}, returns answers
from all departments, subject to other parameters. Defaults to \code{NULL}.}

\item{start_date}{The earliest date to include in the tibble. Accepts
character values in \code{'YYYY-MM-DD'} format, and objects of class
\code{Date}, \code{POSIXt}, \code{POSIXct}, \code{POSIXlt} or anything else
that can be coerced to a date with \code{as.Date()}.
Defaults to \code{'1900-01-01'}.}

\item{end_date}{The latest date to include in the tibble. Defaults to
\code{'1900-01-01'}. Accepts character values in \code{'YYYY-MM-DD'}
format, and objects of class \code{Date}, \code{POSIXt}, \code{POSIXct},
\code{POSIXlt} or anything else that can be coerced to a date with
\code{as.Date()}. Defaults to the current system date.}

\item{extra_args}{Additional parameters and queries to pass to API. These
queries must be strings and start with "&". See the
\href{http://explore.data.parliament.uk/}{API documentation}
or the package vignette for more details. Defaults to \code{NULL}.}

\item{tidy}{Logical parameter. If \code{TRUE}, fixes the variable names
in the tibble to remove special characters and superfluous text, and
converts the variable names to a consistent style. Defaults to \code{TRUE}.}

\item{tidy_style}{The style to convert variable names to, if
\code{tidy = TRUE}. Accepts any style accepted by \link[snakecase]{to_any_case}.
Defaults to \code{'snake'}.}

\item{verbose}{If \code{TRUE}, displayes messages on the console on the
progress of the API request. Defaults to \code{TRUE}.}
}
\value{
A tibble with details on all answered questions in the House
of Commons and the House of Lords.
}
\description{
Imports data on all answered parliamentary questions in the
House of Commons and/or in the House of Lords. The \code{mp_id},
\code{tabling_mp_id} and \code{answering_body} parameters accept a single
ID or department names, or a list of IDs or department names, respectively.

This is the most flexible of the various functions that look
up questions, as it queries all types of questions in both houses with a
wide selection of parameters: The member who asks the question, the member
who answers it and the relevant department can all be used to query the API.
\code{mp_id}, \code{tabling_mp_id} and \code{answering_body} all accept
lists of multiple relevant search parameters. This can be in the form of a
list, a data.frame column, a character vector, etc.
}
\examples{
\dontrun{
# All questions answered by Nicola Blackwood from 1 January 2017 onwards
x <- all_answered_questions(4019, start_date = "2017-01-01")

# All questions answered by Nicola Blackwood from 1 January 2017 onwards
# returns variables in camelCase style
y <- all_answered_questions(4019,
  start_date = "2017-01-01",
  tidy_style = "small_camel"
)

# All questions asked by Andrew Dismore from 1 January 2017 onwards
z <- hansard_all_answered_questions(
  tabling_mp_id = 179,
  start_date = "2017-01-01"
)

# Return all questions asked in the House of Lords
# answered by the Department for Education.
a <- hansard_all_answered_questions(house = "lords", answering_body = 60)

# Returns all questions asked in the House of Lords
# answered by the Department for Education.
b <- hansard_all_answered_questions(house = 2, answering_body = "Education")

# Accepts multiple inputs for mp_id, tabling_mp_id and answering_body
w <- hansard_all_answered_questions(
  mp_id = c(4019, 3980),
  tabling_mp_id = c(338, 172),
  answering_body = c("health", "justice"),
  start_date = "2016-12-18",
  end_date = "2017-03-12"
)
}

}
\seealso{
\code{\link[=commons_answered_questions]{commons_answered_questions()}}

\code{\link[=commons_oral_questions]{commons_oral_questions()}}

\code{\link[=commons_oral_question_times]{commons_oral_question_times()}}

\code{\link[=commons_written_questions]{commons_written_questions()}}

\code{\link[=lords_written_questions]{lords_written_questions()}}

\code{\link[=mp_questions]{mp_questions()}}
}
