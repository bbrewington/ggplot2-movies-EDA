library(dplyr)
library(ggplot2)
library(profvis)
data(movies)

get.decade. <- function(x){
     if(!is.numeric(x) | nchar(x)!=4){
          stop("input to function get.decade must be year format: numeric & length 4")
     }
     paste("1",substr(x,2,2),substr(x,3,3),"0's",sep="")
}

movies.extracol <- movies %>% mutate(decade = sapply(year, get.decade))
