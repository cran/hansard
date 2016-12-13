
<!-- README.md is generated from README.Rmd. Please edit that file -->
hansard: Accessing Westminster Parliament Data
==============================================

[![Build Status](https://travis-ci.org/EvanOdell/hansard.png?branch=master)](https://travis-ci.org/EvanOdell/hansard) [![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/hansard)](https://cran.r-project.org/package=hansard)

An R package to automatically fetch data from the UK Parliament API. Ironically, Hansard data is not yet accessible through the API. To explore all available data see <http://www.data.parliament.uk/>. Help on the API itself is here: <http://api.data.parliament.uk/help/>.

Like the UK parliament API, this package is a work in progress. Additional functionalities will be added to the package as they are developed in the API.

To install from CRAN (version 0.2.5) run:

    install.packages("hansard")

To install the development version (version 0.3.4) run:

    install.packages("devtools")
    devtools::install_github("EvanOdell/hansard")

Using hansard
-------------

For an introduction to hansard, the vignette `vignette("introduction", package = "hansard")` is the best place to start. If you are unfamiliar with APIs [https://zapier.com/learn/apis/](this%20introductory%20course) is a helpful introduction.
