complete <- function(directory, id = 1:332) {
  
  ## Part 2
  ## Author: Javier Samir Rey
  ## Create Date: 09/12/2014
  
  ## 'directory' is a character vector of length 1 indicating
  ## the location of the CSV files

  ## 'id' is an integer vector indicating the monitor ID numbers
  ## to be used
        
  ## Return a data frame of the form:
  ## id nobs
  ## 1  117
  ## 2  1041
  ## ...
  ## where 'id' is the monitor ID number and 'nobs' is the
  ## number of complete cases
  
  ## List files from directory 
  files = dir(directory)
  
  observations <- data.frame(id = numeric(), nobs = numeric())

  for(i in id) {
	dataFiles = lapply(file.path(directory,files[i]),read.csv)
	dataFrame = do.call(rbind.data.frame,dataFiles)
	observations <- rbind(observations, data.frame(id = i, nobs = sum(complete.cases(dataFrame))))
  } 
  observations
}