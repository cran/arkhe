% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/AllGenerics.R, R/remove.R
\docType{methods}
\name{remove_empty}
\alias{remove_empty}
\alias{remove_empty-method}
\alias{remove_empty,ANY-method}
\title{Remove Rows/Columns with Empty String}
\usage{
remove_empty(x, ...)

\S4method{remove_empty}{ANY}(x, margin = 1, all = FALSE, verbose = getOption("arkhe.verbose"))
}
\arguments{
\item{x}{An \R object (should be a \code{\link{matrix}} or a \code{\link{data.frame}}).}

\item{...}{Currently not used.}

\item{margin}{A length-one \code{\link{numeric}} vector giving the subscripts which the
function will be applied over (\code{1} indicates rows, \code{2} indicates columns).}

\item{all}{A \code{\link{logical}} scalar. If \code{TRUE}, only the rows/columns whose
values all meet the condition defined by \code{f} are considered. If \code{FALSE}
(the default), only rows/columns where at least one value validates the
condition defined by \code{f} are considered.}

\item{verbose}{A \code{\link{logical}} scalar: should \R report extra information
on progress?}
}
\description{
Removes rows/columns that contain empty strings.
}
\examples{
## Create a data matrix
X <- matrix(sample(LETTERS, 25, TRUE), nrow = 5, ncol = 5)

## Add empty string
k <- sample(1:25, 3, FALSE)
X[k] <- ""
X

## Remove rows with empty strings
remove_empty(X, margin = 1)

## Replace empty strings
replace_empty(X, value = "XXX")
}
\seealso{
Other data cleaning tools: 
\code{\link{clean_whitespace}()},
\code{\link{remove_Inf}()},
\code{\link{remove_NA}()},
\code{\link{remove_constant}()},
\code{\link{remove_zero}()},
\code{\link{replace_Inf}()},
\code{\link{replace_NA}()},
\code{\link{replace_empty}()},
\code{\link{replace_zero}()}
}
\author{
N. Frerebeau
}
\concept{data cleaning tools}
