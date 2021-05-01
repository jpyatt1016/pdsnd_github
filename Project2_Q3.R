
##Q3 In Washington, how does trip duration differ between customers and subscribers?
#Load packages
library(ggplot2)

#Load Datafiles for each Citys Bike Data
chi<- read.csv("chicago.csv", sep = ",")
ny<- read.csv("new_york_city.csv", sep = ",")
wash<-read.csv("washington.csv", sep = ",")

#add cityname column to Chicago, Washington and NYC data
ny<-cbind(c(rep("New York City", times=54770)), ny[,1:7])
colnames(ny)[1] <- "City"

chi<-cbind(c(rep("Chicago", times=8630)), chi[,1:7])
colnames(chi)[1] <- "City"

wash<-cbind(c(rep("Washington D.C.", times=89051)), wash)
colnames(wash)[1] <- "City"

##Compbine NYC, Wash and Chi data
multi<-rbind(chi, ny, wash)

#Remove blanks in user.type data
multi<-multi[!(multi$User.Type== ""), ]

##Graph trip duration by user type. Only showing trip length < 1 hour.
ggplot(aes(x = User.Type, y=Trip.Duration), data = multi) +
  coord_cartesian(ylim =c(0, 3600)) +
  geom_boxplot(aes(fill = as.factor(City)), show.legend = FALSE) +
  facet_wrap(~City)
  

#Load packages
library(ggplot2)

#Load Datafiles for each Citys Bike Data
chi<- read.csv("chicago.csv", sep = ",")
ny<- read.csv("new_york_city.csv", sep = ",")
wash<-read.csv("washington.csv", sep = ",")

#add cityname column to Chicago, Washington and NYC data
ny<-cbind(c(rep("New York City", times=54770)), ny[,1:7])
colnames(ny)[1] <- "City"

chi<-cbind(c(rep("Chicago", times=8630)), chi[,1:7])
colnames(chi)[1] <- "City"

wash<-cbind(c(rep("Washington D.C.", times=89051)), wash)
colnames(wash)[1] <- "City"

##Compbine NYC, Wash and Chi data
multi<-rbind(chi, ny, wash)

#Remove blanks in user.type data
multi<-multi[!(multi$User.Type== ""), ]

##Graph trip duration by user type. Only showing trip length < 1 hour.
ggplot(aes(x = User.Type, y=Trip.Duration), data = multi) +
  coord_cartesian(ylim =c(0, 3600)) +
  geom_line(aes(fill = as.factor(City)), show.legend = FALSE) +
  labs(title = "Trip Durations of Customers and Subscribers", x = "", y = "Trip Duration (Minutes)") + 
  facet_wrap(~City)

**We found that in all cities, customers significantly used the bikeshare for longer trips than subscribers. The median trip duration for customers was 1450 minutes compared to a subscriber median trip duration of 568 minutes. Customers in Washington D.C. used the bikes for longer trips than customers in NYC and Chicago, perhaps due to different tourist needs. There was no change in trip durations of subscribers between cities.**