## The first function creates a special list. This list contents a matrix and
## the inverse of the matrix (optional)
## The second function store the resolve of the inverse of the matrix 

## Create a list for store a matrix and the inverse of the matrix (optional)

makeCacheMatrix <- function(x = matrix()) {
  inMa <- NULL 
  set <- function(y){
    x <<- y
    inverseMatrix <<- NULL 
  }
  get <- function() x
  setInverseMatrix <- function(inverseMatrix) inMa <<- inverseMatrix
  getInverseMatrix <- function() inMa
  list(set = set, get = get,
       setInverseMatrix = setInverseMatrix,
       getInverseMatrix = getInverseMatrix)
}


## Store the resolve of the inverse of a matrix 

cacheSolve <- function(x, ...) {
  inMa <- x$getInverseMatrix()
  if(!is.null(inMa)){
    message("getting cached data")
    return(inMa)
  }
  matrix <- x$get()
  inMa <- solve(matrix)
  x$setInverseMatrix(inMa)
  inMa
}
