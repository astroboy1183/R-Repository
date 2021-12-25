
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

iris

library(help=datasets)

?UCBAdmissions
UCBAdmissions
summary(UCBAdmissions)

?Titanic
Titanic
summary(Titanic)

?swiss #info about the inbuilt dataset
swiss
summary(swiss)

df<-read.csv('StateData.csv') #read csv file
df

(df <- import('StateData.xlsx') %>% as_tibble()) #read other formats using rio package.


x=c(1,5,7,8,3,4,6)
barplot(x)#creating a barplot

?colors #information about colors
colors() #names of colours

browseURL('https://datalab.cc/rcolors') #goes to the particular URL

barplot(x,col='red3')
barplot(x,col='slategray3')

barplot(x,col=rgb(0.80,0,0)) #red3
barplot(x,col=rgb(.62,.71,.80)) #slategray3

barplot(x,col=rgb(205,0,0,max=255)) #red3
barplot(x,col=rgb(159,182,205,max=255))#slategray3

barplot(x,col="#CD0000") #red3
barplot(x,col="#9FB6CD")#slategray3

#using index numbers
barplot(x,col=colors()[555]) #red3
barplot(x,col=colors()[602])#slategray3

colors()


barplot(x,col=c('red3','slategray3')) #red3

?palette
palette()        

barplot(x,col=1:6)
barplot(x,col = rainbow(6))
barplot(x,col = heat.colors(6)) #for showing values in particular order.
barplot(x,col = terrain.colors(6))
barplot(x,col = topo.colors(6))
barplot(x,col = cm.colors(6))

?diamonds
diamonds  #diamonds dataset

?plot
?barplot

plot(diamonds$cut) #simplest bar plot

#same plot using pipes
diamonds %>%
 select(cut)%>%
 plot()  

diamonds %>%
  select(clarity)%>%
  plot()  


diamonds %>%
  select(clarity)%>%
  barplot() #error: height must be a vector or a matrix  

diamonds %>%
  select(clarity)%>%
  table()%>% #put data in appropriate table form
  barplot()  

diamonds

diamonds %>%
  select(clarity,cut)%>%
  plot()  


#stacked bars:
df<-diamonds %>%
  select(color,clarity)%>%
  table()%>%
  print()

df%>%
  barplot(legend=rownames(.),beside = T) #stack plots beside each other


df%>%
  barplot(legend=rownames(.)) #plot with legend



#histograms

hist(diamonds$price)#default histogram

hist(
diamonds$price,breaks=7,col=colors()[566],xlab = 'price of diamonds',ylab='Frequency')



#box plots

?boxplot

#Default
boxplot(diamonds$price)

#with parameters
boxplot(diamonds$price,horizontal = TRUE,col=colors()[333],notch=TRUE
        ,xlab="frequency")


diamonds%>%
  select(color,price)%>%
  plot()


diamonds%>%
  select(color,price)%>%
  boxplot(price~color,data=.
  ,col=colors()[370])



#scatterplots

install.packages("readxl")
