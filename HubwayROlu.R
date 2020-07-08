


#import hubway data
stations <- read.csv("hubway_stations.csv")
trips <- read.csv("hubway_trips.csv")
#STATION
#1. What are the column names?
colnames(stations)

#2. How many stations are there
length(unique(stations$station))

#3. Look at the summary of this data frame with Hubway station information. Some of these bike stations don't exist anymore; 
#create a data frame with only those that still exist. How many are left?

summary(stations)
# subsetting into a dataframe: [rows, columns]
stations_e <- stations[stations$status == "Existing"]

#TRIP 
#1. ) How many rows and columns does it have?
colnames(trips)

#2. How many unique user zip codes are in this dataset?
length(unique(trips$zip_code))

#3. How many unique bicycles are in this dataset?
length(unique(trips$bike_nr))

#4. Calculate the count of rides for each unique bicycle. 
table(trips$bike_nr)
bike_rides <- table(trips$bike_nr)


#5. Which bicycle is ridden most frequently?

which.max(bike_rides)

#6. Which bicycle is ridden least frequently?
which.min(bike_rides)

#7. Calculate the total duration of all rides for each bicycle. Hint: tapply() or aggregate()
aggregate(trips$duration,by=list(trips$bike_nr),FUN=sum)
dur_aggr <-aggregate(trips$duration,by=list(trips$bike_nr),FUN=sum)

#8. Which bicycle has been ridden for the longest total duration in this dataset?
dur_aggr[which.max(dur_aggr$x),]


#Shortest total duration?

dur_aggr[which.min(dur_aggr$x),]


#9. Consider only trips on the bicycle that has been ridden for the longest duration, Return the station ids.

#which station is its most frequent end station? 
max_tripsby<- subset(trips,bike_nr=='B00585')
maxtrips_table <- table(max_tripsby$end_statn)
which.max(maxtrips_table)

#Which station is its most frequent start station ?
max1_tripsby<- subset(trips,bike_nr=='B00585')
max1trips_table <- table(max1_tripsby$strt_statn)
which.max(max1trips_table)

#10. Look up the name of the above station ids in the stations data frame. What are the names of the most frequent start and end stations for this bicyc
