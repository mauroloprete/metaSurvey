#' OAuth token objects.
#'
#' These objects represent the complete set of data needed for OAuth access:
#' an app, an endpoint, cached credentials and parameters. They should be
#' created through their constructor functions [oauth1.0_token()]
#' and [oauth2.0_token()].
#'
#' @section Methods:
#' * `add()`: caches token to disk
#' * `get_name()`: returns list of url and config
#' * `print()`: refresh access token (if possible)
#'
#' @docType class
#' @keywords internal
#' @format An R6 class object.
#' @importFrom R6 R6Class
#' @export
#' @name Token-class

recipe <- R6::R6Class(
    "recipe",
    public = list(
        name = NULL,
        lastname = NULL,
        initialize = function(...) {
            Map(
                f = function(item) {
                    self$add(item)
                },
                list(...)
            )
        },
        add = function(x) {
            private$recipe <- c(private$recipe,list(x))
        },
        get_name = function() self$name,
        print = function(...) {
            cat("<PrettyCountingQueue> of ", self$get_name(), " elements\n", sep = "")
        }
    ),
    private = list(
        recipe = list(),
        length = function() {
            length(private$recipe)
        }
    )
)
