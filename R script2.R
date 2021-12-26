
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

df %>%
  barplot(legend=rownames(.),beside = T) #stack plots beside each other


df %>%
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

install.packages("readxl") #installing readxl package to read excel data

library("readxl")
df<-read_excel('StateData.xlsx')
df

df %>%
  select(instagram:modernDance)%>%
  plot() #plot all associations

df


df %>% #bivariate scatterplot
  select(extraversion:modernDance)%>%
  plot()

df %>% #bivariate scatterplot
  select(scrapbook:modernDance)%>%
  plot()

df %>% #bivariate scatterplot
  select(instagram,modernDance)%>%
  plot()


#bivariate scatterplot with options

df %>% 
  select(scrapbook:modernDance)%>%
  plot(col=colors()[100],pch=20,ylab='moderndance',xlab='scrapbook',main='Google searches')

#df %>% 
  #lm(modernDance~scrapbook,data=.)%>%
  #plot()

df %>% 
  lm(modernDance~scrapbook,data=.)%>%
  abline()

#identify outlier

df%>%
  select(state_code,scrapbook)%>%
  filter(scrapbook>4)

#draw plot without outlier
df %>% 
  select(scrapbook:modernDance)%>%
  filter(scrapbook<4)%>%
  plot(col=colors()[100],pch=20,ylab='moderndance',xlab='scrapbook',main='Google searches')

#draw new regression line
df%>%
  filter(scrapbook<4)%>%
  lm(scrapbook~modernDance,data=.)%>%
  abline()



#line charts

?uspop
uspop

plot(uspop)

plot(uspop,main = 'US population 1790-1970',xlab='Time',
     ylab='US Population(in millions)')
abline(v=1930,col='red')
abline(v=1940,col='red')
text(1930,10,"1930",col='black')
text(1940,10,"1940",col='black')

#multiple time series
?ts.plot()
ts.plot(uspop)

#powerful alternative
plot.ts(uspop)

#stock market dataset
EuStockMarkets

plot(EuStockMarkets) #stacked plots
plot.ts(EuStockMarkets) #same as previous plot
ts.plot(EuStockMarkets)#in one plot.



#cluster plots
df<-read_excel('StateData.xlsx')
df

df%>%
  select(state_code,psychRegions,instagram:modernDance)%>%
  mutate(psychRegions = as.factor(psychRegions))%>%
  rename(y=psychRegions)%>%
  print()


hc<-df %>% #get data
  dist %>% #compute distance matrix
  hclust #compute clusters

hc %>% plot(labels = df$state_code)

hc%>% rect.hclust(k=2) #draw rectangular boxes
hc%>% rect.hclust(k=4)


df%>%
  select(state_code,psychRegions,instagram:modernDance)%>%
  mutate(psychRegions = as.factor(psychRegions))%>%
  rename(y=psychRegions)%>%
  print()


df%>%
  filter(entrepreneur>1)%>%
  print()

df%>%
  filter(region=='West')%>%
  print()

df%>%
  filter(psychRegions=='Relaxed and Creative')%>%
  print()



#mutate-part of dplyr package

df%>%
  select(state_code,psychRegions,instagram:modernDance)%>%
  mutate(psychRegions = as.factor(psychRegions))%>% #converts column from numeric to factor
  rename(y=psychRegions)%>%
  print()

df %>%
  mutate(relaxed = recode(psychRegions,'Relaxed and Creative' = 'yes','Friendly and Conventional'='no',.default='no'))%>%
  select(state_code,psychRegions,relaxed)


df2<-df%>% #creating a new column
  mutate(likeArts=case_when(museum>1|modernDance>1|scrapbook>1 ~'yes',TRUE~'no'))

df2%>%
  select(state_code , likeArts,museum:modernDance)%>%
  arrange(desc(likeArts))%>%
  print(n=Inf)



df%>%
  select(state_code,psychRegions,instagram:modernDance)%>%
  mutate(psychRegions = as.factor(psychRegions))%>%
  rename(y=psychRegions)%>%
  print()

df%>%
  mutate(socialMedia=(instagram + facebook + retweet)/3, artscrafts = 
           (museum+scrapbook+modernDance)/3)%>%
  select(state_code,socialMedia,artscrafts)

#lookup package-scale, package-psych packages in R.



df%>%
  select(state_code,psychRegions,instagram:modernDance)%>%
  mutate(psychRegions = as.factor(psychRegions))%>%
  rename(y=psychRegions)%>%
  print()

summary(df)

df%>%
  select(psychRegions)%>%
  summary()


df%>%
  select(psychRegions)%>%
  table()



df%>%
  mutate(region=as.factor(region))%>%
  mutate(psychregions = as.factor(psychRegions))%>%
  print()




df%>%
  select(state_code,psychRegions,instagram:modernDance)%>%
  mutate(psychRegions = as.factor(psychRegions))%>%
  rename(y=psychRegions)%>%
  print()

df%>%summary() #Summary of the table

df%>%
  select(entrepreneur)%>%
  summary()

#five number summary-minimum,lower-hinge,median,upper-hinge,maximum,
fivenum(df$entrepreneur)

boxplot(df$entrepreneur,notch=T,horizontal=T)
boxplot.stats(df$entrepreneur)



p_load(psych)
p_help(psych,web=F)

describe(df)
describe(df$privacy)



df<-read_excel('StateData.xlsx')
df<-df%>%
  select(instagram:modernDance)

df%>%
  cor()%>%
  round(2)

cor.test(df$instagram,df$facebook)  

df<-read_excel('StateData.xlsx')

df%>%
  select(museum,volunteering)%>%
  plot()
  
lm(df$museum~df$volunteering)%>%
  abline()

fit1<-lm(df$volunteering~df$museum)
fit1

summary(fit1)
confint(fit1)
predict(fit1)

#regression diagnostics
lm.influence(fit1)
influence.measures(fit1)


#multiple regression
df<-df%>%
  select(volunteering,everything())%>%
  print()

lm(df)

m<-lm(formula = volunteering~instagram+facebook+retweet,data=df)
m
