% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/ala_config.R
\name{ala_config}
\alias{ala_config}
\title{Get or set configuration options that control galah behaviour}
\usage{
ala_config(..., profile_path = NULL)
}
\arguments{
\item{\dots}{Options can be defined using the form \code{name = value}.
Valid arguments are:
\itemize{
  \item \code{atlas} string: Living Atlas to point to, Australia by default
  \item \code{caching} logical: if TRUE, results will be cached, and any cached
    results will be re-used). If FALSE, data will be downloaded.
  \item \code{cache_directory} string: the directory to use for the cache.
    By default this is a temporary directory, which means that results will
    only be cached
    within an R session and cleared automatically when the user exits R.
    The user may wish to set this to a non-temporary directory for
    caching across sessions. The directory must exist on the file system.
  \item \code{download_reason_id} numeric or string: the "download reason" required.
  by some ALA services, either as a numeric ID (currently 0--11)
  or a string (see \code{\link{find_reasons}()} for a list of valid ID codes and
  names). By default this is NA. Some ALA services require a valid
  download_reason_id code, either specified here or directly to the
  associated R function.
  \item \code{email} string: An email address that has been registered with
    ALA at \href{https://auth.ala.org.au/userdetails/registration/createAccount}{this address}.
    A registered email is required for some functions in \code{galah}.
  \item \code{send_email} logical: should you receive an email for each query to
    \code{\link{ala_occurrences}()}? Defaults to \code{FALSE}; but can be
    useful in some instances, for example for tracking DOIs assigned to
    specific downloads for later citation.
  \item \code{verbose} logical: should \code{galah} give verbose output to assist
  debugging? Defaults to FALSE.
}}

\item{profile_path}{string: (optional), path to a directory to store
config values in. If provided, config values will be written to a new or
existing .Rprofile file for future sessions. \code{NULL} by default.}
}
\value{
For \code{ala_config()}, a \code{list} of all options.
When \code{ala_config(...)} is called with arguments, nothing is returned
but the configuration is set.
}
\description{
The \code{galah} package supports large data downloads, and also
interfaces with the ALA which requires that users of some services
provide a registered email address and reason for downloading data. The
\code{ala_config} function provides a way to manage these issues as simply
as possible.
}
\examples{
\dontrun{
 ala_config()
 ala_config(caching = FALSE)
 ala_reasons()
 ala_config(download_reason_id = 0,verbose = TRUE)
}
}
