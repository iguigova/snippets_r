#http://www.mayin.org/ajayshah/KB/R/
#http://cran.r-project.org/doc/contrib/Paradis-rdebuts_en.pdf
#setwd("C:/BLUE/Sandbox/R/MeetupQry")

# Make a panel of pictures
par(mfrow=c(2,2))

# Read Meetup Member Information: provide the path to the csv files if necessary
B <- read.table("MeetupQry_DV_032811.csv", sep=",", col.names=c("Name", "J", "Joined", "V", "Visited", "Topics", "Pic"))
#B <- read.table("MeetupQry_R_032811.csv", sep=",", col.names=c("Name", "J", "Joined", "V", "Visited", "Topics", "Pic"))

# Mark when the group was founded
founded.on = min(B$Joined)

# Convert date (in milliseconds) to number of days since founded
B$Joined <- ((B$Joined - founded.on) * 1.15740741)/100000000
B$Visited <- ((B$Visited - founded.on) * 1.15740741)/100000000

# Factor the number of topics per person
topics.max <- max(B$Topics)
B$Topics <- B$Topics/topics.max

with(B, {symbols(Joined, Visited, thermometers=cbind(0.25, 1, Topics), inches=0.25, fg = (-1*Pic +  2), main = "Member Information", xlab="Joined (# days since founded)", ylab="Visited (# days since founded)" )})

with(B, {symbols(Joined, Visited, thermometers=cbind(0.25, 1, Topics), inches=0.25, fg = (-1*Pic +  2), main = "Member Information", xlab="Joined (# days since founded)", ylab="Visited (# days since founded)" )})
text(B$Joined, B$Visited, B$Name)

hist(B$Joined, xlab="Joined per day since founded", ylab="", main="Histogram")
hist(B$Visited, xlab="Visited per day since founded", ylab="", main="Histogram")
 

 
