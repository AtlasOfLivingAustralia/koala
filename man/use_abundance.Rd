% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/use_abundance.R
\name{use_abundance}
\alias{use_abundance}
\title{Add abundance fields to a \code{tibble}}
\usage{
use_abundance(
  .df,
  individualCount = NULL,
  organismQuantity = NULL,
  organismQuantityType = NULL,
  .keep = "unused"
)
}
\arguments{
\item{.df}{a \code{data.frame} or \code{tibble} that the column should be appended to.}

\item{individualCount}{The number of individuals present}

\item{organismQuantity}{A number or enumeration value for the quantity of
organisms. Used together with \code{organismQuantityType} to provide context.}

\item{organismQuantityType}{The type of quantification system used for \code{organismQuantity}}
}
\value{
A tibble with the requested fields (see details).
}
\description{
In some field methods, it is common to observe more than one individual
per observation; to observe abundance using non-integer measures such as
mass or area; or to seek individuals but not find them (abundance of zero).
As these approaches use different DwC terms, this function assists in
specifying abundances in a flexible way.
}
\details{
Examples of \code{organismQuantity} & \code{organismQuantityType} values:
\itemize{
\item 27 (\code{organismQuantity}) individuals (\code{organismQuantityType})
\item 12.5 (\code{organismQuantity}) \% biomass (\code{organismQuantityType})
\item r (\code{organismQuantity}) Braun-Blanquet Scale (\code{organismQuantityType})
\item many (\code{organismQuantity}) individuals (\code{organismQuantityType})
}
}
\examples{
df <- tibble::tibble(
  species_name = c("Pseudophryne corroboree",
                   "Pseudophryne corroboree",
                   "Pseudophryne corroboree"),
  n_obs = c(1, 3, 4)
  )

df |>
  use_abundance(individualCount = n_obs)

}
