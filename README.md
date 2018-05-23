---
output: github_document
---

<!-- README.md is generated from README.Rmd. Please edit that file -->

```{r, echo = FALSE}
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.path = "README-"
)
```

# R-SPPFP
[![CRAN_Status_Badge](http://www.r-pkg.org/badges/version/rsppfp)](https://cran.r-project.org/package=rsppfp)
[![Travis-CI Build Status](https://travis-ci.org/melvidoni/rsppfp.svg?branch=master)](https://travis-ci.org/melvidoni/rsppfp)
[![AppVeyor Build Status](https://ci.appveyor.com/api/projects/status/github/melvidoni/rsppfp?branch=master&svg=true)](https://ci.appveyor.com/project/melvidoni/rsppfp)
[![Coverage Status](https://img.shields.io/codecov/c/github/melvidoni/rsppfp/master.svg)](https://codecov.io/github/melvidoni/rsppfp?branch=master)

The **R-SPPFP** package implements different algorithms for transforming graphs in the _Shortest Path Problem with Forbidden Paths_ (SPPFP). This problem is an important concept in the field of graph theories, and it is a variant of the traditional _shortest path problem_. In here, there is an additional constrait that takes the form of a finite set of forbidden paths (arc sequences of at least three nodes) that cannot be part of any solution path. 

This problem is solved by transforming the original graph `G` and its set of forbidden paths `F`, generating a new graph `G*` in which traditional _shortest path_ algorithms can be applied, and obtain solutions that abide to the restrictions. This approach has a number of advantages:

- It allows solving the original _shortest path problem_ in `G*` with algorithms that efficiently manage time and processing resources constraints, having been implemented in a plethora of languages.
- The resulting `G*` is highly compatible with existing libraries, and can be used as input data for other, more complex problems and researches.
- In many cases -i.e. logistics- `G` and `F` remain unchanged for long periods of time. Thus, the transformation is completed only once, and `G*` can be stored along with the original graph. A new conversion is required only on the rare cases where the graph, or its forbidden paths, are modified.
- The input data is provided as common data frames, increasing the versatility of this package.



## Algorithms
R-SPPFP implements two different algorithms, each one suited for different situations:

1. Villeneuve and Desaulniers (2005) proposed the first algorithm. In this case, the set `F` must be known beforehand. This transformation is slightly fast, but generates bigger graphs `G*`. Each forbidden path can be of different size, but no sub-path (of at least three nodes long) can be part of another forbidden path.
1. Hsu et al. 'Backward Construction' (2009) solves the restriction of sub-paths in the forbidden paths, and generates smaller graphs `G*`, by adding less new nodes and arcs. However, this algorithm is slightly slower.

Both algorithms are analyzed using 27 graphs, randomly generated. The complete benchmark evaluation [can be found here](articles/benchmark.html).



## Installation

You can install the development version of R-SPPFP from GitHub with:

```{r gh-installation, eval = FALSE}
# install.packages("devtools")
devtools::install_github("melvidoni/rsppfp")
```




## References
Available at [References](articles/references.html)