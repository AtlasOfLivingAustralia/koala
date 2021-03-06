% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/find_field_values.R
\name{find_field_values}
\alias{find_field_values}
\title{List valid options for a categorical field}
\usage{
find_field_values(field, limit = 20)
}
\arguments{
\item{field}{\code{string}: field to return the categories for. Use
\code{\link{search_fields}} to view valid fields.}

\item{limit}{\code{numeric}: maximum number of categories to return. 20 by default.}
}
\value{
A \code{data.frame} containing columns \code{field} (user-supplied)
and \code{category} (i.e. field values).
}
\description{
When building a set of filters with \code{\link{select_filters}}, a user can
use this function to check that the values provided are valid options.
}
\examples{
\dontrun{
find_field_values("basisOfRecord")
find_field_values("stateProvince")
}
}
\seealso{
See \code{\link{search_fields}} for ways to use information returned
by this function.
}
