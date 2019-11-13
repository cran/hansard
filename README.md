
<!-- README.md is generated from README.Rmd. Please edit that file -->

# hansard: Accessing Westminster Parliament Data

<!-- badges: start -->

[![License:
MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/hansard)](https://cran.r-project.org/package=hansard)
[![GitHub
tag](https://img.shields.io/github/tag/evanodell/hansard.svg)](https://github.com/evanodell/hansard)
[![CRAN
Downloads](https://cranlogs.r-pkg.org/badges/grand-total/hansard)](https://cran.r-project.org/package=hansard)
[![Travis-CI Build
Status](https://travis-ci.org/evanodell/hansard.svg?branch=master)](https://travis-ci.org/evanodell/hansard)
[![AppVeyor Build
Status](https://ci.appveyor.com/api/projects/status/github/evanodell/hansard?branch=master&svg=true)](https://ci.appveyor.com/project/evanodell/hansard)
[![Coverage
Status](https://img.shields.io/codecov/c/github/evanodell/hansard/master.svg)](https://codecov.io/github/evanodell/hansard?branch=master)
[![DOI](https://zenodo.org/badge/72111315.svg)](https://zenodo.org/badge/latestdoi/72111315)
[![Travis build
status](https://travis-ci.org/evanodell/hansard.svg?branch=master)](https://travis-ci.org/evanodell/hansard)
<!-- badges: end -->

An R package to automatically fetch data from the UK Parliament API.
Ironically, Hansard data (as in speeches) is not yet accessible through
the API. To explore all available data see
<http://www.data.parliament.uk/>. Documentation for the API itself is
available [here](http://explore.data.parliament.uk/).

Like the UK parliament API, this package is a work in progress.
Additional functionalities will be added to the package as they are
developed in the API. The most up-to-date documentation for this package
will always be available at <https://docs.evanodell.com/hansard/>.

To install from CRAN run:

    install.packages("hansard")

To install the development version run:

    #install.packages("remotes")
    remotes::install_github("evanodell/hansard")

## Using hansard

For an introduction to `hansard`, please see the
[vignette](https://docs.evanodell.com/hansard/articles/introduction.html).
If you are unfamiliar with web APIs [this introductory
course](https://zapier.com/learn/apis/) is useful.

### Disclaimer

This package is in no way officially related to or endorsed by the UK
Parliamentary Data Service. It is released under an MIT license. Please
note that this project is released with a [Contributor Code of
Conduct](https://github.com/evanodell/hansard/blob/master/CODE_OF_CONDUCT.md).
By participating in this project you agree to abide by its terms.

## Citing hansard

Odell E (2017). *hansard: Provides Easy Downloading Capabilities for the
UK Parliament API*. doi:
[10.5281/zenodo.591264](https://doi.org/10.5281/zenodo.591264), R
package version 0.8.0, URL:
<https://cran.r-project.org/package=hansard>.

A BibTeX entry for LaTeX users is

``` 
  @Manual{,
    title = {{hansard}: Provides Easy Downloading Capabilities for the UK Parliament API},
    author = {Evan Odell},
    note = {R package version 0.8.0},
    doi = {10.5281/zenodo.591264},
    url = {https://cran.r-project.org/package=hansard},
  }
```
