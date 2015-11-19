library(dplyr)
library(ggplot2)
data(movies)

movies.ratings <- bind_rows(
     movies %>% select(r1) %>% distinct(),
     movies %>% select(r2) %>% distinct(),
     movies %>% select(r3) %>% distinct(),
     movies %>% select(r4) %>% distinct(),
     movies %>% select(r5) %>% distinct(),
     movies %>% select(r6) %>% distinct(),
     movies %>% select(r7) %>% distinct(),
     movies %>% select(r8) %>% distinct(),
     movies %>% select(r9) %>% distinct(),
     movies %>% select(r10) %>% distinct())

movies.ratings <- apply(as.data.frame(movies.ratings), 1, function(x){
     x[which(!is.na(x))]
})

ratings.distinct <- data.frame(movies.ratings) %>% distinct() %>% arrange(movies.ratings)

ggplot(ratings.distinct, aes(1:length(ratings.distinct[,1]),movies.ratings)) + 
     geom_point() + scale_x_discrete(factor(1:11), name="Row Number") + ylab("Distinct Rating") + 
     ggtitle("movies.ratings: Distinct Rating vs. Row Number (notice the pattern at row 6 & 7)")
