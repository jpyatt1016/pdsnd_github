#Load packages
library(ggplot2)

#Load Datafiles for each Citys Bike Data
chi<- read.csv("chicago.csv", sep = ",")
ny<- read.csv("new-york-city.csv", sep = ",")
wash<-read.csv("washington.csv", sep = ",")

#Target Audience -What is the age of our user by gender?
#add cityname column to CHI and NYC data
ny<-cbind(c(rep("New York City", times=300000)), ny)
colnames()[1] <- "City"

chi<-cbind(c(rep("Chicago", times=300000)), chi)
colnames(chi)[1] <- "City"

##Compbine NYC and CHI data
multi<-rbind(chi, ny)

##Create a new column with age (based on dataset yr)
multi$Age <- (2017-multi$Birth.Year)

##Remove blanks in gender data
multi<-multi[!(multi$Gender== ""), ]

#Box plot of use age by gender. Removed users over 100 yrs age and under 16 (not likely)
ggplot(aes(x = Gender, y = Age), data = multi)  +
  geom_boxplot() +
  scale_y_continuous(breaks = seq(10,100, 10), lim = c(16, 100)) +
  facet_wrap(~City) +
  labs(title="Age and Gender of Users in Chicago and New York City")

#Symmary Stats
by(multi$Age, multi$City, summary)

###FINALL###
#QUESTION 1 - What is the age of bikeshare users by gender in Chicago and New York City?
#Load packages
library(ggplot2)

#Load Datafiles for each Citys Bike Data
chi<- read.csv("chicago.csv", sep = ",")
ny<- read.csv("new_york_city.csv", sep = ",")

#Check number of rows per dataset
dim(ny)
dim(chi)

#add cityname column to CHI and NYC data
ny<-cbind(c(rep("New York City", times=54770)), ny)
colnames(ny)[1] <- "City"

chi<-cbind(c(rep("Chicago", times=8630)), chi)
colnames(chi)[1] <- "City"

#Compbine NYC and CHI data
multi<-rbind(chi, ny)

#Create a new column with age (based on dataset year of 2017)
multi$Age <- (2017-multi$Birth.Year)

#Remove blanks in gender data
multi<-multi[!(multi$Gender== ""), ]

#Box plot of user age by gender. Removed users over 100 yrs age and under 15 (not likely)
ggplot(aes(x = Gender, y = Age), data = multi)  +
  geom_boxplot(aes(fill = as.factor(City)), show.legend = FALSE) +
  scale_y_continuous(breaks = seq(10,100, 10), lim = c(15, 100)) +
  facet_wrap(~City) +
  labs(title="Age and Gender of Bikeshare Users in Chicago and New York City")

#Symmary Stats
by(multi$Age, multi$City, summary)
by(multi$Age, multi$Gender, summary)

##When we look at the age of bikeshare users, Chicago had younger riders compared to NYC (Median age 33 compared to 36). New York City had a wider range age of users with the inner quartile spreading 18 years compared to an inner quartile spread of 14 years in Chicago. The median age of female riders (34 years) was younger than male riders (36 years).