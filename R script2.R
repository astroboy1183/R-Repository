
if(!require('pacman')) install.packages('pacman')

pacman::p_load(pacman,party,psych,rio,tidyverse)
#pacman: for loading/unloading packages
#party: for decision trees
#psych: for many statistical procedures
#rio: for importing data
#tidyverse: for so many reasons


library(datasets)

?iris
df<-iris
head(df)


hist(df$Sepal.Width,col="#CD0000",border=NA)
main = "Histogram of sepal Width"

hist(df$Petal.Width,col="#CD0000")
main1= "Histogram of sepal Width"


hist(df$Sepal.Length,col="#CD0000")
main2 = "Histogram of sepal Width"


hist(df$Petal.Length,col="#CD0000")
main3 = "Histogram of sepal Width"
df


