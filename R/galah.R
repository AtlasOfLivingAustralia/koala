#' \pkg{galah}
#'
#' \code{galah} is an R interface to the Atlas of
#' Living Australia (ALA; \url{https://www.ala.org.au/}), 
#' a biodiversity data repository focussed
#' primarily on observations of individual life forms. 
#' It also supports access to some other 'living atlases' that use the same 
#' computational infrastructure. The
#' basic unit of data at ALA is an \strong{occurrence} record, based on the
#' 'Darwin Core' data standard (\url{https://dwc.tdwg.org}). \code{galah} enables users to
#' locate and download species observations, taxonomic information, or
#' associated media such images or sounds, and to restrict their queries to
#' particular taxa or locations. Users can specify which columns are returned
#' by a query, or restrict their results to observations that meet particular
#' quality-control criteria. 
#'
#' @name galah
#' @docType package
#' @references For more information on the ALA API, visit \url{https://api.ala.org.au/}.
#' If you have any questions, comments or suggestions, please email
#' \href{mailto:support@ala.org.au}{support@ala.org.au}.
#' @import assertthat sp sf httr
#' @importFrom crul HttpClient Paginator Async url_build url_parse
#' @importFrom digest digest
#' @importFrom jsonlite fromJSON
#' @importFrom stringr regex str_c str_detect str_extract str_locate
#' str_match str_match_all
#' @importFrom stringr str_replace str_replace_all str_split str_trim str_match
#' @importFrom utils data packageVersion read.csv write.csv read.table str
#' unzip URLencode download.file setTxtProgressBar txtProgressBar tail
#' @importFrom wellknown lint
#'
#' @section Functions:
#' \strong{\code{Data}}
#' \itemize{
#'   \item\code{\link{ala_counts}} Count the number of records or species returned by a query
#'   \item\code{\link{ala_species}} Download species lists
#'   \item\code{\link{ala_occurrences}} Download occurrence records
#'   \item\code{\link{ala_media}} Download images and sounds
#' }
#' \strong{\code{Filter}}
#' \itemize{
#'   \item\code{\link{select_taxa}} Search for taxonomic information
#'   \item\code{\link{select_filters}} Filter records
#'   \item\code{\link{select_locations}} Specify a location
#'   \item\code{\link{select_columns}} Columns to return in an occurrence download
#' }
#' \strong{\code{Lookup}}
#' \itemize{
#'   \item\code{\link{search_fields}} Free-text search for layers and fields
#'   \item\code{\link{find_field_values}} List possible values for a given field
#'   \item\code{\link{find_profiles}} List data quality profiles
#'   \item\code{\link{find_profile_attributes}} List filters included in a data quality profile
#'   \item\code{\link{find_reasons}} List valid download reasons
#'   \item\code{\link{find_atlases}} List supported international atlases
#' }
#' \strong{\code{Help}}
#' \itemize{
#'   \item\code{\link{ala_config}} Package configuration options
#'   \item\code{\link{ala_citation}} Citation for a dataset
#' }
#'
#' @section Terminology:
#'
#' To get the most value from \code{galah}, it is helpful to understand some
#' terminology used by the ALA. Each occurrence record contains taxonomic
#' information, and usually some information about the observation itself, such
#' as its location. In addition to this record-specific information, ALA
#' appends contextual information to each record, particularly data from spatial
#' \strong{layers} reflecting climate gradients or political boundaries. ALA
#' also runs a number of quality checks against each record, resulting in
#' \strong{assertions} attached to the record. Each piece of information
#' associated with a given occurrence record is stored in a \strong{field},
#' which corresponds to a \strong{column} when imported to an
#' \code{R data.frame}. See \code{\link{search_fields}} to view valid fields,
#' layers and assertions.
#'
#' Data fields are important because they provide a means to \strong{filter}
#' occurrence records;  i.e. to return only the information that you need, and
#' no more. Consequently, much of the architecture of \code{galah} has been
#' designed to make filtering as simple as possible, by using functions with the
#' \code{select_} prefix. Each \code{select} function allows the user to filter
#' in a different way, and again the function suffix contains this information.
#' For example, you can choose which taxonomic groups are included using
#' \code{\link{select_taxa}()}, or a specific location using
#' \code{\link{select_locations}()}. By combining different filter functions, it
#' is possible to build complex queries to return only the most valuable
#' information for a given problem.
#'
#' A notable extention of the filtering approach is to remove records with low
#' 'quality'. ALA performs quality control checks on all records that it stores.
#' These checks are used to generate new fields, that can then be used to filter
#' out records that are unsuitable for particular applications. However, there
#' are many possible data quality checks, and it is not always clear which are
#' most appropriate in a given instance. Therefore, \code{galah} supports ALA
#' data quality \strong{profiles}, which can be passed to
#' \code{\link{select_filters}()} to quickly remove undesirable records. A full
#' list of data quality profiles is returned by \code{\link{find_profiles}()}.
#'
#' For those outside Australia, 'galah' is the common name of
#' \emph{Eolophus roseicapilla}, a widely-distributed
#' Australian bird species.
#'
#' @section Package design:
#'
#' In most cases, users will be primarily interested in using \code{galah} to
#' return data from one of the living atlases. These functions are named with 
#' the prefix \code{ala_},
#' followed by a suffix describing the information that they provide. For
#' example, we anticipate that users will wish to download occurrence data,
#' which can be achieved using the function \code{\link{ala_occurrences}()}.
#' However, it is also possible to download data on species via
#' \code{\link{ala_species}()}, or media content (largely images) via
#' \code{\link{ala_media}()}. Alternatively, users can assess how many records
#' meet their particular criteria using \code{\link{ala_counts}()}. All 
#' functions return a \code{data.frame} as their standard format.
#'
#' Functions in \code{galah} are designed
#' according to a nested architecture. Users that require data should begin by
#' locating the relevant \code{ala_} function; the arguments within that
#' function then call correspondingly-named \code{select_} functions; and
#' finally the specific values that can be interpreted by those \code{select_}
#' functions are given by functions with the prefix \code{search_} or
#' \code{find_}. So, to limit occurrence downloads to a specific taxonomic
#' group, for example, you pass the reult of \code{\link{select_taxa}} to the
#' \code{taxa} argument of \code{\link{ala_occurrences}}.
#'

NULL
