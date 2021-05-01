#Load packages
library(ggplot2)
library(lubridate)

#Load Datafiles for each Citys Bike Data
chi<- read.csv("chicago.csv", sep = ",")
ny<- read.csv("new-york-city.csv", sep = ",")
wash<-read.csv("washington.csv", sep = ",")

##What months are the bikes used most?
#add cityname column to CHI and NYC data
ny<-cbind(c(rep("New York City", times=300000)), ny[,1:7])
colnames(ny)[1] <- "City"

chi<-cbind(c(rep("Chicago", times=300000)), chi[,1:7])
colnames(chi)[1] <- "City"

wash<-cbind(c(rep("Washington", times=300000)), wash)
colnames(wash)[1] <- "City"

##Compbine NYC, Wash and CHI data
multi<-rbind(chi, ny, wash)

##Pull out Month from rental start.time. Call it bike.month
bike.month <-month(as.POSIXct(multi$Start.Time, format = "%Y-%m-%d %H:%M:%S"))
multi<-cbind(multi, bike.month)

##Graph
ggplot(aes(x=bike.month), data= multi) +
  geom_histogram(aes(fill = as.factor(City)), show.legend = FALSE, binwidth=1, color = "black") +
  ggtitle('Bike Usage Per Month') +
  scale_x_continuous(breaks = seq(1, 6, 1)) +
  labs(x = "Month (Jan - June)", y = "Number of Bike Rentals") + 
  facet_wrap(~City)

#Summary
by(multi$bike.month, multi$City, )

####FINALLL Q2###
#QUESTION 2 - What months are the bikes used most?
#Load packages
library(ggplot2)
library(lubridate)

#Load Datafiles for each Citys Bike Data
chi<- read.csv("chicago.csv", sep = ",")
ny<- read.csv("new_york_city.csv", sep = ",")
wash<-read.csv("washington.csv", sep = ",")

#add cityname column to CHI and NYC data
ny<-cbind(c(rep("New York City", times=54770)), ny[,1:7])
colnames(ny)[1] <- "City"

chi<-cbind(c(rep("Chicago", times=8630)), chi[,1:7])
colnames(chi)[1] <- "City"

wash<-cbind(c(rep("Washington", times=89051)), wash)
colnames(wash)[1] <- "City"

##Compbine NYC, Wash and Chi data
multi<-rbind(chi, ny, wash)

##Pull out Month from rental start.time. Call it bike.month
bike.month <-month(as.POSIXct(multi$Start.Time, format = "%Y-%m-%d %H:%M:%S"))
multi<-cbind(multi, bike.month)

##Graph
ggplot(aes(x=bike.month), data= multi) +
  geom_histogram(aes(fill = as.factor(City)), show.legend = FALSE, binwidth=1, color = "black") +
  ggtitle('Bike Usage Per Month') +
  scale_x_continuous(breaks = seq(1, 6, 1)) +
  labs(x = "Month (January - June)", y = "Number of Bike Rentals") + 
  facet_wrap(~City)

by(multi$bike.month, multi$City, summary)
summary(multi$City)

#We see some interesting trends comparing bike users by month in each city. Over all, Washington has the most users (89051) compared to NYC (54770) and Chicago (8630). Perhaps this is due to a milder climate or perhaps the bike is a more efficient method of transportation in Washington and NYC. There was also a significant increasing trend of bike rentals in all cities in warmer months (May and June). In NYC and Washinton, the median bike usage landed in April. In Chicago, the median bike usage landed in May. 
