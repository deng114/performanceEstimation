\name{taskNames}
\alias{taskNames}

\title{
The prediction tasks involved in an estimation experiment
}
\description{
This function can be used to get a vector with the IDs of the prediction
tasks that were used in a performance estimation experiment.
}
\usage{
taskNames(o)
}

\arguments{
  \item{o}{
An object of class \code{\linkS4class{ComparisonResults}}
}
}
\value{
  A vector of strings (the names of the tasks)
}
\references{ Torgo, L. (2014) \emph{An Infra-Structure for Performance
    Estimation and Experimental Comparison of Predictive Models in R}. arXiv:1412.0436 [cs.MS]
  \url{http://arxiv.org/abs/1412.0436}  
}
\author{ Luis Torgo \email{ltorgo@dcc.fc.up.pt} }
\seealso{
  \code{\linkS4class{ComparisonResults}},
  \code{\link{performanceEstimation}},
  \code{\link{metricNames}},
  \code{\link{workflowNames}}

}
\examples{
\dontrun{
## Estimating MSE for 3 variants of both
## regression trees and SVMs, on  two data sets, using one repetition
## of 10-fold CV
library(e1071)
library(DMwR)
data(swiss)
data(mtcars)

## running the estimation experiment
res <- performanceEstimation(
  c(PredTask(Infant.Mortality ~ .,swiss),PredTask(mpg ~ ., mtcars)),
  c(workflowVariants(learner="svm",
                     learner.pars=list(cost=c(1,10),gamma=c(0.01,0.5))),
    workflowVariants(learner="rpartXse",
                     learner.pars=list(se=c(0,0.5,1)))
  ),
  EstimationTask("mse")
  )

## the names of the metrics that were estimated in the above experiment
taskNames(res)
}
}
\keyword{models}

