a<-b<-c<-22
d<-33
44->t
print(d)
print(t)

x<-c(1,2,3,4,5)#c:combine/concatenate

0:10
10:0
seq(10)
seq(30,0,by=-3)
sqrt(65)
log(100) #log base e
log10(100)

c1<-"This is a string"
typeof(c1)

l1<-TRUE
typeof(l1)

l2<-F
typeof(l2)

v<-c(1,2,3,4,5)#vector
v
v2<-c("r","a","d")
v2
is.vector(v2)
v3<-c(TRUE,FALSE,TRUE)
is.vector((v3))


m1<-matrix(c(T,T,F,F,T,F,T,F),nrow=2)
m1
m2<-matrix(c(T,T,F,F,T,F,T,F),nrow=4)
m2
m3<-matrix(c(T,T,F,F,T,F,T,F),nrow=8)
m3

a1<-array(c(1:12),c(4,2)) #give data, then dimensions (rows,columns,tables)
a1          

a2<-array(c(1,12,2,4,5,33,44,5,7),c(3,3))
a2



#DataFrame


vNumeric<-c(1,2,3)
vCharacter<-c("a","b","c")
vLogical<- c(T,F,T)

df1<-cbind(vNumeric,vCharacter,vLogical)
df2<-as.data.frame(cbind(vNumeric,vCharacter,vLogical))

df1

df2  #makes the dataframe columns in different datatypes

l1<-c(1,2,3)
l2<-c("a","b","c")
l3<- c(T,F,T)

l4 = list(l1)
l5 = list(l2)
l6 = list(l3)

l4
l5
l6

num<-5
typeof(num)
as.integer(num)

mat = matrix(1:9,nrow=3)
mat

df<-as.data.frame(mat)
df





