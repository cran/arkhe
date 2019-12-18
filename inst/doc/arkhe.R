## ----setup, include = FALSE, echo=FALSE----------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----uml, echo=FALSE, fig.cap="UML class diagram of the S4 classes structure.", fig.width=7----
knitr::include_graphics("classes.png")

## ----packages------------------------------------------------------------
# Load packages
library(arkhe)

## ----create--------------------------------------------------------------
set.seed(12345)
## Create a count data matrix
CountMatrix(data = sample(0:10, 100, TRUE),
            nrow = 10, ncol = 10)

## Create an incidence (presence/absence) matrix
## Numeric values are coerced to logical as by as.logical
IncidenceMatrix(data = sample(0:1, 100, TRUE),
                nrow = 10, ncol = 10)

## ----coerce--------------------------------------------------------------
## Create a count matrix
A0 <- matrix(data = sample(0:10, 100, TRUE), nrow = 10, ncol = 10)

## Coerce to absolute frequencies
A1 <- as_count(A0)

## Coerce to relative frequencies
B <- as_abundance(A1)

## Row sums are internally stored before coercing to a frequency matrix
## (use get_totals() to get these values)
## This allows to restore the source data
A2 <- as_count(B)
all(A1 == A2)

## Coerce to presence/absence
C <- as_incidence(A1)

## Coerce to a co-occurrence matrix
D <- as_occurrence(A1)

