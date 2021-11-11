# amerifluxr

[![R-CMD-check](https://github.com/chuhousen/amerifluxr/workflows/R-CMD-check/badge.svg)](https://github.com/chuhousen/amerifluxr/actions)
[![codecov](https://codecov.io/gh/chuhousen/amerifluxr/branch/master/graph/badge.svg)](https://codecov.io/gh/chuhousen/amerifluxr)

An R programmatic interface for querying, downloading, and handling [AmeriFlux](https://ameriflux.lbl.gov/) data and metadata.  

## Insallation

### Stable release

Coming up soon!!

### Development release

To install the development releases of the package run the following
commands:

``` r
if(!require(devtools)){install.packages("devtools")}
devtools::install_github("chuhousen/amerifluxr")
library("amerifluxr")
```

Vignettes are not rendered by default, if you want to include additional
documentation please use:

``` r
if(!require(devtools)){install.packages("devtools")}
devtools::install_github("chuhousen/amerifluxr", build_vignettes = TRUE)
library("amerifluxr")
```
## Use

### Download all-site metadata

To download all AmeriFlux sites' metadata (i.e., BADM data product)
in a single file, use the following. Note: Access to AmeriFlux data requires
creating an AmeriFlux account first.
Register an account through the [link](https://ameriflux-data.lbl.gov/Pages/RequestAccount.aspx).
For details about BADM data files, see AmeriFlux [web page](https://ameriflux.lbl.gov/data/aboutdata/badm-data-product/).

``` r
amf_download_bif(user_id = "my_user",
                 user_email = "my_email@mail.com",
                 data_policy = "CCBY4.0",
                 intended_use = "synthesis",
                 intended_use_text = "test how global change affected GPP globally",
                 out_dir = tempdir(),
                 verbose = TRUE,
                 site_w_data = TRUE)
```

| Parameter          | Description                                                                                                                     |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| user_id            | AmeriFlux account username                                                                                                      |
| user_email         | AmeriFlux account user email                                                                                                    |
| data_policy        | "CCBY4.0" or "LEGACY". AmeriFlux data are shared under two tiers of licenses as chosen by site's PI.                            |
| intended_use       | The intended use category. It needs to be "synthesis", "model", "remote_sensing","other_research", "education", or "other"      |
| intended_use_text  | Brief description of intended use.This will be recorded in the data download log and emailed to site's PI.                      |
| out_dir            | Output directory for downloaded data, default to tempdir()                                                                      |
| verbose            | Show feedback on download progress                                                                                              |
| site_w_data        | Logical, download all registered sites (FALSE) or only sites with available BASE data (TRUE)                                    |


### Download single-site flux/met data

The following downloads AmeriFlux flux/met data (aka BASE data product)
from a single site. 
For details about BASE and BADM data files, see AmeriFlux [BASE data](https://ameriflux.lbl.gov/data/data-processing-pipelines/base-publish/)
and [BADM data](https://ameriflux.lbl.gov/data/aboutdata/badm-data-product/) pages.

``` r
amf_download_base(user_id = "my_user",
                  user_email = "my_email@mail.com",
                  site_id = "US-CRT",
                  data_product = "BASE-BADM",
                  data_policy = "CCBY4.0",
                  intended_use = "remote_sensing",
                  intended_use_text = "validate the model of GPP estimation",
                  verbose = TRUE,
                  out_dir = tempdir())

```

| Parameter          | Description                                                                                                                     |
| ------------------ | ------------------------------------------------------------------------------------------------------------------------------- |
| user_id            | AmeriFlux account username                                                                                                      |
| user_email         | AmeriFlux account user email                                                                                                    |
| site_id            | A scalar or vector of character specifying the AmeriFlux Site ID (CC-Sss)                                                       |
| data_product       | AmeriFlux data product. Currently, only "BASE-BADM" is currently supported and used as default.                                 |
| data_policy        | "CCBY4.0" or "LEGACY". AmeriFlux data are shared under two tiers of licenses as chosen by site's PI.                            |
| intended_use       | The intended use category. It needs to be "synthesis", "model", "remote_sensing","other_research", "education", or "other"      |
| intended_use_text  | Brief description of intended use.This will be recorded in the data download log and emailed to site's PI.                      |
| out_dir            | Output directory for downloaded data, default to tempdir()                                                                      |
| verbose            | Show feedback on download progress                                                                                              |

### Download multiple-site flux/met data

The following downloads AmeriFlux flux/met data from multiple sites. 

``` r
amf_download_base(user_id = "my_user",
                  user_email = "my_email@mail.com",
                  site_id = c("US-CRT", "US-WPT", "US-Oho"),
                  data_product = "BASE-BADM",
                  data_policy = "CCBY4.0",
                  intended_use = "model",
                  intended_use_text = "Data-driven modelling, data will be used for training models and cross-validation exercises",
                  verbose = TRUE,
                  out_dir = tempdir())

```
### Additional functionalities

Site selection: See [Site Selection Vignette](docs/articles/site_selection.html) for examples 
querying a list of target sites based on sites' general information and availability of metadata and data. 

Data import: See [Data Import Vignette](docs/articles/data_import.html) for examples 
importing data and metadata downloaded from AmeriFlux, and parsing and cleaning data for further use. 



## Citation

Coming up soon.

## Acknowledgements
We thank the AmeriFlux site teams for sharing their data and 
metadata with the network. Funding for these flux sites is 
acknowledged in the site data DOI on [AmeriFlux website](https://ameriflux.lbl.gov/).
This package was supported in part by funding provided to the
AmeriFlux Management Project by the U.S. Department of Energy’s
Office of Science under Contract No. DE-AC0205CH11231.
