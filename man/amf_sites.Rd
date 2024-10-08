% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/helper_functions.R
\name{amf_sites}
\alias{amf_sites}
\title{Lists AmeriFlux sites}
\usage{
amf_sites()
}
\value{
A data frame containing the following columns.
See AmeriFlux BADM standard \url{https://ameriflux.lbl.gov/data/badm/}
for detailed explanation.
\itemize{
  \item SITE_ID - Six character site identifier (CC-Sss)
  \item SITE_NAME - Site name (free text)
  \item COUNTRY - Country (free text)
  \item STATE - State (free text)
  \item IGBP - Vegetation type based on the IGBP definition (character)
  \item URL_AMERIFLUX - Site web site URL, maintained by AmeriFlux (URL)
  \item TOWER_BEGAN - The starting year of flux measurement (YYYY)
  \item TOWER_END - The ending year of flux measurement (YYYY), NA if still
   active or unspecified
  \item LOCATION_LAT - Latitude of the site (decimal deg ref WGS84)
  \item LOCATION_LONG - Longitude of the site (decimal deg ref WGS84)
  \item LOCATION_ELEV - Elevation of the site above sea level (m)
  \item CLIMATE_KOEPPEN - Koppen climate classification (character)
  \item MAT - Long-term mean annual average air temperature (degree C)
  \item MAP - Long-term mean annual average precipitation (mm)
  \item DATA_POLICY - LEGACY / CCBY4.0 (character)
}
}
\description{
Lists available site (names) and basic meta-data
}
\examples{
\dontrun{
# download a list of sites and basic info
sites <- amf_sites()

}

}
