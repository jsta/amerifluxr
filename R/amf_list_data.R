#' Get BASE data variable availability
#'
#' @description This function obtains the BASE data availability for all or
#' selected AmeriFlux sites. See AmeriFlux page
#' \url{https://ameriflux.lbl.gov/data/aboutdata/data-variables/} for details
#' about the variable naming.
#'
#' @param site_set A scalar or vector of character specifying the target
#' AmeriFlux Site ID (CC-Sss). If not specified, it returns all sites.
#' @param var_set A scalar or vector of character specifying the target
#' variables as in basename. See AmeriFlux
#' page\url{https://ameriflux.lbl.gov/data/aboutdata/data-variables/#base}
#' for a list of variable names. If not specified, it returns all variables.
#'
#' @return A data frame of variable-specific data availability (per year)
#'  for selected AmeriFlux sites.
#' \itemize{
#'   \item Site_ID - Six character site identifier (CC-Sss)
#'   \item VARIABLE - Variable name of the data included in the BASE file
#'   \item BASENAME - Variable base name of the data included in the BASE file.
#'   \item GAP_FILLED - Whether a variable is a gap-filled variable (TRUE/FALSE)
#'   \item Y1990 - Percentage of data availability in the year 1990 (0-1).
#'   \item Y1991 - Percentage of data availability in the year 1991 (0-1).
#'   \item Y1992 - Percentage of data availability in the year 1992 (0-1).
#'   \item ...
#'   }
#' @export
#'
#' @examples
#' \dontrun{
#' # obtain the data variable availability for all sites
#' data_aval <- amf_list_data()
#'
#' # obtain the data variable availability for selected sites
#' data_aval <- amf_list_data(site_set = c("US-CRT","US-WPT"))
#'
#' # obtain the data variable availability for selected variables
#' data_aval <- amf_list_data(var_set = c("FCH4", "WTD"))
#'
#' }

amf_list_data <- function(site_set = NULL,
                          var_set = NULL) {
  # check if the file exists
  if (httr::HEAD(amf_server("data_variable"))$status_code == 200) {
    # get latest data variable availability
    data_aval <- utils::read.csv(
      amf_server("data_variable"),
      header = TRUE,
      skip = 1,
      stringsAsFactors = FALSE
    )

    # subset interested sites
    all_site <- amerifluxr::amf_sites()[, "SITE_ID"]
    if (is.null(site_set)) {
      site_set <- all_site
    } else {
      check_id <- amf_check_site_id(site_set)
      # check if any or all site_set not valid site ID
      if (any(!check_id) & !all(!check_id)) {
        warning(paste(
          paste(site_set[which(!check_id)], collapse = ", "),
          "not valid AmeriFlux Site ID"
        ))
        site_set <- site_set[which(check_id)]

      } else if (all(!check_id)) {
        stop("Download failed, no valid Site ID in site_set")

      }
    }

    # Check var_set through amf_variables()
    FP_var <- amerifluxr::amf_variables()[, "Name"]
    if (is.null(var_set)) {
      var_set <- FP_var
    } else{
      # check if var_set are valid variable names
      check_var <- var_set %in% FP_var
      if (all(!check_var)) {
        stop("No valid variable in var_set...")
      } else if (any(!check_var) & !all(!check_var)) {
        warning(paste(paste(var_set[which(!check_var)], collapse = ", "),
                      "not valid variable names"))
        var_set <- var_set[which(check_var)]
      }
    }

    data_aval <- data_aval[data_aval$SITE_ID %in% site_set, ]
    data_aval <- data_aval[data_aval$BASENAME %in% var_set, ]

  } else{
    stop("Download failed, timeout or server error...")

    data_aval <- NULL

  }
  return(data_aval)
}
