# print name and load library
print("Shanmuka Goda")
library(FSA)
library(FSAdata)
library(dplyr)
library(magrittr)
library(tidyr)
library(plyr)
library(tidyverse)
(.packages())


# Import the inchBio.csv and name the table
bio <-read.csv("/Users/shanmuka/Downloads/inchBio.csv", header=TRUE, sep=",")

# head, tail and structure
head(bio)
tail(bio)
str(bio)

# Create an object, <counts>
counts <-count(bio,"species")

# Display just the 8 levels (names) of the species
unique(bio$species)

# creating a tmp variable
tmp <-count(bio,"species")

# create subset
tmp2 <-bio%>%group_by(species)%>%slice_head(n=5)

# create w and display class of w
w<-table(bio$species)
class(w)

# create t and disply the results
t<-data.frame(w)
is.data.frame(t)

# display the frequency values from the <t> data frame
freq<-t[,2]
t$Freq

# create sSpec and show the class
cSpec<-table(bio$species)
class(cSpec)

# create SSpecPct with percentage and show the class
cSpecPct<-table(bio$species)/(676)*100
class(cSpecPct)

# convert the table into dataframe named u
u<-as.data.frame(cSpecPct)
is.data.frame(u)

# barPlot
barplot(cSpec,las=2, ylab="Counts",axis.lty=1, cex.names=.6,col="lightgreen",main="Fish Count")

# barPlot with Y-Axis limits
barplot(cSpecPct/100, ylim=c(0.0,0.4),las=2, ylab ="%",axis.lty = 1, cex.names=0.6,col="light blue",main="Fish Relative Frequency")

# ReArrenge the u with desc frequency and create d
d<-arrange(u, desc(Freq))

# rename d
names(d)[names(d)=="Freq"]<-"RelFreq"
names(d)[names(d)=="Var1"]<-"species"

# add new variables
d<-transform(d,cumfreq=cumsum(RelFreq))
DesCount<-as.data.frame(tmp[order(-tmp$freq),])
d<-transform(d,count=DesCount$freq)
d<-transform(d,cumcount=cumsum(count))

# create parameter variable
def_par<- par()

# create barplot
pc=barplot(d$count, width = 1,space = 0.15,border = F,axes = F,
           ylim = c(0, 3.05 * max(d$count, na.rm=T)),
           ylab = "Cummulative Counts",cex.names=0.7,
           names.arg = d$species,
           main="Species Pareto", sub = "Shanmuka Goda" ,
           cex.axis = 0.7,las=2)

# cumulative counts line adding 
lines(pc,d$cumcount,type = "b",cex=0.7,pch=19,col="cyan4")

# place grey box
box(col='grey62')

# add left side axis
axis(side=2,at=c(0,d$cumcount),las=2,col.axis="grey62",col="grey62",cex.axis=0.8)

# add right side axis details
axis(side=4,at=c(0,d$cumcount),labels=paste(c(0,round(d$cumfreq)),"%",sep=""),las=2,col.axis="cyan4",col="cyan4",cex.axis=0.8)

# Display the finished Species Pareto Plot
sub="Shanmuka Goda"

