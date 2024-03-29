% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/palettes.R
\name{palette_size}
\alias{palette_size}
\title{Symbol Size Mapping}
\usage{
palette_size(x, palette = NULL, domain = NULL, ...)
}
\arguments{
\item{x}{A vector of categorical values.}

\item{palette}{A \code{\link{numeric}} range.}

\item{domain}{A vector of categorical data.}

\item{...}{Currently not used.}
}
\value{
A \code{\link{numeric}} vector giving the amount by which plotting text and symbols
should be magnified relative to the default (see \code{\link[graphics:par]{par("cex")}}).
}
\description{
Symbol Size Mapping
}
\seealso{
Other palettes: 
\code{\link{palette_color}},
\code{\link{palette_shape}()}
}
\concept{palettes}
