\name{synapseQuery}
\alias{synapseQuery}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
TODO write documentation
}
\description{
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
synapseQuery(queryStatement, curlHandle = getCurlHandle(), anonymous = .getCache("anonymous"))
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{queryStatement}{
%%     ~~Describe \code{queryStatement} here~~
}
  \item{curlHandle}{
%%     ~~Describe \code{curlHandle} here~~
}
  \item{anonymous}{
%%     ~~Describe \code{anonymous} here~~
}
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
%%  ~Describe the value returned
%%  If it is a LIST, use
%%  \item{comp1 }{Description of 'comp1'}
%%  \item{comp2 }{Description of 'comp2'}
%% ...
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
##---- Should be DIRECTLY executable !! ----
##-- ==>  Define data, use random,
##--	or do  help(data=index)  for the standard data sets.

## The function is currently defined as
function (queryStatement, curlHandle = getCurlHandle(), anonymous = .getCache("anonymous")) 
{
    kPath <- "/query?query="
    if (!is.character(queryStatement)) {
        stop("a query statement must be supplied of R type character")
    }
    uri <- paste(kPath, curlEscape(queryStatement), sep = "")
    result <- synapseGet(uri = uri, curlHandle = curlHandle, 
        anonymous = anonymous)
    if (result$totalNumberOfResults == 0) {
        return(NULL)
    }
    return.val <- .jsonListToDataFrame(result$results)
    attr(return.val, "totalNumberOfResults") <- result$totalNumberOfResults
    return(return.val)
  }
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{ ~kwd1 }
\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line